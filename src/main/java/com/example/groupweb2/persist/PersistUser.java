package com.example.groupweb2.persist;

import com.example.groupweb2.dto.UserDTO;
import com.example.groupweb2.model.UserRole;
import com.example.groupweb2.service.IUserService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
@AllArgsConstructor
@Slf4j
public class PersistUser {

    private IUserService userService;

    @EventListener(ApplicationReadyEvent.class)
    public void persistUsers(){
        UserDTO admin = UserDTO.builder()
                .email("admin@gmail.com")
                .phone("012345678")
                .role(UserRole.ADMIN)
                .fullName("Admin")
                .activeState(true)
                .password("123456")
                .build();
        UserDTO user1 =  UserDTO.builder()
                .email("kienluu@gmail.com")
                .phone("012345678")
                .role(UserRole.USER)
                .fullName("Kien Luu")
                .activeState(true)
                .password("123456")
                .build();
        UserDTO user2 =  UserDTO.builder()
                .email("thuynga@gmail.com")
                .phone("012345678")
                .role(UserRole.USER)
                .fullName("Thuy Nga")
                .activeState(true)
                .password("123456")
                .build();
        UserDTO user3 =  UserDTO.builder()
                .email("ngovuong@gmail.com")
                .phone("012345678")
                .role(UserRole.USER)
                .fullName("Ngo Vuong")
                .activeState(true)
                .password("123456")
                .build();
        try{
            userService.saveNewUser(admin);
            userService.saveNewUser(user1);
            userService.saveNewUser(user2);
            userService.saveNewUser(user3);
        }catch (Exception e){
            log.error(e.getMessage());
        }
    }
}
