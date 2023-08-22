package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderStatus {
    public List<OrderStatusModel> getStatusList();

    List<OrderStatusModel> getNextStatusList(Long id);

    Object getStatusListByColumnName(String name);
}
