package com.xyz.bd.webmaster.AppLogger.Model.Entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@Table(name = "TBL_AUDIT_LOGGER")
public class AuditLogger {
    @Id
    @Column(name = "ID")
    @JsonProperty("Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreationTimestamp
    @Column(name = "CREATED_AT")
    @JsonProperty("CreatedAt")
    private Date createdAt;

    @Column(name = "USER_LOGIN_NAME")
    @JsonProperty("UserLoginName")
    private String userLoginName;

    @Column(name = "USER_ID")
    @JsonProperty("UserId")
    private Long userId;

    @Column(name = "IP")
    @JsonProperty("IP")
    private String ip;

    @Column(name = "USER_AGENT")
    @JsonProperty("UserAgent")
    private String userAgent;

    @Column(name = "SERVER_IP")
    @JsonProperty("ServerIp")
    private String serverIp;

    @Column(name = "LOGGER_ID")
    @JsonProperty("LoggerId")
    private String loggerId;

    @Column(name = "REQ_METHOD")
    @JsonProperty("ReqMethod")
    private String reqMethod;


    @Column(name = "REQ_BODY")
    @JsonProperty("ReqBody")
    private String reqBody;

    @Column(name = "REQ_URI")
    @JsonProperty("ReqUri")
    private String reqUri;

    @Column(name = "APPLICATION_NAME")
    @JsonProperty("ApplicationName")
    private String applicationName;
}
