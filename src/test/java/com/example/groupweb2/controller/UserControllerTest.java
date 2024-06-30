package com.example.groupweb2.controller;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.UserResponse;
import com.example.groupweb2.model.UserRole;
import com.example.groupweb2.security.jwt.provider.JWTProvider;
import com.example.groupweb2.service.implement.UserService;
import com.example.groupweb2.util.AppConst;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentMatchers;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
@SpringBootTest
@AutoConfigureMockMvc
@Slf4j
class UserControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private UserService userService;

    @MockBean
    private JWTProvider jwtProvider;
    private UserDTO userDTO;
    private UserResponse userResponse;

    @BeforeEach
    void initData(){
        userDTO = UserDTO.builder()
                .staffID(100L)
                .fullName("Luu kien")
                .email("abc@gmail.com")
                .activeState(true)
                .phone("0123456")
                .password("123abc")
                .role(UserRole.USER)
                .build();
        userResponse = UserResponse.builder()
                .email("abc@gmail.com")
                .fullName("Luu kien")
                .phone("0123456")
                .staffID(100L)
                .role(UserRole.USER)
                .build();
        Mockito.when(jwtProvider.isTokenValid(ArgumentMatchers.anyString(), ArgumentMatchers.any())).thenReturn(true);
        Mockito.when(jwtProvider.exactUserName(ArgumentMatchers.anyString())).thenReturn("abc@gmail.com");

    }
    @Test
    @WithMockUser(roles = "ADMIN")
    void createUser_isValid_success() throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        String content = objectMapper.writeValueAsString(userDTO);

        Mockito.when(userService.saveNewUser(ArgumentMatchers.any()))
                        .thenReturn(userResponse);

        mockMvc.perform(MockMvcRequestBuilders
                .post("/user")
                .contentType(MediaType.APPLICATION_JSON_VALUE)
                .content(content)
                .header(AppConst.AUTHORIZATION, "Bearer token"))
                .andExpect(MockMvcResultMatchers.status().isCreated())
                .andExpect(MockMvcResultMatchers.jsonPath("email")
                        .value("abc@gmail.com"))
        ;
    }
}