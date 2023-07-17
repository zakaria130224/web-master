package com.xyz.bd.webmaster.Models.common.Entities;

import com.xyz.bd.webmaster.Config.session.SessionManager;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Data
@MappedSuperclass
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class BaseEntity {
    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @CreationTimestamp
    @Column(name = "CREATED_AT", updatable = false)
    private Date createdAt;

    @Column(name = "UPDATED_AT")
    private Date updatedAt;

    @Column(name = "CREATED_BY", updatable = false)
    private String createdBy;

    @Column(name = "UPDATED_BY")
    private String updatedBy;

    public void setCreatedBySession(HttpServletRequest request) {
        this.createdBy = SessionManager.getUserLoginName(request);
    }

    public void setUpdatedBySession(HttpServletRequest request) {
        this.updatedBy = SessionManager.getUserLoginName(request);
    }

}
