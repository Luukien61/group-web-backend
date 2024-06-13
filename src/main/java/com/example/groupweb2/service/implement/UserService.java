package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.model.UserRole;
import com.example.groupweb2.repository.UserRepository;
import com.example.groupweb2.service.IUserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.management.relation.Role;
import java.util.List;


@Service
public class UserService implements IUserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final MapStruct mapper;

    public UserService(UserRepository userRepository, MapStruct mapper) {
        this.userRepository = userRepository;
        this.passwordEncoder = new BCryptPasswordEncoder();
        this.mapper = mapper;
    }

    @Override
    public void saveNewUser(UserDTO userDTO)  {
        var existUser = userRepository.findByStaffID(userDTO.getStaffID());
        if (existUser.isPresent()) {
            throw new RuntimeException("The user already exist");
        } else {
            String encodePass = passwordEncoder.encode(userDTO.getPassword());
            userDTO.setPassword(encodePass);
            UserEntity save = mapper.toUserEntity(userDTO);
            userRepository.save(save);
            System.out.println("New user has been saved successfully!");
        }
    }

    @Override
    public UserDTO findUserByStaffId(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public List<UserDTO> findAllUsers() {
        List<UserEntity> userEntities = userRepository.findAll();
        return userEntities.stream().map(mapper::toUserDTO).toList();
    }

    @Override
    public List<UserDTO> findAllUsersByRole(UserRole role) {
        if (role == null) {
            throw new RuntimeException("Role is required");
        }
        List<UserEntity> users = userRepository.findAllByRole(role);
        return users.stream().map(mapper::toUserDTO).toList();
    }

//    @Override
//    public List<UserDTO> findAllUsersByName(String name) {
//        List<UserEntity> users = userRepository.findAllByFullNameContainingIgnoreCase(name.trim());
//        return users.stream().map(mapper::toUserDTO).toList();
//    }

    @Override
    public UserDTO updateUser(UserDTO userDTO, Long userId) {
        UserEntity existUser = userRepository.findByStaffID(userId).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));

        //existUser.setStaffID(userDTO.getStaffID());
        existUser.setFullName(userDTO.getFullName());
        existUser.setActiveState(userDTO.isActiveState());
        existUser.setEmail(userDTO.getEmail());
        existUser.setRole(userDTO.getRole());
        existUser.setPhone(userDTO.getPhone());
        String encodePass = passwordEncoder.encode(userDTO.getPassword());
        existUser.setPassword(encodePass);
        userRepository.save(existUser);
        System.out.println("User has been updated successfully!");
        return mapper.toUserDTO(existUser);
    }

    @Override
    public UserDTO activeUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));
        userEntity.setActiveState(true);
        userRepository.save(userEntity);
        System.out.println("User has been activated successfully!");
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public UserDTO deactiveUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));
        userEntity.setActiveState(false);
        userRepository.save(userEntity);
        System.out.println("User has been deactivated successfully!");
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public void deleteUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));
        userRepository.delete(userEntity);
        System.out.println("User has been deleted successfully!");
    }


}
