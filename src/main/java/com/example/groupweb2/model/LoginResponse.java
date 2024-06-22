package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
@Builder
public class LoginResponse {
    private String message;
    private TokenResponse tokenResponse;
    private UserResponse user;

}
