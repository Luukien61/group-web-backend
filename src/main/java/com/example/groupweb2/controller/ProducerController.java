package com.example.groupweb2.controller;

import com.example.groupweb2.dto.ProducerDTO;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.service.IProducerService;
import com.example.groupweb2.util.ControllerUtil;
import jakarta.websocket.server.PathParam;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/producer")
@AllArgsConstructor
public class ProducerController {
    private IProducerService producerService;

    @PostMapping("/one/{category}")
    public ResponseEntity<?> insertNewProducer(@RequestBody ProducerDTO producer, @PathVariable String category) {
        try {
            producerService.saveNewProducer(producer,category);
            return ControllerUtil.response(CustomMessage.CREATED.getMessage(), HttpStatus.CREATED.value());
        } catch (RuntimeException e) {
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

    @PostMapping("/many/{category}")
    public ResponseEntity<?> insertProducers(@RequestBody List<ProducerDTO> producers,@PathVariable String category) {
        try {
            producerService.saveProducers(producers, category);
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

    @GetMapping("/{category}")
    public ResponseEntity<?> getProducersByCategory(@PathVariable String category){
        try{
            var producers = producerService.findAllProducerByCategory(category, false);
            return ResponseEntity.ok(producers);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(),HttpStatus.BAD_REQUEST.value());
        }
    }
}
