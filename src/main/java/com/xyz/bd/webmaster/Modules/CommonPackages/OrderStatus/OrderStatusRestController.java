package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import com.xyz.bd.webmaster.Utility.Constant;
import okhttp3.Request;
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
    public CommonRestResponse getNextOrderList(HttpServletRequest request, @RequestParam("id") Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(orderStatus.getNextStatusList(id));
        return commonRestResponse;
    }

    @PostMapping("/next-order-status-b2b-sim")
    public CommonRestResponse getNextOrderListB2BSim(HttpServletRequest request, @RequestParam("id") Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(orderStatus.getNextStatusListB2BSim(id));
        return commonRestResponse;
    }

}
