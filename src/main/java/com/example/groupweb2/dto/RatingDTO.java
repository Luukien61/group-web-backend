package com.example.groupweb2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class RatingDTO {
    private Long id;
    private Float average;
    private Integer fiveStarts;
    private Integer fourStarts;
    private Integer threeStarts;
    private Integer twoStarts;
    private Integer oneStart;
}
