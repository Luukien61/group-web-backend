package com.example.groupweb2.repository;

import com.example.groupweb2.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long>{

    Optional<UserEntity> findAllByStaffID(Long staffId);

    Optional<UserEntity> findByEmail(String email);
}
