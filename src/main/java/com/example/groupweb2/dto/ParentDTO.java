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
public class ParentDTO {
    private Long id;
    private String name;
    private List<ChildDTO> children;
}
