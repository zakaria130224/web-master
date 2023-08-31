package com.xyz.bd.webmaster.modules.actionLogs;

import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;


@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_action_logs")
public class ActionLogsModel extends BaseEntity {
    private Date event_date;
    private Long foreign_id;
    private String foreign_table;
    private Long user_id;
    private String msisdn;
    private Long action_type_id;
    private String action_type_name;
    private String pre_status;
    private String post_status;
    private String old_data;
    private String new_data;
    private String note;
}
