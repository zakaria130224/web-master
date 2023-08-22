package com.xyz.bd.webmaster.modules.commonPackages.models;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

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
