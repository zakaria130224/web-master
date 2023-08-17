package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatusModel, Long> {
    @Override
    List<OrderStatusModel> findAll();
}
