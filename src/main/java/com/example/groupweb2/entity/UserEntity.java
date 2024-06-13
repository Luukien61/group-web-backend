package com.example.groupweb2.entity;

import com.example.groupweb2.model.UserRole;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "staff_user")
public class UserEntity {
    @Id
    private Long staffID;
    private String fullName;
    private String email;
    private String password;
    private UserRole role;
    private String phone;
    private boolean activeState;
}
