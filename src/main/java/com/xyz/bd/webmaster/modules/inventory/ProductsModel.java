package com.xyz.bd.webmaster.modules.inventory;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_product")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class ProductsModel extends BaseEntity implements Serializable {
    private String item_code;
    private String product_name;
    private String product_type;
    private String channel;
    private String device_category;
    private String device_sub_category;
    private String package_name;
    private Double monthly_charge;
    private Float total_charge;
    private Number quantity;
    private Number vendor_id;
    private Boolean has_sim;
    private Boolean status;
    private String remarks;

    @ManyToMany
    @JoinTable(name = "tbl_product_vendor_mapping", joinColumns = @JoinColumn(name = "product_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "vendor_id", referencedColumnName = "id"))
    private Collection<VendorModelEntity> vendors;
}
