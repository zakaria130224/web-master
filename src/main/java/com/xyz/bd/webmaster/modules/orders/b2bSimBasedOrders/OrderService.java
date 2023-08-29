package com.xyz.bd.webmaster.modules.orders.b2bSimBasedOrders;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface OrderService {
    //DataTablesOutput<OrderModelEntity> findAllOrderList();
    List<OrderModelEntity> getAllOrder();
   // void saveData(OrderModelEntity orderModelEntity);

    void saveData(String chtticket, MultipartFile excelFile);

    OrderModelEntity getOrderById(Long orderId);
    void saveOrder(OrderModelEntity order);

    void updateFinalOrder(OrderModelEntity order);


    DataTablesOutput<OrderModelEntity> findAllB2bSimOrderList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id);

}

