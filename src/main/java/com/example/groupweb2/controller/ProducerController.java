package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/producer")
@AllArgsConstructor
public class ProducerController {
    private IProducerService producerService;

    @PostMapping()
    public ResponseEntity<?> insertNewProducer(@RequestBody ProducerDTO producer) {
        try {
            producerService.saveNewProducer(producer);
            return ControllerUtil.response(CustomMessage.CREATED.getMessage(), HttpStatus.CREATED.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }


    @PutMapping("/{producerId}")
    public ResponseEntity<?> updateProducer(
            @RequestBody ProducerDTO producerDTO,
            @PathVariable Long producerId
    ) {
        try{
            producerService.updateProducer(producerDTO,producerId);
            return ControllerUtil.response(CustomMessage.UPDATED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

    @DeleteMapping()
    public ResponseEntity<?> deleteProducer(
            @RequestBody ProducerDTO producerDTO
    ){
        try{
            producerService.deleteProducer(producerDTO);
            return ControllerUtil.response(CustomMessage.DELETED.getMessage(), HttpStatus.OK.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }
}
