package com.xyz.bd.webmaster.Modules.VTS.Order;

import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;
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

