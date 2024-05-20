package com.example.groupweb2.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@Builder
public class CarouselDTO extends BaseDTO{
    @JsonProperty("img")
    private String imageUrl;
    @JsonProperty("url")
    private String targetUrl;
    @JsonProperty("title")
    private String title;
}
