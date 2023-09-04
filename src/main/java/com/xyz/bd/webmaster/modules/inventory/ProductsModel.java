package com.xyz.bd.webmaster.modules.inventory;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
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
    @Column(name = "item_code")
    @JsonProperty("itemCode")
    private String itemCode;

    @Column(name = "product_name")
    @JsonProperty("productName")
    private String productName;

    @Column(name = "product_type")
    @JsonProperty("productType")
    private String productType;

    @Column(name = "channel")
    @JsonProperty("channel")
    private String channel;

    @Column(name = "device_category")
    @JsonProperty("deviceCategory")
    private String deviceCategory;

    @Column(name = "device_sub_category")
    @JsonProperty("deviceSubCategory")
    private String deviceSubCategory;

    @Column(name = "package_name")
    @JsonProperty("packageName")
    private String packageName;

    @Column(name = "monthly_charge")
    @JsonProperty("monthlyCharge")
    private Double monthlyCharge;

    @Column(name = "total_charge")
    @JsonProperty("totalCharge")
    private Double totalCharge;

    @Column(name = "quantity")
    @JsonProperty("quantity")
    private Integer quantity;

    @Column(name = "has_sim")
    @JsonProperty("hasSim")
    private Boolean hasSim;

    @Column(name = "vendor_id")
    @JsonProperty("vendorId")
    private Long vendorId;

    @Column(name="vendor_name")
    @JsonProperty("vendorName")
    private String vendorName;

    @Column(name="vendor_email")
    @JsonProperty("vendorEmail")
    private String vendorEmail;

    @Column(name="vendor_phone")
    @JsonProperty("vendorPhone")
    private String vendorPhone;

    @Column(name = "status")
    @JsonProperty("status")
    private Boolean status;

    @Column(name = "remarks")
    @JsonProperty("remarks")
    private String remarks;

    @Column(name = "description")
    @JsonProperty("description")
    private String description;

    @ManyToMany
    @JoinTable(name = "tbl_product_vendor_mapping", joinColumns = @JoinColumn(name = "product_id", referencedColumnName = "id"), inverseJoinColumns = @JoinColumn(name = "vendor_id", referencedColumnName = "id"))
    private Collection<VendorModelEntity> vendors;
}
