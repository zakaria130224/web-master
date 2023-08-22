package com.xyz.bd.webmaster.modules.commonPackages.repository;

import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorMapping;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductVendorRepository extends JpaRepository<ProductVendorMapping, Long> {
    /*@Query(value = "SELECT * FROM bookings bs WHERE " +
            "EXISTS (SELECT 1 FROM customer c WHERE bs.customer_id = c.id AND c.phone = :phone) " +
            "AND EXISTS (SELECT 1 FROM books b WHERE b.id = bs.book_id AND b.author IN :authors)",
            nativeQuery = true)
    List<ProductVendorMapping> queryBy(@Param("phone") String phone,
                                       @Param("authors") List<String> authors);*/

}
