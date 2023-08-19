package com.xyz.bd.webmaster.Modules.CommonPackages.Models;

import com.xyz.bd.webmaster.Modules.CommonPackages.Products.ProductsModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_product_vendor_mapping")
public class ProductVendorMapping {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "product_id")
    private Number productId;

    @Column(name = "vendor_id")
    private Number vendorId;

    @Column(name = "status")
    private Boolean status;

    @Column(name = "UPDATED_AT")
    private Date updatedAt;

}
