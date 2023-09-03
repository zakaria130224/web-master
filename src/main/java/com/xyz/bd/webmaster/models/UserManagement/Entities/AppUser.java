package com.xyz.bd.webmaster.models.UserManagement.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "tbl_user")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
public class AppUser extends BaseEntity implements Serializable {

    @Column(name = "full_username")
    private String name;

    @Column(name = "username")
    private String loginName;

    @Column(name = "user_email")
    private String email;

    @Column(name = "mobile_number")
    private String phone;

    @Column(name = "password")
    private String password;


    @Column(name = "is_active")
    private boolean active;

    @Column(name = "is_lock")
    private boolean isLock;

    @Column(name = "is_b2b_admin")
    private boolean isB2bAdmin;

    @Column(name = "is_b2c_admin")
    private boolean isB2cAdmin;

    @Column(name = "is_system_admin")
    private boolean isSystemAdmin;

    @Column(name = "is_vendor")
    private boolean isVendor;

    @Column(name = "company_id")
    private Long companyId;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "user_type")
    private String userType;


    @OneToMany
    @JoinColumn(name = "USER_ID", insertable = false, updatable = false)
    @JsonIgnore
    private List<AppUserResponsibilityMap> userResponsibilityMaps;


}
