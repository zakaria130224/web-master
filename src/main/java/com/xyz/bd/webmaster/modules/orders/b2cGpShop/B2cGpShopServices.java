package com.xyz.bd.webmaster.modules.orders.b2cGpShop;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;


public interface B2cGpShopServices {

    DataTablesOutput<OrderModelEntity> findAllB2cGpShopOrderList(HttpServletRequest request, String customQuery, DataTablesInput input);

    void saveData(HttpServletRequest request, MultipartFile excelFile);

    CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id, String dateTime);
}
