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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long staffID;
    private String fullName;
    private String email;
    private String password;
    @Enumerated(EnumType.STRING)
    private UserRole role;
    private String phone;
    private boolean activeState;
}
