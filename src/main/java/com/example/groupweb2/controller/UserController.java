package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.service.IUserService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@AllArgsConstructor
@RestController
@RequestMapping("/user")
public class UserController {
    private final IUserService userService;

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping
    public  ResponseEntity<?> createUser(@RequestBody UserDTO userDTO) {
        try {
            userService.saveNewUser(userDTO);
            return new ResponseEntity<>(userDTO, HttpStatus.CREATED);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }

    @GetMapping("/user-id/{userId}")
    public ResponseEntity<?> getUserById(@PathVariable Long userId) {
        return ResponseEntity.ok(userService.findAllUserByStaffId(userId));
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("/all")
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserDTO> userDTOS = userService.findAllUsers();
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @GetMapping("")
    public ResponseEntity<List<UserDTO>> getAllUsersByRole(@RequestParam("role") String role) {
        var authentication = SecurityContextHolder.getContext().getAuthentication();

        List<UserDTO> userDTOS = userService.findAllUsersByRole(role);
        return new ResponseEntity<>(userDTOS, HttpStatus.OK);
    }

    @PutMapping("/user-id/{userId}")
    public ResponseEntity<UserDTO> updateUser(@RequestBody UserDTO userDTO, @PathVariable Long userId) {
        return ResponseEntity.ok(userService.updateUser(userDTO, userId));
    }

    @PreAuthorize("hasRole('ADMIN')")
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

    @PostMapping("/reset-password")
    public ResponseEntity<?> resetPassword(@RequestBody LoginUser user){
        try{
            var response = userService.resetPassword(user);
            return ResponseEntity.ok(response);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.UNAUTHORIZED.value());
        }
    }

    @PostMapping("/email")
    public ResponseEntity<?> getUserByEmail(@RequestBody LoginUser user){
        try{
            var response = userService.findUserByEmail(user.getEmail());
            return ResponseEntity.ok(response);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }
}
