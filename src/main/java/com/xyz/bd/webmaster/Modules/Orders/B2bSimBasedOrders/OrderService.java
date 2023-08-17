package com.xyz.bd.webmaster.Modules.Orders.B2bSimBasedOrders;

import com.xyz.bd.webmaster.Modules.Orders.OrderModelEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface OrderService {
    //DataTablesOutput<OrderModelEntity> findAllOrderList();
    List<OrderModelEntity> getAllOrder();
   // void saveData(OrderModelEntity orderModelEntity);

    void saveData(String chtticket, MultipartFile excelFile);

    OrderModelEntity getOrderById(Long orderId);
    void saveOrder(OrderModelEntity order);

    void updateFinalOrder(OrderModelEntity order);

}

