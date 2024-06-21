package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.service.IUserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final IUserService userService;

    @PostMapping
    public  ResponseEntity<UserDTO> createUser(@RequestBody UserDTO userDTO) {
        userService.saveNewUser(userDTO);
        return new ResponseEntity<>(userDTO, HttpStatus.CREATED);
    }

    @GetMapping("/user-id/{userId}")
    public ResponseEntity<?> getUserById(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.findAllUserByStaffId(userId));
    }

    @GetMapping("/all")
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> userDTOS = userService.findAllUsers();
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("")
    public ResponseEntity<List<UserDTO>> getAllUsersByRole(@RequestParam("role") String role) {
        List<UserDTO> userDTOS = userService.findAllUsersByRole(role);
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PutMapping("/user-id/{userId}")
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO userDTO, @PathVariable Long userId) {
        return ResponseEntity.ok(userService.updateUser(userDTO, userId));
    }

    @PatchMapping("/active/{userId}")
    public ResponseEntity<UserDTO> activeUser(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.activeUser(userId));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PatchMapping("/inactive/{userId}")
    public ResponseEntity<?> deActiveUser(@PathVariable Long userId) {
        try{
            return ResponseEntity.ok(userService.inActiveUser(userId));
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }

    @DeleteMapping("/user-id/{userId}")
    public ResponseEntity<String> deleteUser(@PathVariable Long userId) {
        userService.deleteUser(userId);
        return ResponseEntity.ok("User Deleted Successfully!");
    }


}
