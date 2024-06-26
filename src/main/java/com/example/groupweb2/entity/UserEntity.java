package com.example.groupweb2.entity;

import com.example.groupweb2.model.UserRole;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "staff_user")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long staffID;
    private String fullName;
    private String email;
    private String password;
    @Enumerated(EnumType.STRING)
    private UserRole role;
    private String phone;
    private Boolean activeState = true;

    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority("ROLE_"+this.role.getRole()));
    }

    @PrePersist  // (1)
    public void persistDefaultActiveState(){
        if(activeState==null){
            this.activeState=true;
        }
    }
}
/*
 @PrePersist chỉ được gọi khi một entity mới được lưu vào cơ sở dữ liệu lần đầu tiên.
 Khi một entity đã tồn tại trong cơ sở dữ liệu và được cập nhật,
 @PreUpdate sẽ được gọi thay vì @PrePersist
 */