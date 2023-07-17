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
@Table(name = "TBL_CHANGE_PASSWORD_HISTORY")
public class AppUserPasswordHistory {
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

    @Column(name = "USER_PASSWORD")
    @JsonProperty("UserPassword")
    private String userPassword;

    @Column(name = "OLD_PASSWORD")
    @JsonProperty("OldPassword")
    private String oldPassword;

    @Column(name = "CHANGE_TYPE")
    @JsonProperty("ChangeType")
    private String changeType;

    @Column(name = "CHANGE_REASONS")
    @JsonProperty("ChangeReason")
    private String changeReason;

    @Column(name = "CHANNEL")
    @JsonProperty("Channel")
    private String channel;

    @CreationTimestamp
    @Column(name = "CREATED_AT")
    @JsonProperty("CreatedAt")
    private Date createdAt;

    @Column(name = "UPDATED_BY")
    @JsonProperty("UpdatedBy")
    private String updatedBy;


}
