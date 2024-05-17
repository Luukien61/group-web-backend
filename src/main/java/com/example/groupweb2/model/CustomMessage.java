package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CustomMessage {
    CREATED("Created"),
    SUCCESS("Success");
    private final String message;
}
