package com.example.groupweb2.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ResponseModel {
    private String message;
    private int statusCode;
    private String timestamp;
}
