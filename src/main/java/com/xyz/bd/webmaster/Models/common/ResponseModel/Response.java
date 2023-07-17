package com.xyz.bd.webmaster.Models.common.ResponseModel;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@NoArgsConstructor
public class Response {
    @JsonProperty("ResponseHeader")
    ResponseHeader responseHeader;

    @JsonProperty("Data")
    Object data;

    @JsonProperty("Error")
    String error;

    public Response(ResponseHeader responseHeader, Object data) {
        this.responseHeader = responseHeader;
        this.data = data;
    }

    public Response(ResponseHeader responseHeader) {
        this.responseHeader = responseHeader;
    }

    public Response(ResponseHeader responseHeader, String error) {
        this.responseHeader = responseHeader;
        this.error = error;
    }

}
