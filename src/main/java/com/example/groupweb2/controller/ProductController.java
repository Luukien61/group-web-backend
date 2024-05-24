package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.service.IProductService;
import com.example.groupweb2.util.ControllerUtil;
import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
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


    @GetMapping()
    public ResponseEntity<?> getProductsByProducer(
            @RequestParam("category") String category,
            @RequestParam("producer") @Nullable List<String> producer,
            @RequestParam("minPrice") @Nullable Long minPrice,
            @RequestParam("maxPrice") @Nullable Long maxPrice,
            @RequestParam(value = "page",defaultValue = "0") int page,
            @RequestParam(value = "size",defaultValue = "20") int size,
            @RequestParam(value = "sort",defaultValue = "madeTime") String sort
    ) {
        try{
            Page<ProductEntity> result=productService
                    .findAllProductByCategoryAndProducerAndPrice(category,producer,minPrice,maxPrice,page,size,sort);
//            if (result.isEmpty()) return ControllerUtil
//                    .response(CustomMessage.NOT_FOUND.getMessage(), HttpStatus.NOT_FOUND.value());
            return ResponseEntity.ok(result);
        }catch (RuntimeException e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_FOUND.value());
        }
    }

}
