package com.xyz.bd.webmaster.Models.UserManagement.Entities;

import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "MD_MENU")
@DynamicUpdate
public class Menu extends BaseEntity implements Serializable {


    @Column(name = "NAME")
    private String name;

    @Column(name = "MENU_URL")
    private String menuUrl;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "ICON_CLASS")
    private String iconClass;

    @Column(name = "IS_PARENT")
    private boolean parent;

    @Column(name = "PARENT_ID")
    private Long parentId;

    @Column(name = "IS_AJAX_URL")
    private boolean ajaxUrl;

    @Column(name = "HAS_LINK")
    private boolean hasLink;

    @Column(name = "CHECK_FULL_PATH")
    private String checkFullPath;

    @Column(name = "PRIORITY")
    private Long priority;

    @Column(name = "IS_SIDEBAR_MENU")
    private boolean sidebarMenu;

    @Column(name = "IS_API")
    private boolean api;

    @Column(name = "ACTIVE")
    private boolean active;

}
