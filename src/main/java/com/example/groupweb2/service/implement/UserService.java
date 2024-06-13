package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.model.LoginUser;
import com.example.groupweb2.repository.UserRepository;
import com.example.groupweb2.service.IUserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
@AllArgsConstructor
public class UserService implements IUserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MapStruct mapper;

    @Override
    public void saveNewUser(UserDTO userDTO)  {
        var existUser = userRepository.findByEmail(userDTO.getEmail());
        if (existUser.isPresent()) {
            throw new RuntimeException("The user already exist");
        } else {
            String encodePass = passwordEncoder.encode(userDTO.getPassword().trim());
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

    @Override
    public UserEntity findUserByEmailAndPass(LoginUser requestUser) {
        var email=requestUser.getEmail().trim();
        var password= requestUser.getPassword().trim();
        var existUserOptional = userRepository.findByEmail(email);
        if(existUserOptional.isEmpty()) throw new RuntimeException("This email does not exist.\n Please sign up first.");
        var existUser= existUserOptional.get();
        var isMatch = passwordEncoder.matches(password, existUser.getPassword());
        if(!isMatch) throw new RuntimeException("Password does not match.");
        return existUser;
    }
}
