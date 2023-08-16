package com.xyz.bd.webmaster.Modules.Orders.B2bSimBasedOrders;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;



//public interface OrderRepository extends DataTablesRepository<OrderModelEntity, Long>{
//    DataTablesOutput<OrderModelEntity> findAll(DataTablesInput input, Specification<OrderModelEntity> spec);
//
//}
@Repository
public interface OrderRepository extends JpaRepository<OrderModelEntity, Long> {
//    DataTablesOutput<OrderModelEntity> findAll(DataTablesInput input, Specification<OrderModelEntity> spec);

}

