package com.example.groupweb2.service;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;

public interface ICategoryService {
    CategoryEntity findCategoryByName(String name);
    void saveNewCategory(CategoryEntity category);
    void saveNewCategory(CategoryDTO category);
}
