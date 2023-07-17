package com.xyz.bd.webmaster.Models.UserManagement.Entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

@Data
@Entity
@Table(name = "MD_RESPONSIBILITY")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
public class Responsibility extends BaseEntity {


    @Column(name = "NAME")
    private String name;

    @Column(name = "DESCRIPTION")
    private String description;

    @Column(name = "ACTIVE")
    private boolean active;

    @OneToMany
    @JoinColumn(name = "RESPONSIBILITY_ID", insertable = false, updatable = false)
    @JsonIgnore
    private List<ResponsibilityMenuMap> menuMapList;

}
