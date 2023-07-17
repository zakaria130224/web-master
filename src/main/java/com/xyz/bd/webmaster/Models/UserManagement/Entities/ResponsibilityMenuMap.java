package com.xyz.bd.webmaster.Models.UserManagement.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "MD_RESPONSIBILITY_MENU_MAP")
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
