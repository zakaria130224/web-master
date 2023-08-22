package com.xyz.bd.webmaster.models.common.ResponseModel;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FailedResponse {

    @JsonProperty("Message")
    String message;

    public FailedResponse(String message) {
        this.message = message;
    }
}
