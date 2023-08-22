package com.xyz.bd.webmaster.models.UserManagement.DTOs;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.io.Serializable;
import java.util.List;

@Data
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class MenuTree implements Serializable {

    private Long id;

    private String name;

    private String menuUrl;

    private String description;

    private String iconClass;

    private boolean parent;

    private Long parentId;

    private boolean ajaxUrl;

    private boolean hasLink;

    private String checkFullPath;

    private Long priority;

    private boolean sidebarMenu;

    private boolean api;

    private boolean active;


    private List<MenuTree> child;


}
