package com.xyz.bd.webmaster.Modules.VTS.FuelLogs;

import com.fasterxml.jackson.annotation.JsonProperty;
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
@Table(name = "tbl_fuel_logs")
@DynamicUpdate
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class FuelLogsModelEntity extends BaseEntity {
    @Column(name = "company_id")
    @JsonProperty("companyId")
    private Long companyId;

    @Column(name = "device_id")
    @JsonProperty("deviceId")
    private Long deviceId;

    @Column(name = "driver_id")
    @JsonProperty("driverId")
    private Long driverId;

    @Column(name = "driver_mobile")
    @JsonProperty("driverMobile")
    private String driverMobile;

    @Column(name = "driver_name")
    @JsonProperty("driverName")
    private String driverName;

    @Column(name = "fuel_type_name")
    @JsonProperty("fuelTypeName")
    private String fuelTypeName;

    @Column(name = "model")
    @JsonProperty("model")
    private String model;

    @Column(name = "imei")
    @JsonProperty("imei")
    private String imei;

    @Column(name = "odometer_reading")
    @JsonProperty("odometerReading")
    private double odometerReading;

    @Column(name = "rate_per_litre")
    @JsonProperty("ratePerLitre")
    private double ratePerLitre;

    @Column(name = "total_price_bdt")
    @JsonProperty("totalPriceBdt")
    private double totalPriceBdt;

    @Column(name = "user_id")
    @JsonProperty("userId")
    private Long userId;

    @Column(name = "user_type")
    @JsonProperty("userType")
    private String userType;

    @Column(name = "vehicle_name")
    @JsonProperty("vehicleName")
    private String vehicleName;

    @Column(name = "vehicle_type")
    @JsonProperty("vehicleType")
    private String vehicleType;

    @Column(name = "volumn_in_litre")
    @JsonProperty("volumnInLitre")
    private double volumnInLitre;

}
