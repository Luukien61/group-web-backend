package com.example.groupweb2.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Set;


@Getter
@Setter
@Builder
@AllArgsConstructor
public class CategoryDTO implements Serializable {
    private Long id;
    @NotBlank(message = "Category name must not be blank")
    private String name;
    private Set<ProducerDTO> producers;
}
