package com.xyz.bd.webmaster.models.UserManagement.DTOs;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DTOUserResponsibilityMap {

    private Long responsibilityId;
    private String responsibilityName;
    private boolean primary;

}
