package com.example.groupweb2.mapper;

import org.mapstruct.factory.Mappers;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MapperInstance {
    @Bean
    public MapStruct getMapper() {
        return Mappers.getMapper(MapStruct.class);
    }
}
