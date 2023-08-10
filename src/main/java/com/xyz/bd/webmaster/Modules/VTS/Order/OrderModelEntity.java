package com.xyz.bd.webmaster.Modules.VTS.Order;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_order")
public class OrderModelEntity {
    private String msisdn;
    private String email;
    private String customer_name;
    private String is_paid;
    private String address;
    private String source;
    private Date create_date;
    private Number status;
    private Date sla_datetime;
    private Date closed_datetime;
    private Number current_assigned_group_id;
    private Number wic_center_id;
    private String wic_center_name;
    private Date schedule_taken_time;
    private String schedule_time;
    private Date installation_time;
    private String alternative_number;
    private String payment_method;
    private Number user_id;
    @Id
    private Long id;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
