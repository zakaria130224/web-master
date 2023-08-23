package com.xyz.bd.webmaster.modules.orders;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.xyz.bd.webmaster.models.common.Entities.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbl_orders")
public class OrderModelEntity extends BaseEntity implements Serializable {
    @Column(name = "user_id")
    @JsonProperty("userId")
    private Long userId;

    @Column(name = "product_id")
    @JsonProperty("productId")
    private Long productId;

    @Column(name = "product_name")
    @JsonProperty("productName")
    private String productName;

    @Column(name = "product_type")
    @JsonProperty("productType")
    private String productType;

    @Column(name = "sku")
    @JsonProperty("sku")
    private String sku;

    @Column(name = "pack_name")
    @JsonProperty("packName")
    private String packName;

    @Column(name = "rate_plan")
    @JsonProperty("ratePlan")
    private String ratePlan;

    @Column(name = "support_partner_name")
    @JsonProperty("supportPartnerName")
    private String supportPartnerName;

    @Column(name = "customer_name")
    @JsonProperty("customerName")
    private String customerName;

    @Column(name = "customer_contact_number")
    @JsonProperty("customerContactNumber")
    private String customerContactNumber;

    @Column(name = "customer_email")
    @JsonProperty("customerEmail")
    private String customerEmail;

    @Column(name = "audio_listen_msisdn")
    @JsonProperty("audioListenMsisdn")
    private String audioListenMsisdn;

    @Column(name = "quantity")
    @JsonProperty("quantity")
    private Long quantity;

    @Column(name = "base_price")
    @JsonProperty("basePrice")
    private double basePrice;

    @Column(name = "unit_price")
    @JsonProperty("unitPrice")
    private double unitPrice;

    @Column(name = "address")
    @JsonProperty("address")
    private String address;

    @Column(name = "remarks")
    @JsonProperty("remarks")
    private String remarks;

    @Column(name = "status_name")
    @JsonProperty("statusName")
    private String statusName;

    @Column(name = "status_name_id")
    @JsonProperty("statusNameId")
    private Number statusNameId;

    @Column(name = "cloud_id")
    @JsonProperty("cloudId")
    private String cloudId;

    @Column(name = "cht_ticket_id")
    @JsonProperty("chtTicketId")
    private String chtTicketId;

    @Column(name = "source_name")
    @JsonProperty("sourceName")
    private String sourceName;

    @Column(name = "is_calendar_day")
    @JsonProperty("isCalendarDay")
    private boolean isCalendarDay;

    @Column(name = "contact_sla_min")
    @JsonProperty("ContactSlaMin")
    private Long ContactSlaMin;

    @Column(name = "installation_sla_min")
    @JsonProperty("installationSlaMin")
    private Long installationSlaMin;

    @Column(name = "is_contact_sla_exceed")
    @JsonProperty("isContactSlaExceed")
    private boolean isContactSlaExceed;

    @Column(name = "sla_contact_est_dt")
    @JsonProperty("slaContactEstDt")
    private Date slaContactEstDt;

    @Column(name = "sla_installation_est_dt")
    @JsonProperty("slaInstallationEstDt")
    private Date slaInstallationEstDt;

    @Column(name = "delivary_datetime")
    @JsonProperty("delivaryDatetime")
    private Date delivaryDatetime;

    @Column(name = "payment_method")
    @JsonProperty("paymentMethod")
    private String paymentMethod;

    @Column(name = "vendor_id")
    @JsonProperty("vendorId")
    private Long vendorId;

    @Column(name = "vendor_name")
    @JsonProperty("vendorName")
    private String vendorName;

    @Column(name = "vendor_email")
    @JsonProperty("vendorEmail")
    private String vendorEmail;

    @Column(name = "first_contact_dt")
    @JsonProperty("firstContactDt")
    private Date firstContactDt;

    @Column(name = "first_contact_note")
    @JsonProperty("firstContactNote")
    private String firstContactNote;

    @Column(name = "first_contact_by")
    @JsonProperty("firstContactBy")
    private String firstContactBy;

