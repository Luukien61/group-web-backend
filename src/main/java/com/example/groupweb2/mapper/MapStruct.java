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

    CategoryEntity toCategoryEntity(CategoryDTO item);

    ColorDTO toColorDTO(ColorEntity item);

    ColorEntity toColorEntity(ColorDTO item);

    DescriptionDTO toDescriptionDTO(DescriptionEntity item);

    DescriptionEntity toDescriptionEntity(DescriptionDTO item);

    FeatureDTO toFeatureDTO(FeatureEntity item);

    FeatureEntity toFeatureEntity(FeatureDTO item);

    PriceDTO toPriceDTO(PriceEntity item);

    PriceEntity toPriceEntity(PriceDTO item);

    ProductDTO toProductDTO(ProductEntity item);

    ProductEntity toProductEntity(ProductDTO item);

    ProducerEntity toProducerEntity(ProducerDTO item);

    ProducerDTO toProducerDTO(ProducerEntity item);

    CarouselEntity toCarouselEntity(CarouselDTO carouselDTO);

    CarouselDTO toCarouselDTO(CarouselEntity carouselEntity);

    UserDTO toUserDTO(UserEntity item);

    UserEntity toUserEntity(UserDTO item);

    UserResponse toUserResponse(UserEntity userEntity);

//    List<ColorDTO> toListColorDTO(List<ColorEntity> items);
//
//    List<ColorEntity> toListColorEntity(List<ColorDTO> items);
//
//    List<PriceDTO> toListPriceDTO(List<PriceEntity> items);
//
//    List<PriceEntity> toListPriceEntity(List<PriceDTO> items);
//

    @Mapping(target = "productId", source = "product", qualifiedByName = "getProductId")
    @Mapping(target = "productName",source = "product",qualifiedByName = "getProductName")
    @Mapping(target = "category",source = "product" ,qualifiedByName = "getCategory")
    OrderDTO toOrderDTO(OrderEntity orderEntity);
    @Mapping(source = "productId", target = "product", ignore = true)
    OrderEntity toOrderEntity(OrderDTO orderDTO);



    //    List<DescriptionDTO> toListDescriptionDTO(List<DescriptionEntity> items);
//    List<DescriptionEntity> toListDescriptionEntity(List<DescriptionDTO> items);
//    List<FeatureDTO> toListFeatureDTO(List<FeatureEntity> items);
//    List<FeatureEntity> toListFeatureEntity(List<FeatureDTO> items);
//    List<CategoryDTO> toListCategoryDTO(List<CategoryEntity> items);
//    List<CategoryEntity> toListCategoryEntity(List<CategoryDTO> items);
}
