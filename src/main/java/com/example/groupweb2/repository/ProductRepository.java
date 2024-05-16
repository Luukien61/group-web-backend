package com.example.groupweb2.repository;

import com.example.groupweb2.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, String> {
    Optional<ProductEntity> findAllByName(String name);

    List<ProductEntity> findAllByNameContaining(String name);
    List<ProductEntity> findAllByIdContaining(String id);
}

