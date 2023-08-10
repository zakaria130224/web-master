package com.xyz.bd.webmaster.Modules.VTS.Order;

import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;

public interface OrderRepository extends DataTablesRepository<OrderModelEntity, Long>{
    DataTablesOutput<OrderModelEntity> findAll(DataTablesInput input, Specification<OrderModelEntity> spec);

}
