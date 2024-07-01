package com.example.groupweb2.mapper;

import org.mapstruct.factory.Mappers;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

@Configuration
public class MapperInstance {
    @Bean
    @Primary
    public MapStruct getMapper() {
        return Mappers.getMapper(MapStruct.class);
    }
}
