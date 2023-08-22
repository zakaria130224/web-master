package com.xyz.bd.webmaster.modules.vts.Drivers;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DriversRepository extends CrudRepository<DriversModelEntity, Long> {
    /*public List<DriversModelEntity> findFirstBy(Long id);*/

    @Query(value = "select m from DriversModelEntity m where m.id=:id")
    DriversModelEntity findByDriverId(Long id);
}
