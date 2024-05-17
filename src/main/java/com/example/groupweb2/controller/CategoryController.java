package com.example.groupweb2.controller;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/category")
@AllArgsConstructor
public class CategoryController {
    private ICategoryService categoryService;

    @PostMapping()
    public ResponseEntity<?> addNewCategory(@RequestBody CategoryDTO category) {
        try {
            categoryService.saveNewCategory(category);
            return ControllerUtil.response(CustomMessage.CREATED.getMessage(), HttpStatus.CREATED.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(),HttpStatus.CONTINUE.value());
        }
    }

    @GetMapping()
    public ResponseEntity<?> getCategory(@RequestParam(name = "name") String name){
        try{
            var category = categoryService.findCategoryByName(name);
            return ResponseEntity.status(HttpStatus.FOUND).body(category);
        }catch (RuntimeException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PutMapping("/{categoryId}")
    public ResponseEntity<?> updateCategory(@PathVariable String categoryId, @RequestBody CategoryDTO category){
        try{
            categoryService.updateCategory(category,Long.parseLong(categoryId));
            return ControllerUtil.response(CustomMessage.UPDATED.getMessage(), HttpStatus.OK.value());
        }catch (RuntimeException e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.NOT_MODIFIED.value());
        }
    }
}
