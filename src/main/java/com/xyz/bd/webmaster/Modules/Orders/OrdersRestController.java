package com.xyz.bd.webmaster.Modules.Orders;

import com.xyz.bd.webmaster.Modules.Orders.B2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/api/web/orders/b2c-gpc")
public class OrdersRestController {

    @Autowired
    B2cGpcServices b2cGpcServices;

    @RequestMapping(value = "/listDT", method = RequestMethod.GET)
    public DataTablesOutput<OrderModelEntity> getB2cGpcOrdersDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return b2cGpcServices.findAllB2cOrdersList(request, customQuery, input);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public CommonRestResponse addNewDriver(HttpServletRequest request,
                                           @RequestParam("orderInfo") String orderInfo) {
        return b2cGpcServices.addNewOrder(request, orderInfo);

    }
    @RequestMapping(value = "/update-status", method = RequestMethod.POST)
    public CommonRestResponse updateDriverBasicInfo(HttpServletRequest request,
                                                    @RequestParam("orderStatusData") String orderStatusData, @RequestParam("id") Long id) {
        return b2cGpcServices.updateOrderStatus(request, orderStatusData, id);

    }
}
