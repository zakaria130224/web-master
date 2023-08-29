package com.xyz.bd.webmaster.modules.orders.b2bSimBasedOrders;


import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.b2bDeviceOnly.B2bDeviceServices;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
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
@RequestMapping("/api/web/orders/b2b-sim-based")
public class OrderRestController {
    @Autowired
    OrderService orderService;

    @Autowired
    B2bDeviceServices deviceServices;


    @RequestMapping(value = "/listB2bSimDT", method = RequestMethod.GET)
    public DataTablesOutput<OrderModelEntity> getB2bSimOrdersDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return orderService.findAllB2bSimOrderList(request, customQuery, input);
    }

    @RequestMapping(value = "/update-status", method = RequestMethod.POST)
    public CommonRestResponse updateDriverBasicInfo(HttpServletRequest request,
                                                    @RequestParam("orderStatusData") String orderStatusData, @RequestParam("id") Long id) {
        return orderService.updateOrderStatus(request, orderStatusData, id);

    }

    @RequestMapping(value = "/listB2bDeviceDT", method = RequestMethod.GET)
    public DataTablesOutput<OrderModelEntity> getB2bDeviceOrdersDT(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return deviceServices.findAllB2bDeviceOrderList(request, customQuery, input);
    }
}
