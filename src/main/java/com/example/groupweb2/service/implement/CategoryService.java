package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.CategoryRepository;
import com.example.groupweb2.service.ICategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@AllArgsConstructor
public class CategoryService implements ICategoryService {
    private CategoryRepository categoryRepository;
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
        if(exitsCategory.isEmpty()){
            categoryRepository.save(category);
        }else {
            throw new RuntimeException(ALREDY_EXIST);
        }
    }

    @Override
    public void saveNewCategory(CategoryDTO category) {
        var categoryName = category.getName();
        var completeCategory = categoryName.substring(0,1).toUpperCase()+categoryName.substring(1);
        category.setName(completeCategory);
        var categoryEntity = mapper.toCategoryEntity(category);
        saveNewCategory(categoryEntity);
    }

    @Override
    public void updateCategory(CategoryDTO category, Long id) {
        var existCategory = categoryRepository.findAllById(id)
                .orElseThrow(()->new RuntimeException(NOT_EXIST));
        existCategory.setName(category.getName());
        categoryRepository.save(existCategory);
    }

    @Override
    public Optional<CategoryEntity> findCategoryByNameOptional(String name) {
        return categoryRepository.findAllByNameIgnoreCase(name);
    }
}
