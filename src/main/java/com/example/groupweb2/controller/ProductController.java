package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.service.IProductService;
import com.example.groupweb2.util.ControllerUtil;
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
            return ControllerUtil.response(CustomMessage.CREATED.getMessage(), HttpStatus.CREATED.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

    @GetMapping("/{productName}")
    public ResponseEntity<List<ProductEntity>> findProductByName(@PathVariable String productName) {
        var result = productService.findAllByName(productName);
        if (!result.isEmpty()) return ResponseEntity.status(HttpStatus.FOUND).body(result);
        else return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
    }

    @PutMapping("/{productId}")
    public ResponseEntity<ResponseModel> updateProduct(@PathVariable String productId, @RequestBody ProductDTO productDTO) {
        try {
            productService.updateProduct(productDTO, productId);
            return ControllerUtil.response(CustomMessage.UPDATED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

    @DeleteMapping("/{productId}")
    public ResponseEntity<ResponseModel> deleteProduct(@PathVariable String productId) {
        try {
            productService.deleteProduct(productId);
            return ControllerUtil.response(CustomMessage.DELETED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

}
