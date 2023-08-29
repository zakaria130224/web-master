package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
    public List<OrderStatusModel> getNextStatusList(Long id, String columnName) {
        OrderStatusModel orderByName = orderStatusRepository.getByIdGpcSim(id.intValue());
        Integer nextId = orderByName.getGpc_sim()+1;
        List<OrderStatusModel> result = new ArrayList<OrderStatusModel>();
        try {
            if(columnName.equals("gpc_sim")){
                if(id<7){
                    result = orderStatusRepository.findNextStatus(nextId);
                } else{
                    result = null;
                }
                return result;
            } else if (columnName.equals("gpc_simless")) {
                if(id<5){
                    result = orderStatusRepository.findNextStatusSimLess(nextId);
                } else{
                    result = null;
                }
                return result;
            } else if (columnName.equals("gpshop_sim")) {
                if(id<8){
                    result = orderStatusRepository.findNextStatusGpShopSim(nextId);
                } else{
                    result = null;
                }
                return result;
            } else if (columnName.equals("gpshop_simless")) {
                if(id<5){
                    result = orderStatusRepository.findNextStatusGpShopSimLess(nextId);
                } else{
                    result = null;
                }
                return result;
            } else if (columnName.equals("b2b_sim")) {
                if(id<8){
                    result = orderStatusRepository.findNextStatusB2bSim(nextId);
                } else{
                    result = null;
                }
                return result;
            } else if (columnName.equals("b2b_simless")) {
                if(id<5){
                    result = orderStatusRepository.findNextStatusB2bSimLess(nextId);
                } else{
                    result = null;
                }
                return result;
            }
            return result;
        } catch (DataAccessException e) {
            return null;
        }

    }

    @Override
    public List<OrderStatusModel> getNextStatusListB2BSim(Long id) {
        OrderStatusModel orderByName = orderStatusRepository.getByIdB2BSim(id.intValue());
        Integer nextId = orderByName.getB2b_sim() + 1;
        try {
            List<OrderStatusModel> result = orderStatusRepository.findNextStatusB2BSim(nextId);
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
