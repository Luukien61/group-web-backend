package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.entity.ProducerEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.ProducerRepository;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.util.UppercaseUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class ProducerService implements IProducerService {
    private ProducerRepository producerRepository;
    private final String NOT_EXIST = "The producer does not exist";
    private final String EXISTED = "The producer already exists";
    private MapStruct mapper;


    @Override
    public List<String> findAllProducerByCategory(String category) {
        category=UppercaseUtil.toFirstUppercase(category);
        return producerRepository.findAllByCategories(category);
    }

    @Override
    public void saveNewProducer(ProducerDTO producerDTO) {
        var existProducer = producerRepository.findAllByNameIgnoreCase(producerDTO.getName());
        if(existProducer.isPresent()) throw new RuntimeException(EXISTED);
        var newProducer = mapper.toProducerEntity(producerDTO);
        producerRepository.save(newProducer);
    }

    @Override
    public ProducerEntity findProducerByName(String name) {
        return producerRepository.findAllByNameIgnoreCase(name)
                .orElseThrow(()->new RuntimeException(NOT_EXIST));
    }

    @Override
    public Optional<ProducerEntity> findProducerByNameOPtional(String name) {
        return producerRepository.findAllByNameIgnoreCase(name);
    }
}
