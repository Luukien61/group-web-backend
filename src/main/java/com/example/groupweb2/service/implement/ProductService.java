package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.ProductDTO;
import com.example.groupweb2.entity.*;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.ColorRepository;
import com.example.groupweb2.repository.ProductRepository;
import com.example.groupweb2.service.ICategoryService;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.service.IProductService;
import com.example.groupweb2.util.UppercaseUtil;
import jakarta.annotation.Nullable;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClient;

import java.security.InvalidParameterException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
@AllArgsConstructor
@RequiredArgsConstructor
public class ProductService implements IProductService {
    @Autowired
    private MapStruct mapper;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ColorRepository colorRepository;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IProducerService producerService;
    private final String NOT_EXIST = "The product does not exist";
    private final String EXISTED = "The product already exists";
    @Autowired
    private RestClient restClient;

    @Value("${cloudinary.api-secret}")
    private String API_SECRET;
    @Value("${cloudinary.cloud-name}")
    private String CLOUD_NAME;
    @Value("${cloudinary.api-key}")
    private String API_KEY;

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
        /*
        remove color by yourself

        List<ColorEntity> deletedColors = mergeChildList(existProduct.getColor(), newProduct.getColor());
        for(ColorEntity item : deletedColors){
            existProduct.removeColor(item);
            colorRepository.delete(item);
        }

        existProduct.setColor(newProduct.getColor());
         */

        existProduct.getColor().clear();
        existProduct.getColor().addAll(newProduct.getColor());

        existProduct.setName(newProduct.getName());
        existProduct.setImgs(newProduct.getImgs());

        existProduct.setTotalQuantity(newProduct.getTotalQuantity());
        existProduct.setPrice(newProduct.getPrice());

        existProduct.setDescription(newProduct.getDescription());
        existProduct.setProducer(newProduct.getProducer());
        existProduct.setCategory(newProduct.getCategory());
        existProduct.setFeatures(newProduct.getFeatures());
        persistChildren(existProduct);
        productRepository.save(existProduct);
    }

    private <T extends BaseEntity, S> List<T> mergeChildList(List<T> oldChild, List<T> newChild) {
        int dummyValue = 1;
        List<T> deletedRecord = new ArrayList<>();
        Map<Long, Integer> newIdMap = new HashMap<>();
        newChild.forEach(t -> newIdMap.put(t.getId(), dummyValue));
        for (T item : oldChild) {
            if (!newIdMap.containsKey(item.getId())) {
                deletedRecord.add(item);
            }
        }
        return deletedRecord;
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
        category = UppercaseUtil.toFirstUppercase(category);
        try {
            return productRepository.countAllByCategory(category);
        } catch (RuntimeException e) {
            throw new RuntimeException("En error occurred");
        }
    }

    private String getPublicId(String imageUrl) {
        Pattern pattern = Pattern.compile("v[0-9]+/[A-z0-9]+\\.\\w{3,4}$");
        Matcher matcher = pattern.matcher(imageUrl);
        List<String> matchs = new ArrayList<>();
        if (matcher.find()) {
            matchs.add(matcher.group());
        }
        var rawID = matchs.getLast();
        var ids = rawID.split("/")[1];
        return ids.split("\\.")[0];
    }

    private String calculateSignature(String params) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-1");
            byte[] hashBytes = digest.digest((params + API_SECRET).getBytes());
            return Base64.getUrlEncoder().withoutPadding().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error calculating Cloudinary signature", e);
        }
    }


    public void deleteImages(String imageUrl) {
        String publicId = getPublicId(imageUrl);
        String timestamp = String.valueOf(Math.round((float) System.currentTimeMillis() / 1000));
        String signature = calculateSignature("public_id=" + publicId + "&timestamp=" + timestamp);
        String url = "https://api.cloudinary.com/v1_1/" + CLOUD_NAME + "/image/destroy";
        MultiValueMap<String, String> formData = new LinkedMultiValueMap<>();
        formData.add("public_id", publicId);
        formData.add("signature", signature);
        formData.add("api_key", API_KEY);
        formData.add("timestamp", timestamp);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(formData, headers);
        ResponseEntity<Void> response = restClient.post()
                .uri(url)
                .contentType(MediaType.APPLICATION_JSON)
                .body(request)
                .retrieve()
                .toBodilessEntity();
    }


    private ProductEntity getExistProduct(String productId){
        var productOptional = productRepository.findAllById(productId.trim().toLowerCase());
        if(productOptional.isEmpty()) throw new InvalidParameterException(NOT_EXIST);
        return productOptional.get();
    }
}
