package com.example.groupweb2.service;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.UserRole;

import javax.management.relation.Role;
import java.util.List;

public interface IUserService {
    void saveNewUser(UserDTO userDTO);

    UserDTO findUserByStaffId(Long id);

    List<UserDTO> findAllUsers();

    List<UserDTO> findAllUsersByRole(UserRole role);

    UserDTO updateUser(UserDTO userDTO, Long userId);

    UserDTO activeUser(Long id);

    UserDTO deactiveUser(Long id);

    void deleteUser(Long id);
}
