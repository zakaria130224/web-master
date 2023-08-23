package com.xyz.bd.webmaster.modules.commonPackages.trackerDevice;

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
@Table(name = "tbl_tracker_device_info")
public class TrackerDeviceModelEntity extends BaseEntity implements Serializable {

    @Column(name = "user_id")
    private Long userId;
    @Column(name = "imei")
    private String imei;

    @Column(name = "tracker_device_id")
    private Long trackerDeviceId;

    @Column(name = "user_email")
    private String userEmail;


}
