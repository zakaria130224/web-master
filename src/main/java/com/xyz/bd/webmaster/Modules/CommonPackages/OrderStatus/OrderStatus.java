package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderStatus {
    public List<OrderStatusModel> getStatusList();

}