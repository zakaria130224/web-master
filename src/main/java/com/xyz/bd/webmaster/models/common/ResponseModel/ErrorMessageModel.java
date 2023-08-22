package com.xyz.bd.webmaster.models.common.ResponseModel;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ErrorMessageModel {
    @JsonProperty("ErrorCode")
    int ErrorCode;

    @JsonProperty("Message")
    String Message;
}
