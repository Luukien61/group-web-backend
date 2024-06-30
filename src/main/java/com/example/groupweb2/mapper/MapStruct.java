package com.example.groupweb2.mapper;

import com.example.groupweb2.dto.*;
import com.example.groupweb2.entity.*;
import com.example.groupweb2.model.UserResponse;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(uses = MapperHelper.class)
public interface MapStruct {
    CategoryDTO toCategoryDTO(CategoryEntity item);

    @Mapping(target = "product", ignore = true)
    CategoryEntity toCategoryEntity(CategoryDTO item);

    ColorDTO toColorDTO(ColorEntity item);

    @Mapping(target = "product", ignore = true)
    ColorEntity toColorEntity(ColorDTO item);

    DescriptionDTO toDescriptionDTO(DescriptionEntity item);

    @Mapping(target = "product", ignore = true)
    DescriptionEntity toDescriptionEntity(DescriptionDTO item);

    FeatureDTO toFeatureDTO(FeatureEntity item);

    @Mapping(target = "product", ignore = true)
    FeatureEntity toFeatureEntity(FeatureDTO item);

    PriceDTO toPriceDTO(PriceEntity item);

    @Mapping(target = "product", ignore = true)
    @Mapping(target = "feature", ignore = true)
    PriceEntity toPriceEntity(PriceDTO item);

    ProductDTO toProductDTO(ProductEntity item);


    ProductEntity toProductEntity(ProductDTO item);
    @Mapping(target = "products", ignore = true)
    @Mapping(target = "categories", ignore = true)
    ProducerEntity toProducerEntity(ProducerDTO item);

    ProducerDTO toProducerDTO(ProducerEntity item);

    CarouselEntity toCarouselEntity(CarouselDTO carouselDTO);

    CarouselDTO toCarouselDTO(CarouselEntity carouselEntity);

    UserDTO toUserDTO(UserEntity item);

    UserEntity toUserEntity(UserDTO item);

    UserResponse toUserResponse(UserEntity userEntity);


    @Mapping(target = "productId", source = "product", qualifiedByName = "getProductId")
    @Mapping(target = "productName",source = "product",qualifiedByName = "getProductName")
    @Mapping(target = "category",source = "product" ,qualifiedByName = "getCategory")
    OrderDTO toOrderDTO(OrderEntity orderEntity);
    @Mapping(source = "productId", target = "product", ignore = true)
    OrderEntity toOrderEntity(OrderDTO orderDTO);

    @Mapping(target = "product", ignore = true)
    RatingEntity toRatingEntity(RatingDTO ratingDTO);
    RatingDTO toRatingDTO(RatingEntity rating);
    @Mapping(target = "description", ignore = true)
    ContentChildEntity toContentChildEntity(ContentChildDTO contentChildDTO);
    ContentChildDTO toContentChildDTO(ContentChildEntity contentChild);

}
