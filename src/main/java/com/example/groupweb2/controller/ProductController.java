package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.service.IProductService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {

    private IProductService productService;

    @PostMapping()
    public ResponseEntity<?> insertNewProduct(@RequestBody ProductDTO item) {
        try {
            productService.saveNewProduct(item);
            return ResponseEntity.status(HttpStatus.CREATED).body(null);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
        }
    }

    @GetMapping("/{productName}")
    public ResponseEntity<List<ProductEntity>> findProductByName(@PathVariable String productName){
        var result = productService.findAllByName(productName);
        if(!result.isEmpty()) return ResponseEntity.status(HttpStatus.FOUND).body(result);
        else return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

}
