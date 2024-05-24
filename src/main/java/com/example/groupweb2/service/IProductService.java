package com.example.groupweb2.service;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.ProductEntity;
import jakarta.annotation.Nullable;
import org.springframework.data.domain.Page;

import java.util.List;

public interface IProductService {
    void saveNewProduct(ProductEntity item);
    void saveNewProduct(ProductDTO item);
    void saveProducts(List<ProductEntity> item);
    List<ProductEntity> findAllByName(String name);
    void updateProduct(ProductDTO product,String productId );
    void deleteProduct(String productId);
    ProductEntity findProductById(String id);
    Page<ProductEntity> findProductsByCategory(String category, int page, int size , String sortBy);
    Page<ProductEntity> findAllProductByProducer(List<String> producer, int page, int size , String sortBy);
    Page<ProductEntity> findAllProductByCategoryAndProducer(List<String> producer, String category, int page, int size , String sortBy);

    Page<ProductEntity> findAllProductByCategoryPriceMinMax(String category, Long start, Long end, int page, int size , String sortBy);
    Page<ProductEntity> findAllProductByCategoryPriceMin(String category, Long start, int page, int size , String sortBy);
    Page<ProductEntity> findAllProductByCategoryAndProducerAndPrice(String category, @Nullable List<String> producer, @Nullable Long start, @Nullable Long end,int page, int size, String sortBy);
}
