package com.example.groupweb2.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
public class MailTemplate {
    private String to;
    private String subject;
    private String body;
}
