package com.example.groupweb2.service;

import com.example.groupweb2.dto.OrderDTO;
import com.example.groupweb2.entity.OrderEntity;

import java.util.List;

public interface IOrderService {
    List<OrderDTO> getAllOrdersByState(Boolean state);
    void completeOrder(String orderId);
    String orderNewProduct( OrderDTO orderDTO);
    String deleteOrders(String orderId);
    int getOrderQuantity(boolean state);
    int countAllByDoneAndTimeAfter(Boolean state, int monthBefore);
    List<OrderDTO> findAllByDoneAndTimeAfter(Boolean state, int monthBefore);

}
