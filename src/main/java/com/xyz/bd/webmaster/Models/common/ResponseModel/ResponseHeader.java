package com.xyz.bd.webmaster.Models.common.ResponseModel;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ResponseHeader {
    @JsonProperty("ResultCode")
    long ResultCode;

    @JsonProperty("ResultDesc")
    String ResultDesc;

    public ResponseHeader(long resultCode, String resultDesc) {
        ResultCode = resultCode;
        ResultDesc = resultDesc;
    }

    public String getResultCodeString() {
        return ResultCode == 0 ? "success" : "warning";
    }
}
