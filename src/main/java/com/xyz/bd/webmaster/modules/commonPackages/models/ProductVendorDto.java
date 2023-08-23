package com.xyz.bd.webmaster.modules.commonPackages.models;

import lombok.Data;

@Data
public class ProductVendorDto {
    private String vendorName;
    private String vendorEmail;
    private Long vendorId;

    public ProductVendorDto(String vendorName, String vendorEmail, Long vendorId) {
        this.vendorName = vendorName;
        this.vendorEmail = vendorEmail;
        this.vendorId = vendorId;
    }
}