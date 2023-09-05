package com.xyz.bd.webmaster.modules.complainManagenment;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_complaints")
public class ComplainModel extends BaseEntity  {

    @Column(name = "user_id")
    @JsonProperty("userId")
    private Long userId;

    @Column(name = "customer_name")
    @JsonProperty("customerName")
    private String customerName;

    @Column(name = "customer_contact_number")
    @JsonProperty("customerContactNumber")
    private String customerContactNumber;

    @Column(name = "customer_email")
    @JsonProperty("customerEmail")
    private String customerEmail;

    @Column(name = "com_status_name")
    @JsonProperty("comStatusName")
    private String comStatusName;

    @Column(name = "com_status_id")
    @JsonProperty("comStatusId")
    private Integer comStatusId;

    @Column(name = "complaint_id")
    @JsonProperty("complaintId")
    private String complaintId;

    @Column(name = "sts_ticket_id")
    @JsonProperty("stsTicketId")
    private String stsTicketId;

    @Column(name = "source_name")
    @JsonProperty("sourceName")
    private String sourceName;

    @Column(name = "is_calendar_day")
    @JsonProperty("isCalendarDay")
    private Boolean isCalendarDay;

    @Column(name = "contact_sla_min")
    @JsonProperty("contactSlaMin")
    private Long contactSlaMin;

    @Column(name = "resolved_sla_min")
    @JsonProperty("resolvedSlaMin")
    private Integer resolvedSlaMin;

    @Column(name = "is_contact_sla_exceed")
    @JsonProperty("isContactSlaExceed")
    private Boolean isContactSlaExceed;

    @Column(name = "is_resolved_sla_exceed")
    @JsonProperty("isResolvedSlaExceed")
    private Boolean isResolvedSlaExceed;

    @Column(name = "sla_contact_est_dt")
    @JsonProperty("slaContactEstDt")
    private Date slaContactEstDt;

    @Column(name = "sla_resolved_est_dt")
    @JsonProperty("slaResolvedEstDt")
    private Date slaResolvedEstDt;

    @Column(name = "responsible_team_id")
    @JsonProperty("responsibleTeamId")
    private Long responsibleTeamId;

    @Column(name = "responsible_team_name")
    @JsonProperty("responsibleTeamName")
    private String responsibleTeamName;

    @Column(name = "vendor_id")
    @JsonProperty("vendorId")
    private Long vendorId;

    @Column(name = "vendor_name")
    @JsonProperty("vendorName")
    private String vendorName;

    @Column(name = "vendor_email")
    @JsonProperty("vendorEmail")
    private String vendorEmail;

    @Column(name = "new_complaint_dt")
    @JsonProperty("newComplaintDt")
    private Date newComplaintDt;

    @Column(name = "new_complaint_note")
    @JsonProperty("newComplaintNote")
    private String newComplaintNote;

    @Column(name = "new_complaint_by")
    @JsonProperty("newComplaintBy")
    private String newComplaintBy;

    @Column(name = "first_contact_dt")
    @JsonProperty("firstContactDt")
    private Date firstContactDt;

    @Column(name = "first_contact_note")
    @JsonProperty("firstContactNote")
    private String firstContactNote;

    @Column(name = "first_contact_by")
    @JsonProperty("firstContactBy")
    private String firstContactBy;

    @Column(name = "scheduled_dt")
    @JsonProperty("scheduledDt")
    private Date scheduledDt;

    @Column(name = "scheduled_appointed_dt")
    @JsonProperty("scheduledAppointedDt")
    private Date scheduledAppointedDt;

    @Column(name = "scheduled_note")
    @JsonProperty("scheduledNote")
    private String scheduledNote;

    @Column(name = "scheduled_by")
    @JsonProperty("scheduledBy")
    private String scheduledBy;

    @Column(name = "processing_dt")
    @JsonProperty("processingDt")
    private Date processingDt;

    @Column(name = "processing_note")
    @JsonProperty("processingNote")
    private String processingNote;

    @Column(name = "processing_by")
    @JsonProperty("processingBy")
    private String processingBy;

    @Column(name = "resolved_dt")
    @JsonProperty("resolvedDt")
    private Date resolvedDt;

    @Column(name = "resolved_note")
    @JsonProperty("resolvedNote")
    private String resolvedNote;

    @Column(name = "resolved_by")
    @JsonProperty("resolvedBy")
    private String resolvedBy;

    @Column(name = "device_replace_dt")
    @JsonProperty("deviceReplaceDt")
    private Date deviceReplaceDt;

    @Column(name = "device_replace_note")
    @JsonProperty("deviceReplaceNote")
    private String deviceReplaceNote;

    @Column(name = "device_replace_by")
    @JsonProperty("deviceReplaceBy")
    private String deviceReplaceBy;

    @Column(name = "refund_dt")
    @JsonProperty("refundDt")
    private Date refundDt;

    @Column(name = "refund_note")
    @JsonProperty("refundNote")
    private String refundNote;

    @Column(name = "refund_by")
    @JsonProperty("refundBy")
    private String refundBy;

    @Column(name = "unsolvable_dt")
    @JsonProperty("unsolvableDt")
    private Date unsolvableDt;

    @Column(name = "unsolvable_note")
    @JsonProperty("unsolvableNote")
    private String unsolvableNote;

    @Column(name = "unsolvable_by")
    @JsonProperty("unsolvableBy")
    private String unsolvableBy;

    @Column(name = "cancelled_dt")
    @JsonProperty("cancelledDt")
    private Date cancelledDt;

    @Column(name = "cancelled_note")
    @JsonProperty("cancelledNote")
    private String cancelledNote;

    @Column(name = "cancelled_by")
    @JsonProperty("cancelledBy")
    private String cancelledBy;

    @Column(name = "otp_verified")
    @JsonProperty("otpVerified")
    private Boolean otpVerified;

    @Column(name = "imei")
    @JsonProperty("imei")
    private String imei;

    @Column(name = "vts_sim_no")
    @JsonProperty("vtsSimNo")
    private String vtsSimNo;

    @Column(name = "sim_kit")
    @JsonProperty("simKit")
    private String simKit;

    @Column(name = "device_category")
    @JsonProperty("deviceCategory")
    private String deviceCategory;

    @Column(name = "device_sub_category")
    @JsonProperty("deviceSubCategory")
    private String deviceSubCategory;

    @Column(name = "city")
    @JsonProperty("city")
    private String city;

    @Column(name = "district")
    @JsonProperty("district")
    private String district;

    @Column(name = "thana")
    @JsonProperty("thana")
    private String thana;

    @Column(name = "company_id")
    @JsonProperty("companyId")
    private Long companyId;

    @Column(name = "company_name")
    @JsonProperty("companyName")
    private String companyName;

    @Column(name = "user_type")
    @JsonProperty("userType")
    private String userType;

    @Column(name = "service_area")
    @JsonProperty("serviceArea")
    private String serviceArea;

    @Column(name = "product_type")
    @JsonProperty("productType")
    private String productType;

    @Column(name = "product_id")
    @JsonProperty("productId")
    private Long productId;
}
