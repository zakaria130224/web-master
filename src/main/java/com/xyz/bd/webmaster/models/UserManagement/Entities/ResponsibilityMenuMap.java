package com.xyz.bd.webmaster.models.UserManagement.Entities;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Data
@Entity
@Table(name = "sf_md_responsibility_menu_map")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
public class ResponsibilityMenuMap extends BaseEntity {


    @Column(name = "RESPONSIBILITY_ID")
    private Long responsibilityId;

    @Column(name = "MENU_ID")
    private String menuId;

    @Column(name = "ACTIVE")
    private boolean active;


}
