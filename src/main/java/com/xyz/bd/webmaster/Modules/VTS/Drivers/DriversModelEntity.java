package com.xyz.bd.webmaster.Modules.VTS.Drivers;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;


@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_driver_info")
public class DriversModelEntity {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private String name;
    private String father_name;
    private String mother_name;
    private String spouse_name;
    private String mobile_number;
    private Date dob;
    private String email;
    private String designation;
    private Date join_date;
    private String license_no;
    private String license_type;
    private Date license_issue_date;
    private Date license_expired_date;
    private Long report_manager_id;
    private String report_manager_name;
    private Boolean is_active;
    private String additional_note;
    private Boolean is_assigned;
    private Long device_id;
    private String device_name;
    private String device_imei;
    private String device_model;
    private Double rating_point;
    private String nid;
    private String present_address;
    private String permanent_address;
    private String blood_group;
    private String religion;
    private Number company_id;
    private String user_type;
    private Timestamp created_at;
    private String created_by;
    private Timestamp updated_at;
    private String updated_by;

}
