package com.xyz.bd.webmaster.AppLogger.Service;


import com.xyz.bd.webmaster.AppLogger.Model.Entities.AuditLogger;
import com.xyz.bd.webmaster.AppLogger.Repository.AuditLoggerRepository;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUserSession;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Utility.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.ContentCachingRequestWrapper;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class AuditLoggerService {
    Logger logger = LoggerFactory.getLogger(AuditLoggerService.class);

    @Autowired
    private AuditLoggerRepository auditLoggerRepository;

    public void preparedAuditItem(HttpServletRequest request, String loggerId) {
        if (request != null && request.getRequestURI() != null && (!request.getRequestURI().contains("/assets/")) || (!request.getRequestURI().contains("favicon"))) {
            try {
                AuditLogger app_logger = new AuditLogger();

                DTOUserSession appUser = SessionManager.getUserDetails(request);
                app_logger.setUserLoginName(SessionManager.getUserLoginName(request));
                app_logger.setUserId(SessionManager.getUserID(request));

                if (request.getHeader("X-FORWARDED-FOR") == null || request.getHeader("X-FORWARDED-FOR").isEmpty()) {
                    app_logger.setIp(request.getRemoteAddr());
                } else {
                    app_logger.setIp(request.getHeader("X-FORWARDED-FOR"));
                }
                //app_logger.setCreatedAt(new Date());
                app_logger.setReqUri(getRequestUri(request.getRequestURI()));
                app_logger.setServerIp(request.getLocalAddr());
                app_logger.setReqMethod(request.getMethod());
                //String requestBody = "";

                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String requestBody = "";
                    try {
                        HttpServletRequest requestCacheWrapperObject
                                = new ContentCachingRequestWrapper(request);
                        requestBody = mapToString(requestCacheWrapperObject.getParameterMap());
                        if (requestBody.isEmpty())
                            requestBody = request.getQueryString();
                        if (requestBody != null && !requestBody.isEmpty())
                            requestBody = URLDecoder.decode(requestBody, "UTF-8");

                        if (requestBody != null && requestBody.length() > 4000) {
                            requestBody = requestBody.substring(0, 3999);
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
//                    try {
//                        requestBody = request.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
//
//                        app_logger.setReqBody(requestBody.replaceAll("\\s+", " "));
//                    } catch (Exception e) {
//                        e.printStackTrace();
//                    }

                    app_logger.setReqBody(requestBody);
                }
//
//                if ("GET".equalsIgnoreCase(request.getMethod())) {
//                    app_logger.setQueryStr(getRequestUri(request.getRequestURI()));
//                }

                app_logger.setUserAgent(request.getHeader("User-Agent"));
                app_logger.setLoggerId(loggerId);
                app_logger.setApplicationName(Constant.applicationName);

                logger.info(app_logger.toString());
                auditLoggerRepository.save(app_logger);
            } catch (Exception e) {
                e.printStackTrace();
                logger.error("Audit log request writing exception");
                logger.error(e.getMessage(), e);

            }
        }
    }


    private String getRequestUri(String uri) {
        String requestURI = uri;
        if (requestURI.startsWith("/") && requestURI.length() > 1)
            requestURI = requestURI.substring(1);

        if (requestURI.startsWith("dcrm/") && requestURI.length() > 5) {
            requestURI = requestURI.substring(5);
        } else if (requestURI.startsWith("dcrm/")) {
            requestURI = requestURI.substring(4);
        }

        return requestURI;
    }

    private String mapToString(Map<String, String[]> map) {
        StringBuilder stringBuilder = new StringBuilder();

        for (String key : map.keySet()) {
            if (stringBuilder.length() > 0) {
                stringBuilder.append("&");
            }
            String[] value = map.get(key);
            try {
                stringBuilder.append((key != null ? URLEncoder.encode(key, "UTF-8") : ""));
                stringBuilder.append("=");
                stringBuilder.append(value != null ? URLEncoder.encode(getStringArrayToString(value), "UTF-8") : "");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return stringBuilder.toString();
    }

    private String getStringArrayToString(String[] strings) {
        StringBuilder builder = new StringBuilder();
        for (String s : strings) {
            if (s.trim().length() > 0)
                builder.append(s.trim());
        }
        return builder.toString();
    }

    private String getParsedData(String body, String key) {
        String value = "";
        try {
            String[] params = body.split("&");
            for (String param : params) {
                String[] parts = param.split("=");
                if (parts[0].equalsIgnoreCase(key) && parts.length > 1)
                    return parts[1];
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return value;
    }

    public static String getBody(HttpServletRequest request) throws IOException {

        String body = null;
        StringBuilder stringBuilder = new StringBuilder();
        BufferedReader bufferedReader = null;

        try {
            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = bufferedReader.read(charBuffer)) > 0) {
                    stringBuilder.append(charBuffer, 0, bytesRead);
                }
            } else {
                stringBuilder.append("");
            }
        } catch (IOException ex) {
            throw ex;
        } finally {
            if (bufferedReader != null) {
                try {
                    bufferedReader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }

        body = stringBuilder.toString();
        return body;
    }

}
