package com.xyz.bd.webmaster.modules.commonPackages.user;

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
@Table(name = "tbl_user")
public class UserModelEntity extends BaseEntity implements Serializable {
    @Column(name = "username")
    private String userName;

    @Column(name = "password")
    private String password;

    @Column(name = "full_username")
    private String fullName;

    @Column(name = "is_active")
    private Integer isActive;

    @Column(name = "mobile_number")
    private String mobileNumber;

}
