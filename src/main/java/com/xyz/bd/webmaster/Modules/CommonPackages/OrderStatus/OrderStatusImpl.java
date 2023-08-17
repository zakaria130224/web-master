package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderStatusImpl implements OrderStatus{

    @Autowired
    OrderStatusRepository orderStatusRepository;

    @Override
    public List<OrderStatusModel> getStatusList() {
        List<OrderStatusModel> result = orderStatusRepository.findAll();
        return result;
    }
}
