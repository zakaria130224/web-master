package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.criteria.CriteriaBuilder;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_product")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class ProductsModel extends BaseEntity implements Serializable {
    private String product_name;
    private String product_type;
    private String device_category;
    private String device_sub_category;
    private String package_name;
    private Double monthly_charge;
    private Float total_charge;
    private Boolean has_sim;
    private Boolean status;

}