    @Column(name = "scheduled_appointed_dt")
    @JsonProperty("scheduledAppointedDate")
    private Date scheduledAppointedDate;

    @Column(name = "scheduled_dt")
    @JsonProperty("scheduledDt")
    private Date scheduledDt;

    @Column(name = "scheduled_note")
    @JsonProperty("scheduledNote")
    private String scheduledNote;

    @Column(name = "scheduled_by")
    @JsonProperty("scheduledBy")
    private String scheduledBy;

    @Column(name = "sim_activation_dt")
    @JsonProperty("simActivationDt")
    private Date simActivationDt;

    @Column(name = "sim_activation_note")
    @JsonProperty("simActivationNote")
    private String simActivationNote;

    @Column(name = "sim_activation_by")
    @JsonProperty("simActivationBy")
    private String simActivationBy;

    @Column(name = "installation_dt")
    @JsonProperty("installationDt")
    private Date installationDt;

    @Column(name = "installation_note")
    @JsonProperty("installationNote")
    private String installationNote;

    @Column(name = "installation_by")
    @JsonProperty("installationBy")
    private String installationBy;

    @Column(name = "finalization_dt")
    @JsonProperty("finalizationDt")
    private Date finalizationDt;

    @Column(name = "finalization_note")
    @JsonProperty("finalizationNote")
    private String finalizationNote;

    @Column(name = "finalization_by")
    @JsonProperty("finalizationBy")
    private String finalizationBy;

    @Column(name = "onboarded_dt")
    @JsonProperty("onboardedDt")
    private Date onboardedDt;

    @Column(name = "onboarded_note")
    @JsonProperty("onboardedNote")
    private String onboardedNote;

    @Column(name = "onboarded_by")
    @JsonProperty("onboardedBy")
    private String onboardedBy;

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
    private boolean otpVerified;

    @Column(name = "kcp_contact_number")
    @JsonProperty("kcpContactNumber")
    private String kcpContactNumber;

    @Column(name = "kcp_email")
    @JsonProperty("kcpEmail")
    private String kcpEmail;

    @Column(name = "kcp_name")
    @JsonProperty("kcpName")
    private String kcpName;

    @Column(name = "kam_contact_number")
    @JsonProperty("kamContactNumber")
    private String kamContactNumber;

    @Column(name = "kam_email")
    @JsonProperty("kamEmail")
    private String kamEmail;

    @Column(name = "kam_name")
    @JsonProperty("kamName")
    private String kamName;

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

    @Column(name = "gpshop_transaction_id")
    @JsonProperty("gpshopTransactionId")
    private String gpshopTransactionId;

    @Column(name = "gpshop_requisition_dt")
    @JsonProperty("gpshopRequisitionDt")
    private Date gpshopRequisitionDt;

    @Column(name = "gp_shop_delivery_type")
    @JsonProperty("gpShopDeliveryType")
    private String gpShopDeliveryType;

    @Column(name = "gpshop_product_type")
    @JsonProperty("gpshopProductType")
    private String gpshopProductType;

    @Column(name = "gpshop_product_name")
    @JsonProperty("gpshopProductName")
    private String gpshopProductName;

    @Column(name = "gpshop_delivery_charge")
    @JsonProperty("gpshopDeliveryCharge")
    private double gpshopDeliveryCharge;

    @Column(name = "city")
    @JsonProperty("city")
    private String city;

    @Column(name = "district")
    @JsonProperty("district")
    private String district;

    @Column(name = "thana")
    @JsonProperty("thana")
    private String thana;

    @Column(name = "bs_code")
    @JsonProperty("bsCode")
    private String bsCode;

    @Column(name = "company_id")
    @JsonProperty("companyId")
    private Long companyId;

    @Column(name = "company_name")
    @JsonProperty("companyName")
    private String companyName;

    @Column(name = "user_type")
    @JsonProperty("userType")
    private String userType;

    @Column(name = "order_type")
    @JsonProperty("orderType")
    private String orderType;

    @Column(name = "alternative_contact_num")
    @JsonProperty("altContactNum")
    private String altContactNum;

    @Column(name = "vid")
    @JsonProperty("vid")
    private String vid;

}
