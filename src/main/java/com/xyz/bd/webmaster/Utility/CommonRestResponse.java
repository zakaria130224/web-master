package com.xyz.bd.webmaster.Utility;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonRestResponse implements Serializable {
    private int code = -1;
    private Object message;
    private Object data;
}
