package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.repository.CategoryRepository;
import com.example.groupweb2.service.ICategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CategoryService implements ICategoryService {
    private CategoryRepository categoryRepository;

    @Override
    public CategoryEntity findCategoryByName(String name) {
        return categoryRepository.findAllByCategory(name)
                .orElseThrow(() -> new RuntimeException("The category does not exist"));
    }

    @Override
    public void saveNewCategory(CategoryEntity category) {

    }

    @Override
    public void saveNewCategory(CategoryDTO category) {

    }
}
