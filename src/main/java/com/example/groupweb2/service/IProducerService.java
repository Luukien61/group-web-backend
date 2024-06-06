package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.entity.ProducerEntity;

import java.util.List;
import java.util.Optional;

public interface IProducerService {
    List<ProducerEntity> findAllProducerByCategory(String category, boolean fetchProducts);
    void saveNewProducer(ProducerDTO producerDTO);
    ProducerEntity findProducerByName(String name);
    Optional<ProducerEntity> findProducerByNameOptional(String name);
    void updateProducer(ProducerDTO producerDTO, Long producerId);
    void deleteProducer(ProducerDTO producer);

}
