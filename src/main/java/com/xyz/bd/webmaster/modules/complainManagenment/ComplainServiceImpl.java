package com.xyz.bd.webmaster.modules.complainManagenment;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.models.common.DTOs.SMS;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.orderStatus.OrderStatusModel;
import com.xyz.bd.webmaster.modules.commonPackages.repository.VendorRepository;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;

import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class ComplainServiceImpl implements ComplainService{

    @Autowired
    ComplainRepository complainRepository;

    @Autowired
    ComplainStatusRepository complainStatusRepository;

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    ProductService productService;

    @Autowired
    EmailSenderService emailSenderService;

    @Autowired
    SendSMSService sendSMSService;

    @Autowired
    ActionLogService actionLogService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TrackerDeviceRepository trackerDeviceRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(ComplainService.class);

    @Override
    public DataTablesOutput<ComplainModel> findAllComplainList(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_complaints, ComplainModel.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_complaints);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_complaints, ComplainModel.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<ComplainModel> resultList = entityManager.createNativeQuery(searchQuery, ComplainModel.class).getResultList();

        DataTablesOutput<ComplainModel> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addNewComplain(HttpServletRequest request, String complainInfo, Long productId) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ComplainModel complain = new Gson().fromJson(complainInfo, new TypeToken<ComplainModel>() {
            }.getType());

            ProductsModel productsModel = productRepository.getReferenceById(productId);

            ComplainModel complainModel = new ComplainModel();
            ActionLogsModel actionLogsModel = new ActionLogsModel();

            complainModel.setStsTicketId(complain.getStsTicketId());
            complainModel.setComplaintId(complain.getStsTicketId());
            complainModel.setComStatusName("New Complaint");
            complainModel.setComStatusId(1);
            complainModel.setProductId(productId);
            complainModel.setDeviceSubCategory(productsModel.getDeviceSubCategory());
            complainModel.setDeviceCategory(productsModel.getDeviceCategory());
            complainModel.setVtsSimNo(complain.getVtsSimNo());
            complainModel.setResponsibleTeamName(complain.getResponsibleTeamName());
            complainModel.setResponsibleTeamId(complain.getResponsibleTeamId());
            complainModel.setUserType(complain.getUserType());
            complainModel.setCustomerContactNumber(complain.getCustomerContactNumber());

            complainModel.setVendorId(productsModel.getVendorId());
            complainModel.setVendorName(productsModel.getVendorName());
            complainModel.setVendorEmail(productsModel.getVendorEmail());
            complainModel.setUserType(complain.getUserType());
            complainModel.setProductType(productsModel.getProductType());

            complainModel.setNewComplaintNote(complain.getNewComplaintNote());
            complainModel.setNewComplaintDt(Helper.getCurrentDate());
            complainModel.setNewComplaintBy(SessionManager.getUserLoginName(request));

            complainModel.setCreatedBy(SessionManager.getUserLoginName(request));
            complainModel.setCreatedAt(Helper.getCurrentDate());


            actionLogsModel.setAction_type_name(Utility.create_concern);
            actionLogsModel.setAction_type_id(4L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(4L);
            actionLogsModel.setForeign_table(Utility.tbl_complaints);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));
            actionLogsModel.setOld_data("");
            actionLogsModel.setNew_data(complainInfo);
            actionLogsModel.setNote("Complain Creation");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);

            complainRepository.save(complainModel);

            Boolean notificationStatus = sendMailAndSms(complain, "new-_complain");

            commonRestResponse.setData(complainModel.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Complaint has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Request has been Failed");
            LOGGER.error(ex.toString());
        } catch (TemplateException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse updateComplainStatus(HttpServletRequest request, String complainStatusData, Long id, String scheduledTime) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ComplainModel updateStatus = new Gson().fromJson(complainStatusData, new TypeToken<ComplainModel>() {
            }.getType());


            ComplainModel complainModelData = complainRepository.getById(id);

            complainModelData.setComStatusName(updateStatus.getComStatusName());
            complainModelData.setComStatusId(updateStatus.getComStatusId());

            switch(updateStatus.getComStatusName()){
                case "First Contact" :
                    //Date scheduledDate = new Date(updateStatus.getScheduledAppointedDt().getTime());
                    complainModelData.setFirstContactDt(Helper.getCurrentDate());
                    complainModelData.setFirstContactBy(SessionManager.getUserLoginName(request));
                    complainModelData.setFirstContactNote(updateStatus.getScheduledNote());
                    //complainModelData.setScheduledAppointedDt(scheduledDate);

                case "Scheduled" :
                    complainModelData.setScheduledDt(Helper.getCurrentDate());
                    complainModelData.setScheduledBy(SessionManager.getUserLoginName(request));
                    complainModelData.setScheduledNote(updateStatus.getScheduledNote());

                    try {
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                        Date parsedDate = dateFormat.parse(scheduledTime);
                        Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
                        complainModelData.setScheduledAppointedDt(timestamp);
                    } catch(Exception e) { //this generic but you can control another types of exception
                        // look the origin of excption
                    }
                    break;
                case "Processing" :
                    complainModelData.setProcessingDt(Helper.getCurrentDate());
                    complainModelData.setProcessingBy(SessionManager.getUserLoginName(request));
                    complainModelData.setProcessingNote(updateStatus.getScheduledNote());
                    break;
                case "Resolved" :
                    complainModelData.setResolvedDt(Helper.getCurrentDate());
                    complainModelData.setResolvedBy(SessionManager.getUserLoginName(request));
                    complainModelData.setResolvedNote(updateStatus.getScheduledNote());
                    break;
                case "Device Replace" :
                    complainModelData.setDeviceReplaceDt(Helper.getCurrentDate());
                    complainModelData.setDeviceReplaceBy(SessionManager.getUserLoginName(request));
                    complainModelData.setDeviceReplaceNote(updateStatus.getScheduledNote());
                    break;
                case "Refund" :
                    complainModelData.setRefundDt(Helper.getCurrentDate());
                    complainModelData.setRefundBy(SessionManager.getUserLoginName(request));
                    complainModelData.setRefundNote(updateStatus.getScheduledNote());
                    break;
                case "Unsolvable" :
                    complainModelData.setUnsolvableDt(Helper.getCurrentDate());
                    complainModelData.setUnsolvableBy(SessionManager.getUserLoginName(request));
                    complainModelData.setUnsolvableNote(updateStatus.getScheduledNote());
                    break;
                case "Cancelled" :
                    complainModelData.setCancelledDt(Helper.getCurrentDate());
                    complainModelData.setCancelledBy(SessionManager.getUserLoginName(request));
                    complainModelData.setCancelledNote(updateStatus.getScheduledNote());
                    break;
                default:
                    break;
            }

            complainModelData.setUpdatedBy(SessionManager.getUserLoginName(request));
            complainModelData.setUpdatedAt(Helper.getCurrentDate());

            ActionLogsModel actionLogsModel = new ActionLogsModel();

            actionLogsModel.setAction_type_name(Utility.update_status_complain);
            actionLogsModel.setAction_type_id(3L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(3L);
            actionLogsModel.setForeign_table(Utility.tbl_complaints);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));

            //Old data need to be modified to json string
            actionLogsModel.setOld_data("");
            actionLogsModel.setNew_data(complainStatusData);
            actionLogsModel.setNote("Concern status update");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);



            complainRepository.save(complainModelData);

            commonRestResponse.setData(complainModelData.getId());
            statusCheck(complainModelData);
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Complaint Status has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException | IOException | TemplateException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    @Override
    public CommonRestResponse getAllComplaintStatus(HttpServletRequest request) {
        CommonRestResponse response = new CommonRestResponse();
        List<ComplainStatusModel> statusList = complainStatusRepository.findAll();
        response.setData(statusList);
        return response;
    }

    @Override
    public CommonRestResponse getNextComplaintStatus(HttpServletRequest request, Long id) {
        CommonRestResponse response = new CommonRestResponse();
        List<ComplainStatusModel> result = new ArrayList<ComplainStatusModel>();
        if(id < 4L){
            Long nextId = id+1L;
            result = complainRepository.findNextStatus(nextId);
            response.setData(result);
        } else if (id > 0 && id >= 4) {
            result = complainRepository.findNextStatusRest(4L);
            response.setData(result);
        }

        return response;
    }

    public boolean statusCheck(ComplainModel complain) throws TemplateException, IOException {
        boolean notificationStatus;
        switch(complain.getComStatusName())
        {
            case "First Contact" :
            case "Scheduled" :
            case "Processing" :
            case "Resolved" :
            case "Device Replace" :
            case "Unsolvable" :
            case "Cancelled" :
                notificationStatus = sendMailAndSms(complain, "status_update");
                if(notificationStatus){
                    return true;
                } else return false;
            case "Refund" :
                if(inventoryManage(-1, complain.getProductId())){
                    notificationStatus = sendMailAndSms(complain, "status_update");
                    if(notificationStatus){
                        return true;
                    } else return false;
                } else return false;
            default:
                return false;
        }
    }

    public boolean sendMailAndSms(ComplainModel orderData, String template) throws IOException, TemplateException{
        boolean status = false;
        try{
            String toEmail = orderData.getVendorEmail();
            //String body = "Order data has been updated for order ID: " + orderData.getId() + ". " + "Order Status : "+ orderData.getStatusName();
            String subject = "Concern Center Notification";
            String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com,kalyanmoy@grameenphone.com";

            Configuration cfg = new Configuration();
            Template freemarkerTemplate;
            String body = "";
            String body_customer = "";
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            if(template.equals("new_complain")){
                freemarkerTemplate = cfg.getTemplate("complaint/new_complaints.ftl");
                body = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerTemplate, orderData);
            } else if (template.equals("status_update")){
                freemarkerTemplate = cfg.getTemplate("complaint/update_status.ftl");
                body = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerTemplate, orderData);
            }
            emailSenderService.sendEmail(toEmail, body, subject, cc);

            String customerMail = orderData.getCustomerEmail();
            // String body_kcp = "Order Onboarded Successfully. " + "Username : "+ "88"+orderData.getCustomerContactNumber();
            String subject_kcp = "Concern Center Notification";
            String cc_kcp = "ifaz@grameenphone.com, shafayet.hossen@grameenphone.com";
            Template freemarkerTemplateCustomer = cfg.getTemplate("complaint/new_complaints.ftl");
            body_customer = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerTemplateCustomer, orderData);
            emailSenderService.sendEmail(customerMail, body_customer, subject_kcp, cc_kcp);


            SMS sms = new SMS();
            sms.setPhone(orderData.getCustomerContactNumber().substring(2));
            sms.setText(body);
            sendSMSService.sendSMS(sms);
            return true;
        } catch (IOException | TemplateException ex){
            return true;
        }
    }

    public boolean inventoryManage(Integer quantity, Long productId){
        try {
            ProductsModel productsModel = productRepository.getById(productId);
            Integer newQuantity = productsModel.getQuantity() - quantity;
            productsModel.setQuantity(newQuantity);
            productRepository.save(productsModel);
            return true;
        } catch(Exception ex){
            return false;
        }
    }
}
