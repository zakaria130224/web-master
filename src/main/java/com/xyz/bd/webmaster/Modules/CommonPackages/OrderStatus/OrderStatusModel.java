package com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus;

import com.xyz.bd.webmaster.Models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_order_status")
public class OrderStatusModel extends BaseEntity {
    private String order_name;
    private Integer b2b_sim;
    private Integer b2b_simless;
    private Integer gpc_sim;
    private Integer gpc_simless;
    private Integer gpshop_sim;
    private Integer gpshop_simless;
    private Boolean status;
    private String remarks;

}
