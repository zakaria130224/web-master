package com.xyz.bd.webmaster.Models.UserManagement.DTOs;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
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
