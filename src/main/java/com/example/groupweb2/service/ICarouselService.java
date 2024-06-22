package com.example.groupweb2.service;

import com.example.groupweb2.dto.CarouselDTO;
import com.example.groupweb2.entity.CarouselEntity;

import java.util.List;

public interface ICarouselService {
    List<CarouselEntity> findAll();
    void saveAnItem(CarouselDTO carouselDTO);
    void saveManyItems(List<CarouselDTO> items);
    void deleteAll();

    void refreshCarousel(List<CarouselDTO> items);
}
