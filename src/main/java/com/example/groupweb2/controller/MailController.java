package com.example.groupweb2.controller;

import com.example.groupweb2.mail.MailService;
import com.example.groupweb2.model.MailTemplate;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/mail")
@AllArgsConstructor
public class MailController {
    private MailService mailService;

    @PostMapping("/send")
    public ResponseEntity<?> sendEmail(@RequestBody MailTemplate mailTemplate){
        try{
            mailService.send(mailTemplate);
            var result = ControllerUtil.response("Sent", HttpStatus.OK.value());
            return ResponseEntity.ok().body(result);
        }catch (Exception e){
            var error = ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
            return ResponseEntity.badRequest().body(error);
        }
    }
}
