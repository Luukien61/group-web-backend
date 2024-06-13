package com.example.groupweb2.service;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.model.LoginUser;

import java.util.List;

public interface IUserService {
    void saveNewUser(UserDTO userDTO);

    UserDTO findAllUserByStaffId(Long id);

    List<UserDTO> findAllUsers();

    UserEntity findUserByEmailAndPass(LoginUser requestUser);

//    UserDTO updateUser(UserDTO userDTO, Long userId);
//
//    void deleteUser(UserDTO userDTO);
}
