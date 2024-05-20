package com.example.groupweb2.repository;

import com.example.groupweb2.entity.CarouselEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CarouselRepository extends JpaRepository<CarouselEntity, Long> {
}
