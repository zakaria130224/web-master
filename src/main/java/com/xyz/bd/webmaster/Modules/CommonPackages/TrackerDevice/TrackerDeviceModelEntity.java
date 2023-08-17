package com.xyz.bd.webmaster.Modules.CommonPackages.TrackerDevice;

import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
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
@Table(name = "tbl_tracker_device_info")
public class TrackerDeviceModelEntity extends BaseEntity implements Serializable {

    @Column(name = "user_id")
    private Long userId;
    @Column(name = "imei")
    private String imei;


}
