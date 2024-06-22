package com.example.groupweb2.security;

import com.example.groupweb2.security.filter.JWTAuthenticationFilter;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.HttpStatusEntryPoint;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfigurationSource;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
@EnableMethodSecurity
public class SecurityConfiguration {
    private CorsConfigurationSource corsConfigurationSource;
    private JWTAuthenticationFilter jwtAuthenticationFilter;
    private AccessDeniedHandler accessDeniedHandler;
    private AuthenticationEntryPoint authenticationEntryPoint;
    private final String[] PUBLIC_ENDPOINTS = {
            "/product/**",
            "/category",
            "/producer/**",
            "/actuator/**",
            "/login",
            "/user/email",
            "/user/reset-password",
            "/auth/refresh-token",
            "/order/**"
    };

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .cors(corsConfigurer -> corsConfigurer.configurationSource(corsConfigurationSource))
                .csrf(AbstractHttpConfigurer::disable) // (1)
                .formLogin(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests((request) -> request
                        .requestMatchers(HttpMethod.GET,"/carousel").permitAll()
                        .requestMatchers("/user/user-id/*").hasAnyRole("ADMIN","STAFF")
                        .requestMatchers("register").hasRole("ADMIN")
                        //.requestMatchers(HttpMethod.DELETE,"product/*").hasRole("ADMIN")
                        .requestMatchers(PUBLIC_ENDPOINTS).permitAll()
                        .anyRequest().authenticated()
                )
                .sessionManagement(session-> session
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                .exceptionHandling(handler->handler
                        .accessDeniedHandler(accessDeniedHandler)
                        .authenticationEntryPoint(authenticationEntryPoint)
                )
        ;

        return http.build();
    }
}
/*
(1): Browsers send cookies along with all requests, CSRF attacks depend upon this behavior.
If you do not use cookies, and don't rely on cookies for authentication,
then there is absolutely no room for CSRF attacks, and no reason to put in CSRF protection.
If you have cookies, especially if you use them for authentication, then you need CSRF protection.
 */