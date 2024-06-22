package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.model.RatingRequest;
import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.service.IProductService;
import com.example.groupweb2.util.ControllerUtil;
import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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

    @GetMapping("/product-id/{productId}")
    public ResponseEntity<?> findProductById(@PathVariable String productId) {
        try {
            var result = productService.findProductById(productId);
            return ResponseEntity.status(HttpStatus.OK).body(result);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }

    }

    @PutMapping("/{productId}")
    public ResponseEntity<ResponseModel> updateProduct(@PathVariable String productId, @RequestBody ProductDTO productDTO) {
        try {
            productService.updateProduct(productDTO, productId);
            return ControllerUtil.response(CustomMessage.UPDATED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }


    @DeleteMapping("/{productId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseModel> deleteProduct(@PathVariable String productId) {
        try {
            productService.deleteProduct(productId);
            return ControllerUtil.response(CustomMessage.DELETED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }
    @GetMapping()
    public ResponseEntity<?> getProductsByProducer(
            @RequestParam("category") String category,
            @RequestParam("producer") @Nullable List<String> producer,
            @RequestParam("minPrice") @Nullable Long minPrice,
            @RequestParam("maxPrice") @Nullable Long maxPrice,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "20") int size,
            @RequestParam(value = "sort", defaultValue = "madeTime") String sort
    ) {
        try {
            Page<ProductEntity> result = productService
                    .findAllProductByCategoryAndProducerAndPrice(category, producer, minPrice, maxPrice, page, size, sort);
            return ResponseEntity.ok(result);
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_FOUND.value());
        }
    }

    @GetMapping("/searching/{productName}")
    public ResponseEntity<?> getProductByNameSearching(@PathVariable String productName) {
        try {
            var result = productService.searchProductsByName(productName);
            return ResponseEntity.status(HttpStatus.OK).body(result);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }


    @GetMapping("/home")
    public ResponseEntity<?> getConnection() {
        return ResponseEntity.ok("Connected");
    }


    @GetMapping("/quantity/{category}")
    public ResponseEntity<?> getProductQuantityByCategory(@PathVariable String category) {
        try {
            var quantity = productService.getProductQuantityByCategory(category);
            return ResponseEntity.status(200).body(quantity);
        } catch (Exception e) {
            return ResponseEntity
                    .status(HttpStatus.BAD_REQUEST)
                    .body(ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value()));
        }
    }

    @PostMapping("/rating/{productId}")
    public ResponseEntity<?> ratingProduct(@PathVariable String productId, @RequestBody RatingRequest request){
        try{
            var result = productService.ratingProduct(productId, request.getRate());
            return ResponseEntity.status(HttpStatus.OK).body(result);
        }catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

}
