package com.xyz.bd.webmaster.modules.commonPackages.trackerDevice;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

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

    @Column(name = "device_name")
    private String deviceName;

    @Column(name = "vehicle_no")
    private String vehicleNo;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "cell_phone")
    private String cellPhone;

    @Column(name = "vts_sim")
    private String vtsSim;

    @Column(name = "device_category")
    private String deviceCategory;

    @Column(name = "price")
    private Double price;

    @Column(name = "order_id")
    private Long orderId;

    @Column(name = "data_pack_name")
    private String dataPackName;

    @Column(name = "company_id")
    private Long companyId;

    @Column(name = "company_name")
    private String companyName;

    @Column(name = "installation_date")
    private Date installationDate;

    @Column(name = "device_add_date")
    private Date deviceAddDate;
}
