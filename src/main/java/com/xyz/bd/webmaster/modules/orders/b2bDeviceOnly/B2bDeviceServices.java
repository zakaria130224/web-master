package com.xyz.bd.webmaster.modules.orders.b2bDeviceOnly;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public interface B2bDeviceServices {

    DataTablesOutput<OrderModelEntity> findAllB2bDeviceOrderList(HttpServletRequest request, String customQuery, DataTablesInput input);
}
