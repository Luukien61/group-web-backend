package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class UserResponse {
    private Long staffID;
    private String fullName;
    private String email;
    private String phone;
    private UserRole role;
}
