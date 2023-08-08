package com.xyz.bd.webmaster.Modules.VTS.ExpenseLogs;

import com.fasterxml.jackson.annotation.JsonFormat;
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
import java.util.Date;

@Data
@Entity
@Table(name = "tbl_expense_logs")
@DynamicUpdate
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class ExpenseModelEntity extends BaseEntity {
    @Column(name = "category_name")
    @JsonProperty("categoryName")
    private String categoryName;

    @Column(name = "company_id")
    @JsonProperty("companyId")
    private Long companyId;

    @Column(name = "description")
    @JsonProperty("description")
    private String description;

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

    @Column(name = "expense_log_dt")
    @JsonProperty("expenseLogDt")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Dhaka")
    private Date expenseLogDt;

    @Column(name = "expense_type_name")
    @JsonProperty("expenseTypeName")
    private String expenseTypeName;

    @Column(name = "imei")
    @JsonProperty("imei")
    private String imei;

    @Column(name = "model")
    @JsonProperty("model")
    private String model;

    @Column(name = "total_price_bdt")
    @JsonProperty("totalPriceBdt")
    private double totalPriceBdt;

    @Column(name = "type_name")
    @JsonProperty("typeName")
    private String typeName;

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
}
