package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;

import java.util.List;

public interface IProductService {
    void saveNewProduct(ProductEntity item);
    void saveNewProduct(ProductDTO item);
    void saveProducts(List<ProductEntity> item);
    List<ProductEntity> findAllByName(String name);
    void updateProduct(ProductDTO product,String productId );
    void deleteProduct(String productId);
    ProductEntity findProductById(String id);
    List<ProductEntity> findProductsByCategory(String category);
}
