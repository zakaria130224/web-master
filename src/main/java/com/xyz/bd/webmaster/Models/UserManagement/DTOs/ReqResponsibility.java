package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
public class ReqResponsibility {

    private Long id;
    private String name;
    private String description;
    private boolean active;
    private String menus;

}
