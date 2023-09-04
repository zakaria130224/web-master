package com.xyz.bd.webmaster.modules.commonPackages.responsibleTeam;


import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_com_responsible_team")
public class ResponsibleTeamModel extends BaseEntity implements Serializable {
    @Column(name="team_name")
    private String teamName;

    @Column(name="owner_id")
    private Long ownerId;

    @Column(name="owner_name")
    private String ownerName;

    @Column(name="owner_email")
    private String ownerEmail;

    @Column(name="owner_phone")
    private String ownerPhone;

    @Column(name="owner_group_id")
    private Long ownerGroupId;

    @Column(name="owner_group_name")
    private String ownerGroupName;

    @Column(name="owner_group_email")
    private String ownerGroupEmail;

    @Column(name="owner_group_phone")
    private String ownerGroupPhone;

    @Column(name="status")
    private Boolean status;

}
