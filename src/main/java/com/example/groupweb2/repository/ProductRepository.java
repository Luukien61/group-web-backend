package com.example.groupweb2.repository;

import com.example.groupweb2.entity.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    Page<ProductEntity> findAllByCategory(@Param("category") String category, Pageable pageable);

    @Query("select products from ProductEntity products where products.producer.name= :producer")
    Page<ProductEntity> findAllByProducer(@Param("producer") String producer,Pageable pageable);

    @Query("select products from ProductEntity products where products.producer.name= :producer")
    List<ProductEntity> findAllByProducer(@Param("producer") String producer);

    @Query("select products from ProductEntity products where products.producer.name= :producer " +
            "and products.category.name= :category")
    Page<ProductEntity> findAllByCategoryAndProducer(
            @Param("producer") String producer,
            @Param("category") String category,
            Pageable pageable);


    @Query("select p from ProductEntity p join p.price pr where p.category.name= :category and pr.currentPrice between :start and :end")
    Page<ProductEntity> findAllByCategoryAndPriceMinMax(
            @Param("category") String category,
            @Param("start") Long start,
            @Param("end") Long end,
            Pageable pageable);

    @Query("select p from ProductEntity p join p.price pr where p.category.name= :category and pr.currentPrice >= :start")
    Page<ProductEntity> findAllByCategoryAndPriceMin(
            @Param("category") String category,
            @Param("start") Long start,
            Pageable pageable);

    @Query("select p from ProductEntity p join p.price pr where p.producer.name= :producer " +
            "and p.category.name= :category and pr.currentPrice between :start and :end")
    Page<ProductEntity> findAllByCategoryAndProducerAndPriceMinMax(
            @Param("category") String category,
            @Param("producer") String producer,
            @Param("start") Long start,
            @Param("end") Long end,
            Pageable pageable);

    @Query("select p from ProductEntity p join p.price pr where p.producer.name= :producer " +
            "and p.category.name= :category and pr.currentPrice > :start")
    Page<ProductEntity> findAllByCategoryAndProducerAndPriceMin(
            @Param("category") String category,
            @Param("producer") String producer,
            @Param("start") Long start,
            Pageable pageable);

    @Query("select products from ProductEntity products where products.category.name= :category")
    Page<ProductEntity> findAllByCategoryIgnoreCasePage(@Param("category") String category, Pageable pageable);

    @Query("select products from ProductEntity products where products.category.name= :category and products.producer.name= :producer")
    Page<ProductEntity> findAllByCategoryAndProducerIgnoreCasePage(
            @Param("category") String category,
            @Param("producer") String producer,
            Pageable pageable);
}

