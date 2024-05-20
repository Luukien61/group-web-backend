package com.example.groupweb2.controller;

import com.example.groupweb2.dto.CarouselDTO;
import com.example.groupweb2.model.CustomMessage;
import com.example.groupweb2.service.ICarouselService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/carousel")
@AllArgsConstructor
public class CarouselController {
    private ICarouselService carouselService;

    @PostMapping()
    public ResponseEntity<?> insertImages(@RequestBody List<CarouselDTO> items){
        try{
            carouselService.saveManyItems(items);
            return ControllerUtil.response(CustomMessage.CREATED.getMessage(), HttpStatus.CREATED.value());
        }catch (RuntimeException e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_MODIFIED.value());
        }
    }

    @GetMapping()
    public ResponseEntity<?> getAllImages(){
        try{
            var items =carouselService.findAll();
            return ResponseEntity.ok(items);
        }catch (RuntimeException e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.NOT_FOUND.value());
        }
    }
}
