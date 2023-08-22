package com.xyz.bd.webmaster.modules.orders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderModelEntity, Long> {
//    DataTablesOutput<OrderModelEntity> findAll(DataTablesInput input, Specification<OrderModelEntity> spec);

}

