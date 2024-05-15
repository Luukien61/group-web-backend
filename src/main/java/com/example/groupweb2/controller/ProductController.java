package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ColorDTO;
import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.mapper.MapStruct;
import lombok.AllArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {

    private MapStruct mapper;
    @PostMapping()
    public ResponseEntity<?> insertNewProduct(@RequestBody ProductDTO item){
        var product = mapper.toProductEntity(item);
        return ResponseEntity.ok(product);
    }

    @GetMapping
    public ResponseEntity<?> getMessage(){
        return ResponseEntity.ok("hello");
    }

    @PostMapping("/color")
    public ResponseEntity<?> insertNewColor(@RequestBody ColorDTO colorDTO){
        var color = mapper.toColorEntity(colorDTO);
        return ResponseEntity.ok(color);
    }
}
