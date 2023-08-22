package com.xyz.bd.webmaster.services.CommonServices;

import com.google.gson.Gson;
import com.xyz.bd.webmaster.models.common.DTOs.ReqBodyCMP;
import com.xyz.bd.webmaster.models.common.DTOs.SMS;
import com.xyz.bd.webmaster.utility.Constant;
import okhttp3.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
@SuppressWarnings("java:S2629")
public class SendSMSService {
    private final Logger logger = LoggerFactory.getLogger(SendSMSService.class);

    @Value("${cmp.url}")
    String cmpUrl;
    @Value("${cmp.username}")
    String cmpUserName;
    @Value("${cmp.password}")
    String cmpPassword;
    @Value("${cmp.cli}")
    String cmpCli;

    public boolean sendSMS(SMS sms) {
        try {
            Gson gson = new Gson();
            OkHttpClient client = new OkHttpClient();
            MediaType mediaType = MediaType.parse(Constant.applicationJson);
            RequestBody body = RequestBody.create(mediaType, gson.toJson(new SMS(sms.getPhone().substring(2), sms.getText())));
            Request request = new Request.Builder()
                    .url("https://tteche.grameenphone.com/cmp-middleware/api/v1/sendSMS")
                    .method("POST", body)
                    .addHeader("Content-Type", Constant.applicationJson)
                    .addHeader("Authorization", "Bearer ZfvCU3oeeSzKc9tGYExg1a2wXsoE7qw2LGDdu6UZMuGKuwUwBVZdJhkuqlDCuOts")
                    .build();
            Response response = client.newCall(request).execute();

            logger.info(request.url().toString(), response.toString());
            if (response.code() == 200)
                return true;

        } catch (Exception e) {

            logger.info(e.getMessage());
            return false;
        }

        logger.info("SMS Sent successfully!");
        return true;
    }

    public boolean sendSMSCmP(SMS sms) {
        try {
            Gson gson = new Gson();
            OkHttpClient client = new OkHttpClient();
            MediaType mediaType = MediaType.parse(Constant.applicationJson);
            ReqBodyCMP reqBodyCMP = ReqBodyCMP.builder()
                    .username(cmpUserName)
                    .password(cmpPassword)
                    .cli(cmpUserName)
                    .apicode("1")
                    .msisdn(sms.getPhone().substring(2))
                    .countrycode("880")
                    .messagetype("1")
                    .message(sms.getText())
                    .messageid("0")
                    .nonmasking("0")
                    .build();

            RequestBody body = RequestBody.create(mediaType, gson.toJson(reqBodyCMP));
            Request request = new Request.Builder()
                    .url(cmpUrl)
                    .method("POST", body)
                    .addHeader("Content-Type", Constant.applicationJson).build();
            Response response = client.newCall(request).execute();

            logger.info(request.url().toString(), response.toString());

            return response.code() == 200;

        } catch (Exception e) {

            logger.info(e.getMessage());
            return false;
        }
    }
}