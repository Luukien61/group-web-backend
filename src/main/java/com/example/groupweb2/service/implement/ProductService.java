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
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
    public Page<ProductEntity> findProductsByCategory(String category, int page, int size, String sortBy) {
        category = UppercaseUtil.toFirstUppercase(category);
        Pageable pageable = getPage(page, size, sortBy);
        return productRepository.findAllByCategory(category, pageable);
    }

    @Override
    public Page<ProductEntity> findAllProductByProducer(List<String> producer, int page, int size, String sortBy) {
        producer = producer.stream().map(UppercaseUtil::toFirstUppercase).toList();
        Pageable pageable = getPage(page, size, sortBy);
        return productRepository.findAllByProducer(producer, pageable);
    }

    @Override
    public Page<ProductEntity> findAllProductByCategoryAndProducer(List<String> producer, String category, int page, int size, String sortBy) {
        category = UppercaseUtil.toFirstUppercase(category);
        producer = producer.stream().map(UppercaseUtil::toFirstUppercase).toList();
        Pageable pageable = getPage(page, size, sortBy);
        return productRepository.findAllByCategoryAndProducer(producer, category, pageable);
    }


    @Override
    public Page<ProductEntity> findAllProductByCategoryPriceMinMax(String category, Long start, Long end, int page, int size, String sortBy) {
        category = UppercaseUtil.toFirstUppercase(category);
        Pageable pageable = getPage(page, size, sortBy);
        return productRepository.findAllByCategoryAndPriceMinMax(category, start, end, pageable);
    }

    @Override
    public Page<ProductEntity> findAllProductByCategoryPriceMin(String category, Long start, int page, int size, String sortBy) {
        category = UppercaseUtil.toFirstUppercase(category);
        Pageable pageable = getPage(page, size, sortBy);
        return productRepository.findAllByCategoryAndPriceMin(category, start, pageable);
    }

    @Override
    public Page<ProductEntity> findAllProductByCategoryAndProducerAndPrice(
            String category,
            @Nullable List<String> producer,
            @Nullable Long start,
            @Nullable Long end,
            int page,
            int size,
            String sortBy
    ) {
        if (!sortBy.equals("name")) {
            sortBy = "features." + sortBy;
        }
        if (producer == null && start == null) {
            return findProductsByCategory(category, page, size, sortBy);
        }
        if (start == null) {
            return findAllProductByCategoryAndProducer(producer, category, page, size, sortBy);
        }
        if (producer == null) {
            if (end == null) {
                return findAllProductByCategoryPriceMin(category, start, page, size, sortBy);
            }
            return findAllProductByCategoryPriceMinMax(category, start, end, page, size, sortBy);
        }
        producer = producer.stream().map(UppercaseUtil::toFirstUppercase).toList();
        category = UppercaseUtil.toFirstUppercase(category);
        Pageable pageable = getPage(page, size, sortBy);
        if (end == null) {
            return productRepository.findAllByCategoryAndProducerAndPriceMin(category, producer, start, pageable);
        }
        return productRepository.findAllByCategoryAndProducerAndPriceMinMax(category, producer, start, end, pageable);
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
        persistProducerAndCategory(producer, category, productEntity);
    }

    private void persistProducerAndCategory(ProducerEntity producer, CategoryEntity category, ProductEntity productEntity) {
        try {
            var existProducer = producerService.findProducerByNameOptional(producer.getName())
                    .orElse(producer);
            var producerItems = existProducer.getProducts();
            if (producerItems == null) {
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
            if (categoryProducers == null) {
                categoryProducers = new HashSet<>();
            }
            categoryProducers.add(existProducer);
            existCategory.setProducers(categoryProducers);
            var producerCategories = existProducer.getCategories();
            if (producerCategories == null) {
                producerCategories = new HashSet<>();
            }
            producerCategories.add(existCategory);
            existProducer.setCategories(producerCategories);
            productEntity.setCategory(existCategory);
            productEntity.setProducer(existProducer);
        } catch (RuntimeException ignored) {
        }
    }

    private Pageable getPage(int page, int size, String sortBy) {
        Sort sort = Sort.by(sortBy).descending();
        return PageRequest.of(page, size, sort);
    }

    @Override
    public List<ProductEntity> searchProductsByName(String name) {
        return productRepository.findAllByNameContainingIgnoreCase(name);
    }

    @Override
    public int getProductQuantityByCategory(String category) {
        category=UppercaseUtil.toFirstUppercase(category);
        try {
            return productRepository.countAllByCategory(category);
        }catch (RuntimeException e){
            throw new RuntimeException("En error occurred");
        }
    }
}
