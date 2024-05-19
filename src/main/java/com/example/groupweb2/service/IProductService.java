package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import jakarta.annotation.Nullable;

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
    List<ProductEntity> findAllProductByProducer(String producer);
    List<ProductEntity> findAllProductByCategoryAndProducer(String producer, String category);

    List<ProductEntity> findAllProductByCategoryPriceMinMax(String category, Long start, Long end);
    List<ProductEntity> findAllProductByCategoryPriceMin(String category, Long start);
    List<ProductEntity> findAllProductByCategoryAndProducerAndPrice(String category, @Nullable String producer, @Nullable Long start, @Nullable Long end);
}
