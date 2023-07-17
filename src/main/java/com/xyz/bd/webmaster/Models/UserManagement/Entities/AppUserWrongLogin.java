package com.xyz.bd.webmaster.Models.UserManagement.Entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

@Data
@Entity
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "APP_WRONG_LOGIN")
public class AppUserWrongLogin {
    @Id
    @Column(name = "ID")
    @JsonProperty("Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "USER_ID")
    @JsonProperty("UserId")
    private long userId;

    @Column(name = "USER_NAME")
    @JsonProperty("UserName")
    private String userName;

    @CreationTimestamp
    @Column(name = "CREATED_AT")
    @JsonProperty("CreatedAt")
    private Date createdAt;

    @Column(name = "IP")
    @JsonProperty("IP")
    private String ip;

    @Column(name = "STATUS")
    @JsonProperty("Status")
    private boolean status;


}
