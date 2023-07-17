package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xyz.bd.webmaster.Models.common.DTOs.BaseDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DTOResetPassword extends BaseDTO {

    @JsonProperty("Id")
    private Long id;

    @JsonProperty("UserName")
    private String userName;

    @JsonProperty("NewPassword")
    private String newPassword;

    @JsonProperty("OldPassword")
    private String oldPassword;

    /*
    Force or Self
     */
    @JsonProperty("ResetType")
    private String resetType;


}
