package com.example.groupweb2.controller;

import com.example.groupweb2.dto.OrderDTO;
import com.example.groupweb2.service.IOrderService;
import com.example.groupweb2.util.ControllerUtil;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/order")
public class OrderController {
    private IOrderService orderService;
    @PostMapping()
    public ResponseEntity<?> orderNewProduct(@RequestBody OrderDTO orderDTO){
        try{
            var message = orderService.orderNewProduct(orderDTO);
            return ControllerUtil.response(message, HttpStatus.OK.value());
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

    @GetMapping()
    public ResponseEntity<?> getOrdersByState(@RequestParam("state") Boolean state){
        try{
            var result = orderService.getAllOrdersByState(state);
            return ResponseEntity.ok(result);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

    @PatchMapping("/{orderId}")
    public ResponseEntity<?> completeOrders(@PathVariable String orderId){
        try{
            orderService.completeOrder(orderId);
            return ControllerUtil.response("Complete", HttpStatus.OK.value());
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

    @DeleteMapping("/{orderId}")
    public ResponseEntity<?> deleteOrders(@PathVariable String orderId){
        try{
            var message = orderService.deleteOrders(orderId);
            return ControllerUtil.response(message,HttpStatus.OK.value());
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }
}
