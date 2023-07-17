package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

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

}
