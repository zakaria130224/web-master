package com.xyz.bd.webmaster.Modules.VTS.Order;

import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_order")
public class OrderModelEntity extends BaseEntity implements Serializable {

    private String chtTicket;
    private String email;
    private String customer_name;
    private String is_paid;
    private String address;
    private String source;
    private Date create_date;
    private Integer status;
    private Date sla_datetime;
    private Date closed_datetime;
    private Integer current_assigned_group_id;
    private Integer wic_center_id;
    private String wic_center_name;
    private Date schedule_taken_time;
    private String schedule_time;
    private Date installation_time;
    private String alternative_number;
    private String payment_method;
    private Integer user_id;
    private String bs_code;
    private String vts_sim;
    private String sim_kit;
    private String pack_name;
    private String base_price;
    private String vid;
    private String rate_plan_name;
    private String mrp;
    private String alt_contact_num;
    private String kcp_name;
    private String kcp_email;
    private String sup_partner_name;
    private String product_type;
    private String audio_num;
    private String company_name;
    private String kcp_contact_num;



}
