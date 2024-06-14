package com.example.groupweb2.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class RefreshTokenRequest {
    @JsonProperty("user-id")
    private Long userId;
    private String refreshToken;
}
