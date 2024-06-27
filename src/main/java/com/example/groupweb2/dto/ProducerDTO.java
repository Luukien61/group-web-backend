package com.example.groupweb2.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
@Builder
@AllArgsConstructor
public class ProducerDTO implements Serializable {
    private Long id;
    @NotBlank(message = "Producer name must not be blank")
    private String name;
}
