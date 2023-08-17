package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import com.xyz.bd.webmaster.Utility.Constant;
import okhttp3.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}
