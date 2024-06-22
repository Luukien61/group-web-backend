package com.example.groupweb2.security.filter;

import com.example.groupweb2.util.AppConst;
import com.example.groupweb2.security.jwt.provider.IJWTProvider;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@AllArgsConstructor
@Service
public class JWTAuthenticationFilter extends OncePerRequestFilter {

    private IJWTProvider provider;
    private UserDetailsService userDetailsService;

    @Override
    protected void doFilterInternal(
            @NonNull HttpServletRequest request,
            @NonNull HttpServletResponse response,
            @NonNull FilterChain filterChain) throws ServletException, IOException
    {
        String tokenType = AppConst.BEARER;
        String authHeader = request.getHeader(AppConst.AUTHORIZATION);
        if(authHeader==null || !authHeader.startsWith(tokenType)){
            filterChain.doFilter(request,response);
            return;
        }
        String token = authHeader.substring(tokenType.length());
        String userEmail = provider.exactUserName(token);
        if(userEmail !=null && SecurityContextHolder.getContext().getAuthentication()==null){
            var userDetail = userDetailsService.loadUserByUsername(userEmail);
            if(provider.isTokenValid(token,userDetail)){
                var authToken = new UsernamePasswordAuthenticationToken(
                        userDetail,
                        null,
                        userDetail.getAuthorities()
                );
                authToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authToken);
            }
        }
        filterChain.doFilter(request,response);
    }

}
