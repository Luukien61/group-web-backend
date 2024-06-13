package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.model.UserRole;
import com.example.groupweb2.repository.UserRepository;
import com.example.groupweb2.service.IUserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@AllArgsConstructor
public class UserService implements IUserService {

    public static final String DOESNT_EXIST = "The user doesn't exist";
    public static final String ALREADY_EXIST = "The user already exist";
    public static final String PASSWORD_DOES_NOT_MATCH = "Password does not match.";
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MapStruct mapper;

    @Override
    public void saveNewUser(UserDTO userDTO)  {
        var existUser = userRepository.findByEmail(userDTO.getEmail());
        if (existUser.isPresent()) {
            throw new RuntimeException(ALREADY_EXIST);
        } else {
            String encodePass = passwordEncoder.encode(userDTO.getPassword().trim());
            userDTO.setPassword(encodePass);
            UserEntity save = mapper.toUserEntity(userDTO);
            userRepository.save(save);
        }
    }

    @Override
    public UserDTO findAllUserByStaffId(Long id) {
        UserEntity userEntity = userRepository.findAllByStaffID(id).orElseThrow(
                () -> new RuntimeException(DOESNT_EXIST));
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public List<UserDTO> findAllUsers() {
        List<UserEntity> userEntities = userRepository.findAll();
        return userEntities.stream().map(mapper::toUserDTO).toList();
    }

    @Override
    public UserEntity findUserByEmailAndPass(LoginUser requestUser) {
        var email=requestUser.getEmail().trim();
        var password= requestUser.getPassword().trim();
        var existUserOptional = userRepository.findByEmailAndActiveState(email);
        if(existUserOptional.isEmpty()) throw new RuntimeException("This email does not exist.\n Please sign up first.");
        var existUser= existUserOptional.get();
        var isMatch = passwordEncoder.matches(password, existUser.getPassword());
        if(!isMatch) throw new RuntimeException(PASSWORD_DOES_NOT_MATCH);
        return existUser;
    }
    @Override
    public List<UserDTO> findAllUsersByRole(UserRole role) {
        if (role == null) {
            throw new RuntimeException("Role is required");
        }
        List<UserEntity> users = userRepository.findAllByRole(role);
        return users.stream().map(mapper::toUserDTO).toList();
    }


    @Override
    public UserDTO updateUser(UserDTO userDTO, Long userId) {
        UserEntity existUser = userRepository.findByStaffID(userId).orElseThrow(
                () -> new RuntimeException(DOESNT_EXIST));
        existUser.setFullName(userDTO.getFullName());
        existUser.setActiveState(userDTO.isActiveState());
        existUser.setEmail(userDTO.getEmail());
        existUser.setRole(userDTO.getRole());
        existUser.setPhone(userDTO.getPhone());
        String encodePass = passwordEncoder.encode(userDTO.getPassword().trim());
        existUser.setPassword(encodePass);
        userRepository.save(existUser);
        return mapper.toUserDTO(existUser);
    }

    @Override
    public UserDTO activeUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException(DOESNT_EXIST));
        userEntity.setActiveState(true);
        userRepository.save(userEntity);
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public UserEntity deactiveUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException(DOESNT_EXIST));
        userEntity.setActiveState(false);
        userRepository.save(userEntity);
        return userEntity;
    }

    @Override
    public void deleteUser(Long id) {
        UserEntity userEntity = userRepository.findByStaffID(id).orElseThrow(
                () -> new RuntimeException(DOESNT_EXIST));
        userRepository.delete(userEntity);
    }

}
