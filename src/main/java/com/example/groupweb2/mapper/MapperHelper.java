package com.example.groupweb2.mapper;

import com.example.groupweb2.entity.ProductEntity;
import lombok.NonNull;
import org.mapstruct.Named;
import org.springframework.stereotype.Component;

@Component
public class MapperHelper {

    @Named("getProductId")
    public String toProductId(@NonNull ProductEntity product){
        return product.getId();
    }

    @Named("getProductName")
    public String getProductName(@NonNull ProductEntity product){
        return product.getName();
    }

    @Named("getCategory")
    public String getCategory(@NonNull ProductEntity product){
        return product.getCategory().getName();
    }

}
