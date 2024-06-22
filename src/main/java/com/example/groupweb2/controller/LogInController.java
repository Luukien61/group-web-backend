package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.service.implement.UserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
public class LogInController {

    private final UserService userService;


    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody UserDTO userDTO){
        try{
             userService.registerNewUser(userDTO);
            return ResponseEntity.ok("CREATED");
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.FORBIDDEN.value());
        }
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginUser requestUser){
        try{
            var authentication = SecurityContextHolder.getContext().getAuthentication();
            if(authentication instanceof AnonymousAuthenticationToken){
                var token = userService.login(requestUser);
                return ResponseEntity.ok(token);
            }
            return ResponseEntity.ok("You have been authenticated");
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.NOT_FOUND.value());
        }
    }
}
