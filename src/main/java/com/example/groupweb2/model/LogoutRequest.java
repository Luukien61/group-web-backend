package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter
public class LogoutRequest {
    private String accessToken;
    private String refreshToken;
}
