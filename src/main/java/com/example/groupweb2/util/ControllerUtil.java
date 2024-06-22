package com.example.groupweb2.util;

import com.example.groupweb2.model.ResponseModel;
import com.fasterxml.jackson.core.JsonProcessingException;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.util.Date;

public class ControllerUtil {
    public static ResponseEntity<ResponseModel> response(String message, int code){
        var responseModel = ResponseModel.builder()
                .message(message)
                .statusCode(code)
                .timestamp(new Date().toString())
                .build();
        return ResponseEntity
                .status(code)
                .body(responseModel);
    }

    public static HttpServletResponse customErrorResponse(HttpServletResponse response, String message, int code) throws IOException {
        response.setHeader("Content-Type", MediaType.APPLICATION_JSON_VALUE);
        var responseModal = ResponseModel.builder()
                .message(message)
                .statusCode(code)
                .timestamp(new Date().toString())
                .build();
        var body = JsonUtil.generateJson(responseModal);
        response.getWriter().write(body);
        response.setStatus(code);
        return response;
    }

}
