package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import com.xyz.bd.webmaster.utility.CommonRestResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/web/utility")
public class OrderStatusRestController {

    private final Logger logger = LoggerFactory.getLogger("OrderStatusRestController");

    @Autowired
    private OrderStatus orderStatus;

    @GetMapping("/order-status-list")
    public CommonRestResponse getOrderList() {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(orderStatus.getStatusList());
        return commonRestResponse;
    }

    @PostMapping("/next-order-status")
    public CommonRestResponse getNextOrderList(HttpServletRequest request, @RequestParam("id") Long id, @RequestParam("columnName") String columnName) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(orderStatus.getNextStatusList(id, columnName));
        return commonRestResponse;
    }

    @PostMapping("/next-order-status-b2b-sim")
    public CommonRestResponse getNextOrderListB2BSim(HttpServletRequest request, @RequestParam("id") Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(orderStatus.getNextStatusListB2BSim(id));
        return commonRestResponse;
    }

}
