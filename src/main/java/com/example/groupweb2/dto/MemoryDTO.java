package com.example.groupweb2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class MemoryDTO extends BaseDTO {
    int ram;
    int rom;
    long currentPrice;
    long previousPrice;
}
