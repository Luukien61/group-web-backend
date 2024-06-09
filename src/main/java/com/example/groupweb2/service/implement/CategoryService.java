package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.entity.ProducerEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.CategoryRepository;
import com.example.groupweb2.repository.ProducerRepository;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.util.UppercaseUtil;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
@AllArgsConstructor
public class CategoryService implements ICategoryService {
    private CategoryRepository categoryRepository;
    private ProducerRepository producerRepository;
    private MapStruct mapper;
    private final String NOT_EXIST = "The category does not exist";
    private final String ALREDY_EXIST = "The category already exists";

    @Override
    public CategoryEntity findCategoryByName(String name) {
        return categoryRepository.findAllByNameIgnoreCase(name)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
    }

    @Override
    public void saveNewCategory(CategoryEntity category) {
        var exitsCategory = categoryRepository.findAllByNameIgnoreCase(category.getName());
        if (exitsCategory.isEmpty()) {
            category.setName(UppercaseUtil.toFirstUppercase(category.getName()));
            persistProducers(category);
            categoryRepository.save(category);
        } else {
            throw new RuntimeException(ALREDY_EXIST);
        }
    }

    private void persistProducers(CategoryEntity category) {
        var producers = category.getProducers();
        Set<ProducerEntity> newProducers = new HashSet<>();
        for (ProducerEntity producer : producers) {
            var existProducerOptional = producerRepository.findAllByNameIgnoreCase(producer.getName());
            if (existProducerOptional.isPresent()) {
                var existProducer = existProducerOptional.get();
                var newCategories = existProducer.getCategories();
                newCategories.add(category);
                existProducer.setCategories(newCategories);
                newProducers.add(existProducer);
            } else {
                var newCategory = new HashSet<CategoryEntity>();
                newCategory.add(category);
                producer.setCategories(newCategory);
                newProducers.add(producer);
            }
        }
        category.setProducers(newProducers);
    }

    @Override
    public void saveNewCategory(CategoryDTO category) {
        var categoryName = category.getName();
        var completeCategory = categoryName.substring(0, 1).toUpperCase() + categoryName.substring(1);
        category.setName(completeCategory);
        var categoryEntity = mapper.toCategoryEntity(category);
        saveNewCategory(categoryEntity);
    }

    @Override
    public void updateCategory(CategoryDTO category, Long id) {
        var existCategory = categoryRepository.findAllById(id)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
        existCategory.setName(category.getName());
        categoryRepository.save(existCategory);
    }

    @Override
    public Optional<CategoryEntity> findCategoryByNameOptional(String name) {
        return categoryRepository.findAllByNameIgnoreCase(name);
    }

    @Override
    public List<CategoryEntity> findAllCategory() {
        return categoryRepository.findAll();
    }
}
