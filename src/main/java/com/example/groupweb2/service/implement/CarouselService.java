package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.CarouselDTO;
import com.example.groupweb2.entity.CarouselEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.CarouselRepository;
import com.example.groupweb2.service.ICarouselService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CarouselService implements ICarouselService {

    private CarouselRepository carouselRepository;
    private MapStruct mapper;
    @Override
    public List<CarouselEntity> findAll() {
        return carouselRepository.findAll();
    }

    @Override
    public void saveAnItem(CarouselDTO carouselDTO) {
        var carousel = mapper.toCarouselEntity(carouselDTO);
        carouselRepository.save(carousel);
    }

    @Override
    public void saveManyItems(List<CarouselDTO> items) {
        items.forEach(this::saveAnItem);
    }

    @Override
    public void deleteAll() {
        carouselRepository.deleteAll();
    }
}
