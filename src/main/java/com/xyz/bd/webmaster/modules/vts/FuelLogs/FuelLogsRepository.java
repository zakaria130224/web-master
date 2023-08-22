package com.xyz.bd.webmaster.modules.vts.FuelLogs;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface FuelLogsRepository extends CrudRepository<FuelLogsModelEntity, Long> {
    @Query(value = "select m from FuelLogsModelEntity m where m.id=:id")
    FuelLogsModelEntity findByFuelId(Long id);
}
