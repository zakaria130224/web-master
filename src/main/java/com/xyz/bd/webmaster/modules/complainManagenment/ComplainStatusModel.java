package com.xyz.bd.webmaster.modules.complainManagenment;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;

import javax.persistence.Column;
import java.io.Serializable;

public class ComplainStatusModel extends BaseEntity implements Serializable {

    @Column(name = "order_name")
    @JsonProperty("orderName")
    private String orderName;

    @Column(name = "b2b")
    @JsonProperty("b2b")
    private Boolean b2b;

    @Column(name = "b2c")
    @JsonProperty("b2c")
    private Boolean b2c;

    @Column(name = "partner")
    @JsonProperty("partner")
    private Boolean partner;

    @Column(name = "status")
    @JsonProperty("status")
    private Boolean status;

    @Column(name = "remarks")
    @JsonProperty("remarks")
    private String remarks;

}
