package com.example.groupweb2.mapper;

import com.example.groupweb2.dto.*;
import com.example.groupweb2.entity.*;
import org.mapstruct.Mapper;

import java.util.List;

@Mapper
public interface MapStruct {
    CategoryDTO toCategoryDTO(CategoryEntity item);

    CategoryEntity toCategoryEntity(CategoryDTO item);

    ColorDTO toColorDTO(ColorEntity item);

    ColorEntity toColorEntity(ColorDTO item);

    DescriptionDTO toDescriptionDTO(DescriptionEntity item);

    DescriptionEntity toDescriptionEntity(DescriptionDTO item);

    FeatureDTO toFeatureDTO(FeatureEntity item);

    FeatureEntity toFeatureEntity(FeatureDTO item);

    MemoryDTO toMemoryDTO(MemoryEntity item);

    MemoryEntity toMemoryEntity(MemoryDTO item);

    ProductDTO toProductDTO(ProductEntity item);

    ProductEntity toProductEntity(ProductDTO item);

    List<ColorDTO> toListColorDTO(List<ColorEntity> items);

    List<ColorEntity> toListColorEntity(List<ColorDTO> items);

    List<MemoryDTO> toListMemoryDTO(List<MemoryEntity> items);

    List<MemoryEntity> toListMemoryEntity(List<MemoryDTO> items);

    List<ProductDTO> toListProductDTO(List<ProductEntity> items);

    List<ProductEntity> toListProductEntity(List<ProductDTO> items);


    //    List<DescriptionDTO> toListDescriptionDTO(List<DescriptionEntity> items);
//    List<DescriptionEntity> toListDescriptionEntity(List<DescriptionDTO> items);
//    List<FeatureDTO> toListFeatureDTO(List<FeatureEntity> items);
//    List<FeatureEntity> toListFeatureEntity(List<FeatureDTO> items);
//    List<CategoryDTO> toListCategoryDTO(List<CategoryEntity> items);
//    List<CategoryEntity> toListCategoryEntity(List<CategoryDTO> items);
}
