package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.entity.ProducerEntity;

import java.util.List;
import java.util.Optional;
import java.util.Set;

public interface IProducerService {
    Set<ProducerEntity> findAllProducerByCategory(String category, boolean fetchProducts);
    void saveNewProducer(ProducerDTO producerDTO, String category);
    void saveProducers(List<ProducerDTO> items, String category);
    ProducerEntity findProducerByName(String name);
    Optional<ProducerEntity> findProducerByNameOptional(String name);
    void updateProducer(ProducerDTO producerDTO, Long producerId);
    void deleteProducer(ProducerDTO producer);

}
