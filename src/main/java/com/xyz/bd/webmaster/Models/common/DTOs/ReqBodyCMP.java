package com.xyz.bd.webmaster.Models.common.DTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReqBodyCMP {
    private String cli;
    private String password;
    private String messagetype;
    private String apicode;
    private String countrycode;
    private String messageid;
    private String nonmasking;
    private String msisdn;
    private String message;
    private String username;
}
