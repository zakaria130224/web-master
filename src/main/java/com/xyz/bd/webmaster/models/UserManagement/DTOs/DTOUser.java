package com.xyz.bd.webmaster.models.UserManagement.DTOs;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class DTOUser {

    private Long id;

    private String name;

    private String loginName;

    private String email;

    private String phone;

    private String password;

    private boolean active;

    private List<DTOUserResponsibilityMap> mapList;

}