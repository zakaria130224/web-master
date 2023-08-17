package com.xyz.bd.webmaster.Enum;

import lombok.AllArgsConstructor;
import lombok.Getter;

@AllArgsConstructor
@Getter
public enum OrderStatusEnum {
    NEW_ORDER (0),
    SCHEDULED(1),
    SIM_ACTIVE(2);
    private Integer id;
}
