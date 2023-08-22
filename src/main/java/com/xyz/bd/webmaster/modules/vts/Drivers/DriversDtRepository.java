package com.xyz.bd.webmaster.modules.vts.Drivers;

import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.data.jpa.datatables.repository.DataTablesRepository;
import org.springframework.data.jpa.domain.Specification;

public interface DriversDtRepository extends DataTablesRepository<DriversModelEntity, Long> {
    DataTablesOutput<DriversModelEntity> findAll(DataTablesInput input, Specification<DriversModelEntity> spec);

}
