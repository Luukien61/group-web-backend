package com.example.groupweb2.service.implement;

import com.example.groupweb2.dto.OrderDTO;
import com.example.groupweb2.entity.OrderEntity;
import com.example.groupweb2.mapper.MapStruct;
import com.example.groupweb2.repository.OrderRepository;
import com.example.groupweb2.repository.ProductRepository;
import com.example.groupweb2.service.IOrderService;
import jakarta.transaction.Transactional;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class OrderService implements IOrderService {
    public static final String DOES_NOT_EXIST = "The order does not exist";
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final MapStruct mapper;

    @Override
    public List<OrderDTO> getAllOrdersByState(Boolean state) {
        var orders = orderRepository.findAllByDone(state);
        return orders.stream().map(mapper::toOrderDTO).toList();
    }

    @Override
    public String orderNewProduct(OrderDTO orderDTO) {
        var existProduct = productRepository.findAllById(orderDTO.getProductId().trim().toLowerCase());
        if(existProduct.isEmpty()) throw new RuntimeException("Product does not exist");
        var product = existProduct.get();
        var available = product.getAvailable();
        if(available==0) throw new RuntimeException("This product is sold out");
        var ordering = product.getOrdering();
        product.setOrdering(ordering+1);
        var orderEntity = mapper.toOrderEntity(orderDTO);
        orderEntity.setProduct(product);
        var orders = product.getOrders();
        orders.add(orderEntity);
        product.setOrders(orders);
        productRepository.save(product);
        return "Order successfully";
    }

    @Override
    @Transactional
    public void completeOrder(String orderId) {
        var existOrder = orderRepository.findAllByOrderIdAndDone(orderId, false);
        if (existOrder.isEmpty()) throw new RuntimeException(DOES_NOT_EXIST);
        var order = existOrder.get();
        var product = order.getProduct();
        order.setDone(true);
        product.setOrdering(product.getOrdering()-1);
        product.setAvailable(product.getAvailable()-1);
        orderRepository.save(order);
        productRepository.save(product);
    }

    @Override
    public String deleteOrders(String orderId) {
        var existOrder = orderRepository.findById(orderId.trim());
        if(existOrder.isEmpty()) throw new RuntimeException(DOES_NOT_EXIST);
        var order = existOrder.get();
        if(!order.getDone()){
            var product = order.getProduct();
            product.setOrdering(product.getOrdering()-1);
            productRepository.save(product);
        }
        orderRepository.delete(order);
        return "Delete successfully";
    }

    @Override
    public int getOrderQuantity(boolean state) {
        return orderRepository.countAllByDone(state);
    }

    @Override
    public int countAllByDoneAndTimeAfter(Boolean state, int monthBefore) {
        var date = getDateBefore(monthBefore);
        return orderRepository.countAllByDoneAndTimeAfter(state,date);
    }

    @Override
    public List<OrderDTO> findAllByDoneAndTimeAfter(Boolean state, int monthBefore) {
        var date = getDateBefore(monthBefore);
        var orders= orderRepository.findAllByDoneAndTimeAfter(state,date);
        return orders.stream().map(mapper::toOrderDTO).toList();
    }

    private Date getDateBefore(int monthBefore){
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MONTH,-monthBefore);
        return calendar.getTime();
    }
}
