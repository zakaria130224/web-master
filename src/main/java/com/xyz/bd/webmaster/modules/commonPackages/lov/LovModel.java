package com.xyz.bd.webmaster.modules.commonPackages.lov;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_lov")
public class LovModel {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "val")
    private String val;

    @Column(name = "type_name")
    private String typeName;

    @Column(name = "is_active")
    private Boolean isActive;

    @Column(name = "parent_id")
    private Long parentId;
}
