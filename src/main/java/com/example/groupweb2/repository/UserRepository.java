package com.example.groupweb2.repository;

import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long>{

    Optional<UserEntity> findAllByStaffID(Long staffId);

    Optional<UserEntity> findByEmail(String email);
    @Query("select user from UserEntity user where user.email= :email and user.activeState=true")
    Optional<UserEntity> findByEmailAndActiveState(@Param("email") String email);
    Optional<UserEntity> findByStaffID(Long staffId);

    List<UserEntity> findAllByRole(UserRole role);
    //List<UserEntity> findAllByFullNameContainingIgnoreCase(String name);
}
