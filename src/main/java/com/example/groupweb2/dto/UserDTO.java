package com.example.groupweb2.dto;

import com.example.groupweb2.model.UserRole;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserDTO {
    private Long staffID;
    private String fullName;
    private String email;
    private String password;
    private UserRole role;
    private String phone;
    private Boolean activeState; //(1)
}
/*
khi bạn sử dụng thư viện Jackson để chuyển đổi JSON thành một đối tượng Java (DTO),
 nếu JSON không chứa một trường boolean cụ thể,
 thì trường đó trong đối tượng Java sẽ được đặt mặc định là false.
 Điều này là do false là giá trị mặc định cho kiểu dữ liệu boolean trong Java.

Nếu bạn muốn kiểm soát việc này,
một cách là sử dụng đối tượng Boolean thay vì kiểu dữ liệu nguyên thủy boolean.
 Kiểu Boolean có thể nhận giá trị null, true, hoặc false,
 trong khi boolean chỉ có thể là true hoặc false.
 */