package com.xyz.bd.webmaster.Modules.VTS.Drivers;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DriversRepository extends CrudRepository<DriversModelEntity, Long> {
    /*public List<DriversModelEntity> findFirstBy(Long id);*/
}
