package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.entity.UserEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.model.*;
import com.example.groupweb2.repository.UserRepository;
import com.example.groupweb2.security.jwt.provider.IJWTProvider;
import com.example.groupweb2.service.IUserService;
import com.example.groupweb2.util.AppConst;
import lombok.AllArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@AllArgsConstructor
public class UserService implements IUserService, UserDetailsService {

    public static final String DOESNT_EXIST = "The user doesn't exist";
    public static final String ALREADY_EXIST = "The user already exist";
    public static final String PASSWORD_DOES_NOT_MATCH = "Password does not match.";
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MapStruct mapper;
    private final IJWTProvider jwtProvider;


    @Override
    public TokenResponse saveNewUser(UserDTO userDTO) {
        var existUser = userRepository.findByEmail(userDTO.getEmail());
        if (existUser.isPresent()) {
            throw new RuntimeException(ALREADY_EXIST);
        }
        String encodePass = passwordEncoder.encode(userDTO.getPassword().trim());
        userDTO.setPassword(encodePass);
        UserEntity user = mapper.toUserEntity(userDTO);
        user = userRepository.save(user);
        var userPrincipal = UserPrincipal.create(user);
        return jwtProvider.generateTokenResponse(userPrincipal);
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
        var email = requestUser.getEmail().trim();
        var password = requestUser.getPassword().trim();
        var existUserOptional = userRepository.findByEmailAndActiveState(email);
        if (existUserOptional.isEmpty())
            throw new RuntimeException("This email does not exist.\nPlease sign up first.");
        var existUser = existUserOptional.get();
        var isMatch = passwordEncoder.matches(password, existUser.getPassword());
        if (!isMatch) throw new RuntimeException(PASSWORD_DOES_NOT_MATCH);
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
        existUser.setActiveState(userDTO.getActiveState());
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

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        var userOptional = userRepository.findByEmail(username);
        if (userOptional.isEmpty()) throw new UsernameNotFoundException("This email hasn't been registered yet");
        var user = userOptional.get();
        return UserPrincipal.create(user);
    }

    @Override
    public String generateToken(UserDetails user) {
        return jwtProvider.generateAccessToken(user);
    }

    @Override
    public String generateToken(UserDetails user, String refreshToken) {
        if (jwtProvider.isTokenValid(refreshToken, user)) {
            return jwtProvider.generateAccessToken(user);
        } else {
            throw new RuntimeException("Authentication failed") ;
        }
    }

    @Override
    public TokenResponse registerNewUser(UserDTO userDTO) {
        return saveNewUser(userDTO);
    }

    @Override
    public LoginResponse login(LoginUser user) {
        var existUser = findUserByEmailAndPass(user);
        var userPrincipal = UserPrincipal.create(existUser);
        var tokenResponse = jwtProvider.generateTokenResponse(userPrincipal);
        return LoginResponse.builder()
                .tokenResponse(tokenResponse)
                .message("Login successfully")
                .user(mapper.toUserResponse(existUser))
                .build();
    }

    @Override
    public TokenResponse refreshToken(String refreshToken, Long userID) {
        var existUserOptional = userRepository.findByStaffID(userID);
        if(existUserOptional.isEmpty()) throw new RuntimeException(DOESNT_EXIST);
        var userEntity = existUserOptional.get();
        var userDetail = UserPrincipal.create(userEntity);
        var isValid = jwtProvider.isTokenValid(refreshToken,userDetail);
        if(!isValid) throw new RuntimeException("The refresh token is invalid");
        return jwtProvider.generateTokenResponse(userDetail,refreshToken);
    }
}
