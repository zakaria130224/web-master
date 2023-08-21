package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatusModel, Long> {
    @Override
    List<OrderStatusModel> findAll();

    @Query("SELECT u FROM OrderStatusModel u WHERE u.gpc_sim IS NOT NULL")
    List<OrderStatusModel> findNextStatus(@Param("id") Long id);

    @Query("SELECT u FROM OrderStatusModel u WHERE u.b2b_sim IS NOT NULL")
    List<OrderStatusModel> findNextStatusB2BSim(@Param("id") Long id);

    @Query("SELECT u.id, u.order_name FROM OrderStatusModel u WHERE u.order_name LIKE '%:?1'")
    OrderStatusModel getByStatusName(String status);

    @Query(value = "SELECT u.* FROM tbl_order_status u WHERE u.gpc_sim = ?1",nativeQuery = true)
    OrderStatusModel getByIdGpcSim(Long id);

    @Query(value = "SELECT u.* FROM tbl_order_status u WHERE u.b2b_sim = ?1",nativeQuery = true)
    OrderStatusModel getByIdB2BSim(Long id);

    @Query(value = "SELECT * FROM tbl_order_status WHERE gpc_sim=(SELECT gpc_sim+1 FROM tbl_order_status WHERE id=:id) and gpc_sim IS NOT NULL",nativeQuery = true)
    OrderStatusModel getByIdGpcSimDynamic(@Param("id") Long id);


    @Query("SELECT u FROM OrderStatusModel u WHERE u.gpc_simless = :id")
    OrderStatusModel getByIdGpcSimLess(Long id);

}
