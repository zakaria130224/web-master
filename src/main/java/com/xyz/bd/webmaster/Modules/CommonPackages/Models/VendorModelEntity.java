package com.xyz.bd.webmaster.Modules.CommonPackages.Models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import com.xyz.bd.webmaster.Modules.CommonPackages.Products.ProductsModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_vendor")
public class VendorModelEntity extends BaseEntity {
    @Column(name = "name")
    private String name;
    @Column(name = "vendor_type")
    private String vendorType;
    @Column(name = "email")
    private String email;
    @Column(name = "contact_phone")
    private String contactPhone;
    @Column(name = "address")
    private String address;
    @Column(name = "status")
    private Boolean status;
}
