package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;


public interface OrderService {
    //DataTablesOutput<OrderModelEntity> findAllOrderList();
    List<OrderModelEntity> getAllOrder();
   // void saveData(OrderModelEntity orderModelEntity);

    void saveData(String msisdn, MultipartFile excelFile);

}

