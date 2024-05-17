package com.example.groupweb2.controller;

import com.example.groupweb2.dto.CategoryDTO;
import com.example.groupweb2.dto.ColorDTO;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.service.ICategoryService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@RestController
@RequestMapping("/category")
@AllArgsConstructor
public class CategoryController {
    private ICategoryService categoryService;

    @PostMapping()
    public ResponseEntity<?> addNewCategory(@RequestBody CategoryDTO category) {
        try {
            categoryService.saveNewCategory(category);
            var response = ResponseModel.builder()
                    .message(CustomMessage.CREATED.getMessage())
                    .statusCode(HttpStatus.CREATED.value())
                    .timestamp(new Date().toString())
                    .build();
            return ResponseEntity
                    .status(HttpStatus.CREATED)
                    .body(response);
        } catch (RuntimeException e) {
            var response = ResponseModel.builder()
                    .message(e.getMessage())
                    .statusCode(HttpStatus.CONTINUE.value())
                    .timestamp(new Date().toString())
                    .build();
            return ResponseEntity
                    .status(HttpStatus.CONFLICT)
                    .body(response);
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

//    @PostMapping("/color")
//    public String getColor(@RequestBody ColorDTO colorDTO){
//        return colorDTO.getColor();
//    }
}
