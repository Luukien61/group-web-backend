package com.example.groupweb2.repository;

import com.example.groupweb2.entity.PriceEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MemoryRepository extends JpaRepository<PriceEntity, Long> {
}
