package com.xyz.bd.webmaster.modules.commonPackages.apiRequest;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;

@Service
public class ApiRequestServiceImpl implements ApiRequestService{
    @Override
    public String sendGetRequest(String url, Map<String, String> headers) throws IOException {
        URL apiUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

        // Set the request method and headers
        connection.setRequestMethod("GET");
        setHeaders(connection, headers);

        int responseCode = connection.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            return response.toString();
        } else {
            // Handle the error response
            throw new IOException("GET request failed with response code: " + responseCode);
        }
    }

    @Override
    public String sendPostRequest(String url, Map<String, String> headers, String contentType, String payload) throws IOException {
        URL apiUrl = new URL(url);
        HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

        // Set the request method and headers
        connection.setRequestMethod("POST");
        setHeaders(connection, headers);
        connection.setRequestProperty("Content-Type", contentType);
        connection.setDoOutput(true);

        try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
            wr.writeBytes(payload);
            wr.flush();
        }

        int responseCode = connection.getResponseCode();

        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            return response.toString();
        } else {
            // Handle the error response
            throw new IOException("POST request failed with response code: " + responseCode);
        }
    }

    @Override
    public JSONObject sendPostRequestAndGetJSON(String url, Map<String, String> headers, String contentType, String payload) throws IOException {
        String response = sendPostRequest(url, headers, contentType, payload);
        return new JSONObject(response);
    }

    private void setHeaders(HttpURLConnection connection, Map<String, String> headers) {
        if (headers != null) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                connection.setRequestProperty(entry.getKey(), entry.getValue());
            }
        }
    }
}
