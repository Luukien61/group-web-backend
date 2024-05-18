package com.example.groupweb2.repository;

import com.example.groupweb2.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, String> {
    Optional<ProductEntity> findAllByName(String name);

    List<ProductEntity> findAllByNameContaining(String name);
    List<ProductEntity> findAllByIdContaining(String id);
    Optional<ProductEntity> findAllById(String productId);

    @Query("select products from ProductEntity products where products.category.name= :category")
    List<ProductEntity> findAllByCategory(@Param("category") String category);

    @Query("select products from ProductEntity products where products.producer.name= :producer")
    List<ProductEntity> findAllByProducer(@Param("producer") String producer);

    @Query("select products from ProductEntity products where products.producer.name= :producer " +
            "and products.category.name= :category")
    List<ProductEntity> findAllByCategoryAndProducer(
            @Param("producer") String producer,
            @Param("category") String category);

}

