package com.xyz.bd.webmaster.modules.commonPackages.products;

import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import io.lettuce.core.dynamic.annotation.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<ProductsModel, Long> {
    @Override
    List<ProductsModel> findAll();

    @Query(value = "SELECT v.email, v.name, v.id FROM tbl_product_vendor_mapping pvm " +
            "Left JOIN tbl_product p ON p.id = pvm.product_id " +
            "Left JOIN tbl_vendor v ON v.id = p.id " +
            "WHERE pvm.product_id = 2 ",
            nativeQuery = true)
    Object getVendorByProductId(@Param("id") Long id);

    @Query(value = "SELECT new ProductVendorDto(v.email, v.name, v.id) FROM tbl_product_vendor_mapping pvm " +
            "Left JOIN tbl_product p ON p.id = pvm.product_id " +
            "Left JOIN tbl_vendor v ON v.id = p.id " +
            "WHERE pvm.product_id = 2 ",
            nativeQuery = true)
    List<ProductVendorDto> getVendorByProductIdJoin(Long id);
}