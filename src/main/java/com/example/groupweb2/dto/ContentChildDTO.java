package com.example.groupweb2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Builder
@Getter
@Setter
@AllArgsConstructor
public class ContentChildDTO extends BaseDTO {
    private String title;
    private String content;
    private String image;
}
