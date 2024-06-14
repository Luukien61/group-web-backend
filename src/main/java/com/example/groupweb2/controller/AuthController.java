package com.example.groupweb2.controller;

import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.model.RefreshTokenRequest;
import com.example.groupweb2.service.implement.UserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/auth")
@RestController
@AllArgsConstructor
public class AuthController {

    private final UserService userService;
    private AuthenticationManager authenticationManager;

    @PostMapping("/authenticate")
    public ResponseEntity<?> authenticate(@RequestBody LoginUser user){
        try{
            var authentication = authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(user.getEmail(),user.getPassword()));
            if(authentication==null || !authentication.isAuthenticated()) throw new RuntimeException();
            return ResponseEntity.ok("Authenticated");
        }catch (Exception e){
            throw new AccessDeniedException("Access denied");
        }

    }

    @PostMapping("/refresh-token")
    public ResponseEntity<?> refreshToken(@RequestBody RefreshTokenRequest request){
        try{
            var tokenResponse = userService.refreshToken(request.getRefreshToken(),request.getUserId());
            return ResponseEntity.ok(tokenResponse);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.FORBIDDEN.value());
        }
    }

}
