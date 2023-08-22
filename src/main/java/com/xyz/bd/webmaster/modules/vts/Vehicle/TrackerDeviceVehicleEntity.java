package com.xyz.bd.webmaster.modules.vts.Vehicle;


import com.fasterxml.jackson.annotation.JsonProperty;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.sql.Date;

@Data
@Entity
@Table(name = "tbl_tracker_device_info")
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@DynamicUpdate
public class TrackerDeviceVehicleEntity extends BaseEntity {
    @Column(name = "user_id")
    @JsonProperty("userId")
    private Long userId;


    @Column(name = "imei")
    @JsonProperty("imei")
    private String imei;


    //Vehicle Name
    @Column(name = "device_name")
    @JsonProperty("deviceName")
    private String deviceName;


    @Column(name = "vehicle_no")
    @JsonProperty("vehicleNo")
    private String vehicleNo;


    @Column(name = "customer_name")
    @JsonProperty("customerName")
    private String customerName;


    @Column(name = "cell_phone")
    @JsonProperty("cellPhone")
    private String cellPhone;


    @Column(name = "user_email")
    @JsonProperty("userEmail")
    private String userEmail;


    @Column(name = "max_speed")
    @JsonProperty("maxSpeed")
    private String maxSpeed;


    @Column(name = "speed_limit")
    @JsonProperty("speedLimit")
    private Long speedLimit;


    @Column(name = "geo_fence")
    @JsonProperty("geoFence")
    private String geoFence;


    @Column(name = "speed_monitor")
    @JsonProperty("speedMonitor")
    private String speedMonitor;


    @Column(name = "sms_option")
    @JsonProperty("smsOption")
    private String smsOption;


    @Column(name = "sms")
    @JsonProperty("sms")
    private String sms;


    @Column(name = "min")
    @JsonProperty("min")
    private String min;


    @Column(name = "data")
    @JsonProperty("data")
    private String data;


    @Column(name = "email_option")
    @JsonProperty("emailOption")
    private String emailOption;


    @Column(name = "vts_sim")
    @JsonProperty("vtsSim")
    private String vtsSim;


    @Column(name = "manufacturer")
    @JsonProperty("manufacturer")
    private String manufacturer;


    @Column(name = "model")
    @JsonProperty("model")
    private String model;


    @Column(name = "color")
    @JsonProperty("color")
    private String color;


    @Column(name = "device_category")
    @JsonProperty("deviceCategory")
    private String deviceCategory;

    @Column(name = "device_sub_category")
    @JsonProperty("deviceSubCategory")
    private String deviceSubCategory;

    @Column(name = "vehicle_type")
    @JsonProperty("vehicleType")
    private String vehicleType;

    @Column(name = "live")
    @JsonProperty("live")
    private boolean live;


    @Column(name = "status")
    @JsonProperty("status")
    private boolean status;


    @Column(name = "price")
    @JsonProperty("price")
    private Long price;


    @Column(name = "last_renewal_date")
    @JsonProperty("lastRenewalDate")
    private Date lastRenewalDate;


    @Column(name = "auto_renewal")
    @JsonProperty("autoRenewal")
    private boolean autoRenewal;


    @Column(name = "renew_date")
    @JsonProperty("renewDate")
    private Date renewDate;


    @Column(name = "deactivation_date")
    @JsonProperty("deactivationDate")
    private Date deactivationDate;


    @Column(name = "engine_no")
    @JsonProperty("engineNo")
    private String engineNo;


    @Column(name = "chassis_no")
    @JsonProperty("chassisNo")
    private String chassisNo;


    @Column(name = "cc")
    @JsonProperty("cc")
    private String cc;


    @Column(name = "order_id")
    @JsonProperty("orderId")
    private String orderId;


    @Column(name = "data_pack_name")
    @JsonProperty("dataPackName")
    private String dataPackName;


    @Column(name = "last_imei_update")
    @JsonProperty("lastImeiUpdate")
    private Date lastImeiUpdate;


    @Column(name = "vendor_name")
    @JsonProperty("vendorName")
    private String vendorName;


    @Column(name = "device_model")
    @JsonProperty("deviceModel")
    private String deviceModel;


    @Column(name = "sim_type")
    @JsonProperty("simType")
    private String simType;


    @Column(name = "monthly_charge")
    @JsonProperty("monthlyCharge")
    private Integer monthlyCharge;


    @Column(name = "package_type")
    @JsonProperty("packageType")
    private String packageType;


    @Column(name = "user_type")
    @JsonProperty("userType")
    private String userType;


    @Column(name = "customer_address")
    @JsonProperty("customerAddress")
    private String customerAddress;


    @Column(name = "installation_date")
    @JsonProperty("installationDate")
    private Date installationDate;


    @Column(name = "device_add_date")
    @JsonProperty("deviceAddDate")
    private Date deviceAddDate;

    @Column(name = "is_favourite")
    @JsonProperty("isFavourite")
    private boolean favourite;

    @Column(name = "driver_id")
    @JsonProperty("driverId")
    private Long driverId;

    @Column(name = "driver_name")
    @JsonProperty("driverName")
    private String driverName;


    @Column(name = "driver_mobile_no")
    @JsonProperty("driverMobileNo")
    private String driverMobileNo;
}
