package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.entity.ProducerEntity;

import java.util.List;
import java.util.Optional;

public interface IProducerService {
    List<String> findAllProducerByCategory(String category);
    void saveNewProducer(ProducerDTO producerDTO);
    ProducerEntity findProducerByName(String name);
    Optional<ProducerEntity> findProducerByNameOPtional(String name);
}
