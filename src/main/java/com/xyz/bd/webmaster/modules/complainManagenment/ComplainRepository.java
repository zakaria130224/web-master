package com.xyz.bd.webmaster.modules.complainManagenment;

import com.xyz.bd.webmaster.modules.commonPackages.orderStatus.OrderStatusModel;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComplainRepository extends JpaRepository<ComplainModel, Long> {
    @Query("SELECT u FROM ComplainStatusModel u WHERE u.id = :id OR u.id = 9")
    List<ComplainStatusModel> findNextStatus(@Param("id") Long id);

    @Query("SELECT u FROM ComplainStatusModel u WHERE u.id >= :id")
    List<ComplainStatusModel> findNextStatusRest(@Param("id") Long id);
}
