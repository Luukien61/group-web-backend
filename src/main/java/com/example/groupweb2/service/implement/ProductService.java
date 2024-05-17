package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.CategoryEntity;
import com.example.groupweb2.entity.ColorEntity;
import com.example.groupweb2.entity.PriceEntity;
import com.example.groupweb2.entity.ProductEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.ProductRepository;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.service.IProductService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class ProductService implements IProductService {
    private MapStruct mapper;
    private ProductRepository productRepository;
    private ICategoryService categoryService;
    private final String NOT_EXIST = "The product does not exist";
    private final String EXISTED = "The product already exists";

    @Override
    public void saveNewProduct(ProductEntity item) {
        var existProduct = productRepository.findAllByName(item.getName());
        if (existProduct.isEmpty()) {
            productRepository.save(item);
        } else throw new RuntimeException(EXISTED);
    }


    @Override
    public void saveNewProduct(ProductDTO item) {
        var existProduct = productRepository.findAllByName(item.getName());
        if (existProduct.isEmpty()) {
            var productEntity = mapper.toProductEntity(item);
            persistChildren(productEntity);
            productRepository.save(productEntity);
        } else throw new RuntimeException(EXISTED);

    }

    private void persistChildren(ProductEntity productEntity) {
        var category = productEntity.getCategory();
        persistCategory(category, productEntity);
        var colors = productEntity.getColor();
        var description = productEntity.getDescription();
        var feature = productEntity.getFeatures();
        var memories = productEntity.getPrice();
        var categoryItems = category.getProduct();
        if (categoryItems == null) {
            categoryItems = new ArrayList<>();
        }
        categoryItems.add(productEntity);
        category.setProduct(categoryItems);
        for (ColorEntity item : colors) {
            item.setProduct(productEntity);
        }
        description.setProduct(productEntity);
        feature.setProduct(productEntity);
        for (PriceEntity item : memories) {
            item.setProduct(productEntity);
            item.setFeature(feature);
        }
    }

    private void persistCategory(CategoryEntity category, ProductEntity product) {
        try {
            var existCategory = categoryService.findCategoryByName(category.getName());
            product.setCategory(existCategory);
        } catch (RuntimeException ignored) {
        }
    }

    @Override
    public void saveProducts(List<ProductEntity> item) {

    }

    @Override
    public List<ProductEntity> findAllByName(String name) {
        return productRepository.findAllByIdContaining(name);
    }

    @Override
    public void updateProduct(ProductDTO product, String productId) {
        var existProduct = productRepository.findAllById(productId)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
        var newProduct = mapper.toProductEntity(product);
        newProduct.setId(existProduct.getId());
        persistChildren(newProduct);
        productRepository.save(newProduct);
    }

    @Override
    public void deleteProduct(String productId) {
        var existProduct = findProductById(productId);
        productRepository.delete(existProduct);
    }

    @Override
    public ProductEntity findProductById(String id) {
        return productRepository.findAllById(id)
                .orElseThrow(() -> new RuntimeException(NOT_EXIST));
    }
}
