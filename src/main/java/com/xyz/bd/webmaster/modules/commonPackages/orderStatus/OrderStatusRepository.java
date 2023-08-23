package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatusModel, Long> {
    @Override
    List<OrderStatusModel> findAll();

    @Query("SELECT u FROM OrderStatusModel u WHERE u.gpc_sim = :id")
    List<OrderStatusModel> findNextStatus(@Param("id") Integer id);

    @Query("SELECT u FROM OrderStatusModel u WHERE u.b2b_sim = :id")
    List<OrderStatusModel> findNextStatusB2BSim(@Param("id") Integer id);

    @Query("SELECT u.id, u.order_name FROM OrderStatusModel u WHERE u.order_name LIKE '%:?1'")
    OrderStatusModel getByStatusName(String status);

    @Query("SELECT u FROM OrderStatusModel u WHERE u.gpc_sim = :id")
    OrderStatusModel getByIdGpcSim(@Param("id") Integer id);

    @Query(value = "SELECT u FROM OrderStatusModel u WHERE u.b2b_sim = :id")
    OrderStatusModel getByIdB2BSim(@Param("id") Integer id);

    @Query(value = "SELECT * FROM tbl_order_status WHERE gpc_sim=(SELECT gpc_sim+1 FROM tbl_order_status WHERE id=:id) and gpc_sim IS NOT NULL",nativeQuery = true)
    OrderStatusModel getByIdGpcSimDynamic(@Param("id") Long id);


    @Query("SELECT u FROM OrderStatusModel u WHERE u.gpc_simless = :id")
    OrderStatusModel getByIdGpcSimLess(Long id);

}
