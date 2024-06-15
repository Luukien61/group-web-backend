package com.example.groupweb2.controller;

import com.example.groupweb2.model.RefreshTokenRequest;
import com.example.groupweb2.service.implement.UserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RequestMapping("/auth")
@RestController
@AllArgsConstructor
public class AuthController {

    private final UserService userService;

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(){
        try{
            var authentication = SecurityContextHolder.getContext().getAuthentication();
            if(authentication instanceof UsernamePasswordAuthenticationToken) {
               return ResponseEntity.ok("Authenticated");
            }
            return ControllerUtil.response("Unauthenticated", HttpStatus.UNAUTHORIZED.value());
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }


    @PostMapping("/refresh-token")
    public ResponseEntity<?> refreshToken(@RequestBody RefreshTokenRequest request){
        try{
            var tokenResponse = userService.refreshToken(request.getRefreshToken());
            return ResponseEntity.ok(tokenResponse);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.FORBIDDEN.value());
        }
    }

}
