package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.entity.ProducerEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.ProducerRepository;
import com.example.groupweb2.repository.ProductRepository;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.util.UppercaseUtil;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@AllArgsConstructor
public class ProducerService implements IProducerService {
    private ProducerRepository producerRepository;
    private ICategoryService categoryService;
    private ProductRepository productRepository;
    private static final String NOT_EXIST = "The producer does not exist";
    private static final String EXISTED = "The producer already exists";
    private MapStruct mapper;


    @Override
    @Transactional
    public Set<ProducerEntity> findAllProducerByCategory(String category, boolean fetchProducts) {
        category = UppercaseUtil.toFirstUppercase(category);
        var categoryEntity = categoryService.findCategoryByName(category);
        var producers = categoryEntity.getProducers();
        if (fetchProducts && !producers.isEmpty()) {
            producers.forEach(producerEntity -> Hibernate.initialize(producerEntity.getProducts()));
        }
        return producers;
    }

    @Override
    public void saveNewProducer(ProducerDTO producerDTO, String category) {
        var producerName = producerDTO.getName();
        if(!Objects.equals(producerName, "")){
            producerName = UppercaseUtil.toFirstUppercase(producerName);
            category = UppercaseUtil.toFirstUppercase(category);
            producerDTO.setName(producerName);
            var newProducer = mapper.toProducerEntity(producerDTO);
            persistCategory(newProducer, category);
        }
        else throw new RuntimeException("Please enter a valid name");
    }

    private void persistCategory(ProducerEntity newProducer, String category) {
        var existCategory = categoryService.findCategoryByName(category);
        if (existCategory == null) {
            throw new RuntimeException("Please add the new category first");
        }
        var exist = producerRepository.findAllByNameIgnoreCaseAndCategoris(newProducer.getName(), category);
        if (exist > 0) {
            throw new RuntimeException(EXISTED);
        }
        var producers = existCategory.getProducers();
        Set<CategoryEntity> categories = new HashSet<>();
        var existProducerOptional = producerRepository.findAllByNameIgnoreCase(newProducer.getName());
        if (existProducerOptional.isPresent()) {
            newProducer = existProducerOptional.get();
            categories = newProducer.getCategories();
        }
        producers.add(newProducer);
        existCategory.setProducers(producers);
        categories.add(existCategory);
        newProducer.setCategories(categories);
        producerRepository.save(newProducer);
    }

    @Override
    @Transactional
    public void saveProducers(List<ProducerDTO> items, String category) {
        items.forEach(producerDTO -> saveNewProducer(producerDTO, category));
    }

    @Override
    public ProducerEntity findProducerByName(String name) {
        return producerRepository.findAllByNameIgnoreCase(name)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
    }

    @Override
    public Optional<ProducerEntity> findProducerByNameOptional(String name) {
        return producerRepository.findAllByNameIgnoreCase(name);
    }

    @Override
    public void updateProducer(ProducerDTO producerDTO, Long producerId) {
        var existProducer = producerRepository
                .findAllById(producerId)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
        var existCategory = categoryService.findCategoryByName(producerDTO.getName());
        existCategory.getProducers().remove(existProducer);
        existProducer.setName(producerDTO.getName());
        existCategory.getProducers().add(existProducer);
        producerRepository.save(existProducer);
    }

    @Override
    public void deleteProducer(ProducerDTO producer) {
        String producerName = producer.getName();
        producerName = UppercaseUtil.toFirstUppercase(producerName);
        var exitsProducer = producerRepository
                .findAllByNameIgnoreCase(producerName)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
        var exitsProduct = productRepository.findAllByProducer(producerName);
        if (exitsProduct.isEmpty()) {
            producerRepository.delete(exitsProducer);
        } else {
            String PRODUCT_EXIST = "The producer still has its own products. Please remove all its products first";
            throw new RuntimeException(PRODUCT_EXIST);
        }
    }


}
