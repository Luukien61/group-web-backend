package com.example.groupweb2.security.handler;

import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.util.ControllerUtil;
import com.example.groupweb2.util.JsonUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Date;

import static org.springframework.http.HttpStatus.UNAUTHORIZED;

@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException, ServletException {
        response.setHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE);
        var responseModel = ResponseModel.builder()
                .message("Unauthorized request")
                .statusCode(HttpStatus.UNAUTHORIZED.value())
                .timestamp(new Date().toString())
                .build();
        var body = JsonUtil.generateJson(responseModel);
        response.getWriter().write(body);
        response.setStatus(UNAUTHORIZED.value());
    }
}
