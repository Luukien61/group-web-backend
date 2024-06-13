package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.UserRole;
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
        return ResponseEntity.ok(userService.findUserByStaffId(userId));
    }

    @GetMapping("/role/{role}")
    public ResponseEntity<List<UserDTO>> getAllUsersByRole(@PathVariable UserRole role) {
        List<UserDTO> userDTOS = userService.findAllUsersByRole(role);
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @GetMapping
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> userDTOS = userService.findAllUsers();
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PutMapping("/user-id/{userId}")
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO userDTO, @PathVariable Long userId) {
        return ResponseEntity.ok(userService.updateUser(userDTO, userId));
    }

    @PatchMapping("/user-id/{userId}/active")
    public ResponseEntity<UserDTO> activeUser(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.activeUser(userId));
    }

    @PatchMapping("/user-id/{userId}/deactive")
    public ResponseEntity<UserDTO> deactiveUser(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.deactiveUser(userId));
    }

    @DeleteMapping("/user-id/{userId}")
    public ResponseEntity<String> deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return ResponseEntity.ok("User Deleted Successfully!");
    }



}
