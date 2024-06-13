package com.example.groupweb2.dto;

import com.example.groupweb2.model.UserRole;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {
    private Long staffID;
    private String fullName;
    private String email;
    private String password;
    private UserRole role;
    private String phone;
    private boolean activeState;
}
