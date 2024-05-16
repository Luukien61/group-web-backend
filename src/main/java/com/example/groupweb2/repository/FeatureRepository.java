package com.example.groupweb2.repository;

import com.example.groupweb2.entity.FeatureEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FeatureRepository extends JpaRepository<FeatureEntity, Long> {
}
