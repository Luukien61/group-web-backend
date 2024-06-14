package com.example.groupweb2.security.handler;

import com.example.groupweb2.model.ResponseModel;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.Date;

@RestControllerAdvice
public class ApplicationHandler {
    @ExceptionHandler({AccessDeniedException.class})
    @ResponseStatus(HttpStatus.FORBIDDEN)
    public ResponseEntity<?> handleAccessDeniedException(AccessDeniedException exception){
        return ControllerUtil.response(exception.getMessage(),HttpStatus.FORBIDDEN.value());
    }

    @ExceptionHandler({AuthenticationException.class})
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    public ResponseEntity<?> handleUnAuthorizedRequest(AuthenticationException ex){
        return ControllerUtil.response(ex.getMessage(),HttpStatus.UNAUTHORIZED.value());
    }

    @ExceptionHandler(HttpMessageNotReadableException.class)
    public ResponseEntity<?> handleHttpMessageNotReadableException(HttpMessageNotReadableException ex) {
        String errorMessage = "Unable to map your modal: " + ex.getMessage();
        var responseModel = ResponseModel.builder()
                .message(errorMessage)
                .statusCode(HttpStatus.BAD_REQUEST.value())
                .timestamp(new Date().toString())
                .build();
        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(responseModel);
    }

}
/*
@RestControllerAdvice chủ yếu được sử dụng để xử lý các ngoại lệ được ném ra
từ các phương thức trong các @Controller và @RestController
 */