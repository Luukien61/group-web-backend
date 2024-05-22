package com.example.groupweb2.service;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;

import java.util.List;
import java.util.Optional;

public interface ICategoryService {
    CategoryEntity findCategoryByName(String name);
    Optional<CategoryEntity> findCategoryByNameOptional(String name);
    void saveNewCategory(CategoryEntity category);
    void saveNewCategory(CategoryDTO category);
    void updateCategory(CategoryDTO category, Long id);
    List<CategoryEntity> findAllCategory();
}
