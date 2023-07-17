package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DTOUserResponsibilityMap {

    private Long responsibilityId;
    private String responsibilityName;
    private boolean primary;

}
