package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.CategoryRepository;
import com.example.groupweb2.service.ICategoryService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CategoryService implements ICategoryService {
    private CategoryRepository categoryRepository;
    private MapStruct mapper;

    @Override
    public CategoryEntity findCategoryByName(String name) {
        return categoryRepository.findAllByNameIgnoreCase(name)
                .orElseThrow(() -> new RuntimeException("The category does not exist"));
    }

    @Override
    public void saveNewCategory(CategoryEntity category) {
        var exitsCategory = categoryRepository.findAllByNameIgnoreCase(category.getName());
        if(exitsCategory.isEmpty()){
            categoryRepository.save(category);
        }else {
            throw new RuntimeException("The category already exists");
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
}
