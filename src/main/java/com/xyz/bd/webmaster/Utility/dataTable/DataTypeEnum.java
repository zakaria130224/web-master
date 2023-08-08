package com.xyz.bd.webmaster.Utility.dataTable;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum DataTypeEnum {
    LONG("Long"),
    STRING("String"),
    INTEGER("Integer"),
    TIMESTAMP("TIMESTAMP");
    private final String name;
}
