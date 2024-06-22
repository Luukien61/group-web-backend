package com.example.groupweb2.dto;

import lombok.*;

@Getter
@Setter
@Builder
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
public class ColorDTO extends BaseDTO {
    private String color;
    private String link;
}
