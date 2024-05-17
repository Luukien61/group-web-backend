package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum CustomMessage {
    CREATED("Created"),
    UPDATED("Updated"),
    SUCCESS("Success"),
    DELETED("Deleted");
    private final String message;
}
