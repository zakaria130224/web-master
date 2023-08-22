package com.xyz.bd.webmaster.modules.commonPackages.orderStatus;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

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
