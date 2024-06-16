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
    public ResponseEntity<?> placeNewOrders(@RequestBody OrderDTO orderDTO){
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

    @GetMapping("/quantity")
    public ResponseEntity<?> getAllPendingOrders(@RequestParam("state") boolean state){
        try{
            var count = orderService.getOrderQuantity(state);
            return ResponseEntity.ok(count);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

    @GetMapping("/quantity/complete")
    public ResponseEntity<?> getCompleteOrderQuantity(
            @RequestParam(value = "month",defaultValue = "1") int monthBefore,
            @RequestParam(value = "state", defaultValue = "true") boolean state){
        try{
            var count = orderService.countAllByDoneAndTimeAfter(state, monthBefore);
            return ResponseEntity.ok(count);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }


    @GetMapping("/complete")
    public ResponseEntity<?> getAllOrdersByStateAndDateAfter(
            @RequestParam(defaultValue = "true") boolean state,
            @RequestParam(value = "month",defaultValue = "1") int monthBefore){
        try{
            var result = orderService.findAllByDoneAndTimeAfter(state,monthBefore);
            return ResponseEntity.ok(result);
        }catch (Exception e){
            return ControllerUtil.response(e.getMessage(), HttpStatus.BAD_REQUEST.value());
        }
    }

}
