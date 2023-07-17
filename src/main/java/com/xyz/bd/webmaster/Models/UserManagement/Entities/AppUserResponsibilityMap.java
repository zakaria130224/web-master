package com.xyz.bd.webmaster.Models.UserManagement.Entities;

import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "MD_USER_RESPONSIBILITY_MAP")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
public class AppUserResponsibilityMap extends BaseEntity {
    @Column(name = "USER_ID")
    private Long userId;

    @Column(name = "RESPONSIBILITY_ID")
    private Long responsibilityId;

    @Column(name = "RESPONSIBILITY_NAME")
    private String responsibilityName;

    @Column(name = "IS_PRIMARY")
    private boolean primary;

    @Column(name = "ACTIVE")
    private boolean active;


}
