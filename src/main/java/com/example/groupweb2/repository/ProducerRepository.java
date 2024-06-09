package com.example.groupweb2.repository;

import com.example.groupweb2.entity.ProducerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
@Repository
public interface ProducerRepository extends JpaRepository<ProducerEntity, Long> {
    Optional<ProducerEntity> findAllByNameIgnoreCase(String name);
    Optional<ProducerEntity> findAllById(Long id);

    @Query(value = "select producer from  producer_category pc where pc.category= :category", nativeQuery = true)
    List<String> findAllByCategories(String category);

    @Query(nativeQuery = true, value = "select count(*) from producer_category pc where lower(pc.producer)= lower(:producer) and lower(pc.category)= lower(:category)")
    Integer findAllByNameIgnoreCaseAndCategoris(
            @Param("producer") String producer,
            @Param("category") String category
    );

}
