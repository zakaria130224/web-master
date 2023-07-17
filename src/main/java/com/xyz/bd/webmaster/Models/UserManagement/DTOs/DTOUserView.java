package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@NoArgsConstructor
public class DTOUserView {

    @JsonProperty("Id")
    private Long id;

    @JsonProperty("Name")
    private String name;

    @JsonProperty("LoginName")
    private String loginName;

    @JsonProperty("Email")
    private String email;

    @JsonProperty("UserGroupId")
    private long userGroupId;

    @JsonProperty("UserGroupName")
    private String userGroupName;

    @JsonProperty("Active")
    private boolean active;

    @JsonProperty("IsLock")
    private boolean isLock;

    @JsonProperty("IsNew")
    private boolean isNew;

    @JsonProperty("IsExpired")
    private boolean isExpired;


}
