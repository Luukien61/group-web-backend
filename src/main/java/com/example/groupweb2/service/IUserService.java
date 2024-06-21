package com.example.groupweb2.service;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.model.*;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;

public interface IUserService {
    TokenResponse saveNewUser(UserDTO userDTO);

    UserResponse findAllUserByStaffId(Long id);

    List<UserDTO> findAllUsers();

    List<UserDTO> findAllUsersByRole(String role);

    UserEntity findUserByEmailAndPass(LoginUser requestUser);

//    UserDTO updateUser(UserDTO userDTO, Long userId);
//
//    void deleteUser(UserDTO userDTO);

    UserDTO updateUser(UserDTO userDTO, Long userId);

    UserDTO activeUser(Long id);

    UserEntity inActiveUser(Long id);

    void deleteUser(Long id);
    String generateToken(UserDetails user);
    String generateToken(UserDetails user, String refreshToken);
    TokenResponse registerNewUser(UserDTO userDTO);
    //void authenticate(LoginUser user);
    LoginResponse login(LoginUser user);

    TokenResponse refreshToken(String refreshToken);

}
