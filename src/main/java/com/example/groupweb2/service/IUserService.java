package com.example.groupweb2.service;

import com.example.groupweb2.dto.UserDTO;

import java.util.List;

public interface IUserService {
    void saveNewUser(UserDTO userDTO);

    UserDTO findAllUserByStaffId(Long id);

    List<UserDTO> findAllUsers();
}
