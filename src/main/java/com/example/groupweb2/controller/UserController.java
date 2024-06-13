package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.service.implement.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    @PostMapping
    public  ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDTO) {
        userService.saveNewUser(userDTO);
        return new ResponseEntity<>(userDTO, HttpStatus.CREATED);
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



}
