package com.xyz.bd.webmaster.models.UserManagement.DTOs;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReqResponsibility {

    private Long id;
    private String name;
    private String description;
    private boolean active;
    private String menus;

}
