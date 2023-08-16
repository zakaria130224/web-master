package com.xyz.bd.webmaster.Modules.Orders.B2cGpcOrders;

import com.xyz.bd.webmaster.Modules.Orders.OrderModelEntity;
import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface B2cGpcServices {

    DataTablesOutput<OrderModelEntity> findAllB2cOrdersList(HttpServletRequest request, String customQuery, DataTablesInput input);

    CommonRestResponse addNewOrder(HttpServletRequest request, String orderInfo);
}
