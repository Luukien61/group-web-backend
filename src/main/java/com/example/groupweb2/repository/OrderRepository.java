package com.example.groupweb2.repository;

import com.example.groupweb2.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, String> {
    List<OrderEntity> findAllByDone(Boolean state);
    Optional<OrderEntity> findAllByOrderIdAndDone(String orderId, Boolean state);
}
