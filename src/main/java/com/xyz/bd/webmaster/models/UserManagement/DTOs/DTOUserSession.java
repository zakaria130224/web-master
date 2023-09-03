package com.xyz.bd.webmaster.models.UserManagement.DTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DTOUserSession implements Serializable {

    private Long id;

    private String name;

    private String loginName;

    private String email;

    private String phone;

    private boolean active;

    private String userType;

    private boolean isB2bAdmin;

    private boolean isB2cAdmin;

    private boolean isSystemAdmin;

    private boolean isVendor;

}
