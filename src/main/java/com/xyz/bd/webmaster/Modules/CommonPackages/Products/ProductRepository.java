package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus.OrderStatusModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<ProductsModel, Long> {
    @Override
    List<ProductsModel> findAll();
}
