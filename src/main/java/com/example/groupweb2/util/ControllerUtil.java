package com.example.groupweb2.util;

import com.example.groupweb2.model.ResponseModel;
import org.springframework.http.ResponseEntity;

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
}
