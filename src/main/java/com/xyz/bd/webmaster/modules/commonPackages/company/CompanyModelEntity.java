package com.xyz.bd.webmaster.modules.commonPackages.company;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_company")
public class CompanyModelEntity extends BaseEntity implements Serializable {
    @Column(name = "company_name")
    private String companyName;

    @Column(name = "company_email")
    private String companyEmail;

    @Column(name = "company_type")
    private String companyType;

    @Column(name = "bs_code")
    private String bsCode;
}
