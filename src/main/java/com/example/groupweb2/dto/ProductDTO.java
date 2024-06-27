package com.example.groupweb2.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class ProductDTO {
    private String id ;
    @NotBlank(message = "Product name must not be blank")
    private String name;
    private Integer available;
    private Integer ordering;
    private Integer totalQuantity;
    private List<PriceDTO> price;
    private FeatureDTO features;
    private DescriptionDTO description;
    private List<ColorDTO> color;
    private List<String> imgs;
    private CategoryDTO category;
    private ProducerDTO producer;
    private List<OrderDTO> orders;
    private RatingDTO rating;
}
