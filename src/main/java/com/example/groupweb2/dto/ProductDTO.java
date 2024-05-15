package com.example.groupweb2.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class ProductDTO extends BaseDTO {
    private String name;
    private List<MemoryDTO> price;
    private FeatureDTO features;
    private DescriptionDTO description;
    private List<ColorDTO> color;
    private List<String> imgs;
    private CategoryDTO category;

}
