package com.xyz.bd.webmaster.modules.orders.b2cGpcOrders;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface B2cGpcServices {

    DataTablesOutput<OrderModelEntity> findAllB2cOrdersList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse addNewOrder(HttpServletRequest request, String orderInfo);

    CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id, String dateTime);
}
