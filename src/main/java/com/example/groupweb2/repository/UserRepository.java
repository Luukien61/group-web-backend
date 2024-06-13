package com.example.groupweb2.repository;

import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.management.relation.Role;
import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long>{

    Optional<UserEntity> findByStaffID(Long staffId);

    List<UserEntity> findAllByRole(UserRole role);
    //List<UserEntity> findAllByFullNameContainingIgnoreCase(String name);
}
