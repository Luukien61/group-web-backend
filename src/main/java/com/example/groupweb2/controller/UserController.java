package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.service.implement.UserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    @PostMapping
    public  ResponseEntity<?> createUser(@RequestBody UserDTO userDTO) {
        try{
            userService.saveNewUser(userDTO);
            return new ResponseEntity<>(userDTO, HttpStatus.CREATED);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }

    @GetMapping("/user-id/{userId}")
    public ResponseEntity<UserDTO> getUserById(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.findAllUserByStaffId(userId));
    }

    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> userDTOS = userService.findAllUsers();
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginUser requestUser){
        try{
            var user = userService.findUserByEmailAndPass(requestUser);
            return ResponseEntity.ok(user);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }

}
