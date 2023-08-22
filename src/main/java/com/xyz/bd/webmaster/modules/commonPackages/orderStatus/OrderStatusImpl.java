package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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

    @Override
    public List<OrderStatusModel> getNextStatusList(Long id) {
        OrderStatusModel orderByName = orderStatusRepository.getByIdGpcSim(id.intValue());
        Integer nextId = orderByName.getGpc_sim()+1;
        try {
            List<OrderStatusModel> result = orderStatusRepository.findNextStatus(nextId);
            return result;
        } catch (DataAccessException e) {
            return null;
        }

    }

    /*@Override
    public OrderStatusModel getNextStatusListDyna(Long id) {
        OrderStatusModel result = orderStatusRepository.getByIdGpcSimDynamic(id);
        return result;
    }*/

    @Override
    public Object getStatusListByColumnName(String name) {
        return null;
    }

}
