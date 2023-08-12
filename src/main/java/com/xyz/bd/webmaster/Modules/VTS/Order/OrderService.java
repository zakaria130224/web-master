package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.springframework.stereotype.Service;

import java.util.List;


public interface OrderService {
    //DataTablesOutput<OrderModelEntity> findAllOrderList();
    List<OrderModelEntity> getAllOrder();
    void saveData(OrderModelEntity orderModelEntity);

}

