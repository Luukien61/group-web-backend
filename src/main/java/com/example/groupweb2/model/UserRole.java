package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum UserRole {
    ADMIN("Quản lý"),
    USER("Nhân viên");;

    private final String role;

    @Override
    public String toString() {
        return this.getRole();
    }
}
