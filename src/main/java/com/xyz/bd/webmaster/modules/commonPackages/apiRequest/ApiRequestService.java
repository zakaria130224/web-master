package com.xyz.bd.webmaster.modules.commonPackages.apiRequest;

import org.json.JSONObject;

import java.io.IOException;
import java.util.Map;

public interface ApiRequestService {
    String sendGetRequest(String url, Map<String, String> headers) throws IOException;

    String sendPostRequest(String url, Map<String, String> headers, String contentType, String payload) throws IOException;

    JSONObject sendPostRequestAndGetJSON(String url, Map<String, String> headers, String contentType, String payload) throws IOException;
}

