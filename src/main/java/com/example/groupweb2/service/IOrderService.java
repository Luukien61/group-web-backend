package com.example.groupweb2.service;

import com.example.groupweb2.dto.OrderDTO;

import java.util.List;

public interface IOrderService {
    List<OrderDTO> getAllOrdersByState(Boolean state);
    void completeOrder(String orderId);
    String orderNewProduct( OrderDTO orderDTO);
    String deleteOrders(String orderId);

}
