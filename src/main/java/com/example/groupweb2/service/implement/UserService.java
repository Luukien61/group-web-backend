package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.UserRepository;
import com.example.groupweb2.service.IUserService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
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
        var existUser = userRepository.findAllByStaffID(userDTO.getStaffID());
        if (existUser.isPresent()) {
            throw new RuntimeException("The user already exist");
        } else {
//            System.out.println(userDTO.getStaffID());
//            System.out.println(userDTO.getPassword());
            String encodePass = passwordEncoder.encode(userDTO.getPassword());
            userDTO.setPassword(encodePass);
            UserEntity save = mapper.toUserEntity(userDTO);
            userRepository.save(save);
            System.out.println("New user has been saved successfully!");
        }
    }

    @Override
    public UserDTO findAllUserByStaffId(Long id) {
        UserEntity userEntity = userRepository.findAllByStaffID(id).orElseThrow(
                () -> new RuntimeException("The user doesn't exist"));
        return mapper.toUserDTO(userEntity);
    }

    @Override
    public List<UserDTO> findAllUsers() {
        List<UserEntity> userEntities = userRepository.findAll();
        return userEntities.stream().map(mapper::toUserDTO).toList();
    }


}
