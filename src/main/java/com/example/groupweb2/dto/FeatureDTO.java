package com.example.groupweb2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class FeatureDTO extends BaseDTO {
    private String screen;
    private List<Integer> rearCamera;
    private List<Integer> frontCamera;
    private List<MemoryDTO> memory;
    private String OS;
    private int battery;
    //private Date madeTime;
    private String chip;

}
