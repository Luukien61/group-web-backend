package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.*;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.ProductRepository;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.service.IProductService;
import com.example.groupweb2.util.UppercaseUtil;
import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
@AllArgsConstructor
public class ProductService implements IProductService {
    private MapStruct mapper;
    private ProductRepository productRepository;
    private ICategoryService categoryService;
    private IProducerService producerService;
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
        existProduct.setImgs(newProduct.getImgs());
        existProduct.setPrice(newProduct.getPrice());
        existProduct.setFeatures(newProduct.getFeatures());
        existProduct.setColor(newProduct.getColor());
        existProduct.setName(newProduct.getName());
        existProduct.setDescription(newProduct.getDescription());
        existProduct.setProducer(newProduct.getProducer());
        existProduct.setCategory(newProduct.getCategory());
        persistChildren(existProduct);
        productRepository.save(existProduct);
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

    @Override
    public List<ProductEntity> findProductsByCategory(String category) {
        category = UppercaseUtil.toFirstUppercase(category);
        return productRepository.findAllByCategory(category);
    }

    @Override
    public List<ProductEntity> findAllProductByProducer(String producer) {
        producer = UppercaseUtil.toFirstUppercase(producer);
        return productRepository.findAllByProducer(producer);
    }

    @Override
    public List<ProductEntity> findAllProductByCategoryAndProducer(String producer, String category) {
        category = UppercaseUtil.toFirstUppercase(category);
        producer = UppercaseUtil.toFirstUppercase(producer);
        return productRepository.findAllByCategoryAndProducer(producer, category);
    }



    @Override
    public List<ProductEntity> findAllProductByCategoryPriceMinMax(String category, Long start, Long end) {
        category = UppercaseUtil.toFirstUppercase(category);
        return productRepository.findAllByCategoryAndPriceMinMax(category,start,end);
    }

    @Override
    public List<ProductEntity> findAllProductByCategoryPriceMin(String category, Long start) {
        category = UppercaseUtil.toFirstUppercase(category);
        return productRepository.findAllByCategoryAndPriceMin(category,start);
    }

    @Override
    public List<ProductEntity> findAllProductByCategoryAndProducerAndPrice(String category, @Nullable String producer, @Nullable Long start, @Nullable Long end) {
        if(producer==null && start==null){
            return findProductsByCategory(category);
        }
        if(start==null){
            return findAllProductByCategoryAndProducer(producer,category);
        }
        if(producer==null){
            if(end==null){
                return findAllProductByCategoryPriceMin(category,start);
            }
            return findAllProductByCategoryPriceMinMax(category,start,end);
        }
        if(end==null){
            return productRepository.findAllByCategoryAndProducerAndPriceMin(category,producer,start);
        }
        return productRepository.findAllByCategoryAndProducerAndPriceMinMax(category, producer, start, end);
    }

    private void persistChildren(ProductEntity productEntity) {
        var category = productEntity.getCategory();
        var colors = productEntity.getColor();
        var description = productEntity.getDescription();
        var feature = productEntity.getFeatures();
        var memories = productEntity.getPrice();
        var producer = productEntity.getProducer();

        for (ColorEntity item : colors) {
            item.setProduct(productEntity);
        }
        description.setProduct(productEntity);
        feature.setProduct(productEntity);
        for (PriceEntity item : memories) {
            item.setProduct(productEntity);
            item.setFeature(feature);
        }
        persistProducerAndCategory(producer,category,productEntity);
    }

    private void persistProducerAndCategory(ProducerEntity producer, CategoryEntity category, ProductEntity productEntity) {
        try {
            var existProducer = producerService.findProducerByNameOPtional(producer.getName())
                    .orElse(producer);
            var producerItems = existProducer.getProducts();
            if (producerItems ==null) {
                producerItems = new ArrayList<>();
            }
            producerItems.add(productEntity);
            existProducer.setProducts(producerItems);

            var existCategory = categoryService.findCategoryByNameOptional(category.getName())
                    .orElse(category);
            var categoryItems = existCategory.getProduct();
            if (categoryItems == null) {
                categoryItems = new ArrayList<>();
            }
            categoryItems.add(productEntity);
            existCategory.setProduct(categoryItems);

            var categoryProducers = existCategory.getProducers();
            if(categoryProducers==null){
                categoryProducers = new HashSet<>();
            }
            categoryProducers.add(existProducer);
            existCategory.setProducers(categoryProducers);
            var producerCategories = existProducer.getCategories();
            if(producerCategories==null){
                producerCategories=new HashSet<>();
            }
            producerCategories.add(existCategory);
            existProducer.setCategories(producerCategories);
            productEntity.setCategory(existCategory);
            productEntity.setProducer(existProducer);
        } catch (RuntimeException ignored) {
        }
    }
}
