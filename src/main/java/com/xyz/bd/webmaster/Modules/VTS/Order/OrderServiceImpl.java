package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

   @Autowired
    private OrderRepository orderRepository;
    @Override
    public List<OrderModelEntity> getAllOrder() {
        return orderRepository.findAll();
    }

    @Override
    public void saveData(OrderModelEntity orderModelEntity) {
        orderRepository.save(orderModelEntity);
    }
}
