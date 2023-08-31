package com.xyz.bd.webmaster.modules.orders.b2cGpcOrders;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.models.common.DTOs.SMS;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;
import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderRepository;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.services.UserManagement.AppUserService;
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
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Service
public class B2cGpcServicesImpl implements B2cGpcServices{

    @Autowired
    OrderRepository orderRepository;

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
    private AppUserService appUserService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    TrackerDeviceRepository trackerDeviceRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(B2cGpcServices.class);

    @Override
    public DataTablesOutput<OrderModelEntity> findAllB2cOrdersList(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_order, OrderModelEntity.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_order);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_order, OrderModelEntity.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<OrderModelEntity> resultList = entityManager.createNativeQuery(searchQuery, OrderModelEntity.class).getResultList();

        DataTablesOutput<OrderModelEntity> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    @Override
    public CommonRestResponse addNewOrder(HttpServletRequest request, String orderInfo) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            OrderModelEntity order = new Gson().fromJson(orderInfo, new TypeToken<OrderModelEntity>() {
            }.getType());

            OrderModelEntity orderModelEntity = new OrderModelEntity();
            ActionLogsModel actionLogsModel = new ActionLogsModel();
            Integer random = new Random().nextInt(90000) + 10000;
            ProductsModel productsModel = productService.getProductDetail(order.getProductId());
            String orderNameString = "";

            if(order.getOrderType().equals("GPC")){
                orderNameString = "GPC0B2C";
            } else if (order.getOrderType().equals("GPS")) {
                orderNameString = "GPC0B2C";
            } else if (order.getOrderType().equals("SIM")) {
                orderNameString = "SIM0B2B";
            } else if (order.getOrderType().equals("DVB")) {
                orderNameString = "DVB0B2B";
            }

            if(productsModel.getHasSim().equals(true)){
                orderModelEntity.setOrderType("gpc_sim");
            } else{
                orderModelEntity.setOrderType("gpc_simless");
            }

            orderModelEntity.setCustomerName(order.getCustomerName());
            orderModelEntity.setAddress(order.getAddress());
            orderModelEntity.setProductId(order.getProductId());
            orderModelEntity.setProductType(productsModel.getProductType());
            orderModelEntity.setProductName(productsModel.getProductName());
            orderModelEntity.setPackName(productsModel.getPackageName());
            orderModelEntity.setDeviceCategory(productsModel.getDeviceCategory());
            orderModelEntity.setDeviceSubCategory(productsModel.getDeviceSubCategory());
            orderModelEntity.setCustomerContactNumber(order.getCustomerContactNumber());
            orderModelEntity.setVtsSimNo(order.getVtsSimNo());
            orderModelEntity.setStatusName("New Order");
            orderModelEntity.setStatusNameId(1);
            orderModelEntity.setUnitPrice(productsModel.getTotalCharge());

            orderModelEntity.setVendorId(order.getVendorId());
            orderModelEntity.setVendorEmail(order.getVendorEmail());
            orderModelEntity.setVendorName(order.getVendorName());
            orderModelEntity.setCloudId(orderNameString+Integer.toString(random));
            orderModelEntity.setSimKit("898801"+ Integer.toString(random) +"38163F");
            orderModelEntity.setRatePlan(productsModel.getPackageName());


            orderModelEntity.setCreatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setCreatedAt(Helper.getCurrentDate());

            AppUser newMdUserModel = new AppUser();
            newMdUserModel.setName(order.getCustomerContactNumber());
            newMdUserModel.setPhone(order.getCustomerContactNumber());
            newMdUserModel.setCreatedBy(SessionManager.getUserLoginName(request));
            newMdUserModel.setCreatedAt(Helper.getCurrentDate());

            //appUserService.saveNewUserNew(newMdUserModel);


            actionLogsModel.setAction_type_name(Utility.create_order_gps);
            actionLogsModel.setAction_type_id(1L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(1L);
            actionLogsModel.setForeign_table(Utility.tbl_order);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));
            actionLogsModel.setOld_data("");
            actionLogsModel.setNew_data(orderInfo);
            actionLogsModel.setMsisdn(order.getCustomerContactNumber());
            actionLogsModel.setNote("Order Creation b2C GPC");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);

            orderRepository.save(orderModelEntity);
            if(orderModelEntity.getId() != null){
                statusCheck(orderModelEntity);
            }
            commonRestResponse.setData(orderModelEntity.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Order has been Added Successfully");
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
    public CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id, String dateTime) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            OrderModelEntity updateStatus = new Gson().fromJson(orderStatusData, new TypeToken<OrderModelEntity>() {
            }.getType());


            OrderModelEntity orderModelEntity = orderRepository.getById(id);
            TrackerDeviceModelEntity trackerDeviceModelEntity = new TrackerDeviceModelEntity();

            orderModelEntity.setStatusName(updateStatus.getStatusName());
            orderModelEntity.setStatusNameId(updateStatus.getStatusNameId());

            switch(updateStatus.getStatusName()){
                case "First Contact" :
                    //Date scheduledDate = new Date(updateStatus.getScheduledAppointedDt().getTime());
                    orderModelEntity.setFirstContactDt(Helper.getCurrentDate());
                    orderModelEntity.setFirstContactBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setFirstContactNote(updateStatus.getScheduledNote());
                    //orderModelEntity.setScheduledAppointedDt(scheduledDate);
                    try {
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                        Date parsedDate = dateFormat.parse(dateTime);
                        Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
                        orderModelEntity.setScheduledAppointedDt(timestamp);
                    } catch(Exception e) { //this generic but you can control another types of exception
                        // look the origin of excption
                    }
                    break;

                case "Scheduled" :
                    orderModelEntity.setScheduledDt(Helper.getCurrentDate());
                    orderModelEntity.setScheduledBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setScheduledNote(updateStatus.getScheduledNote());
                    break;
                case "Sim Activation" :
                    orderModelEntity.setSimActivationDt(Helper.getCurrentDate());
                    orderModelEntity.setSimActivationBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setSimActivationNote(updateStatus.getScheduledNote());
                    break;
                case "Installation" :
                    orderModelEntity.setInstallationDt(Helper.getCurrentDate());
                    orderModelEntity.setInstallationBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setInstallationNote(updateStatus.getScheduledNote());
                    orderModelEntity.setImei(updateStatus.getImei());
                    orderModelEntity.setDeviceName(updateStatus.getDeviceName());



                    break;
                case "Onboarded" :
                    orderModelEntity.setOnboardedDt(Helper.getCurrentDate());
                    orderModelEntity.setCancelledBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setCancelledNote(updateStatus.getScheduledNote());
                    break;
                case "Cancelled" :
                    orderModelEntity.setCancelledDt(Helper.getCurrentDate());
                    orderModelEntity.setOnboardedBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setOnboardedNote(updateStatus.getScheduledNote());
                    break;
                default:
                    break;
            }

            orderModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setUpdatedAt(Helper.getCurrentDate());

            ActionLogsModel actionLogsModel = new ActionLogsModel();

            actionLogsModel.setAction_type_name(Utility.create_order_gps);
            actionLogsModel.setAction_type_id(2L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(2L);
            actionLogsModel.setForeign_table(Utility.tbl_order);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));

            //Old data need to be modified to json string
            actionLogsModel.setOld_data("");
            actionLogsModel.setNew_data(orderStatusData);
            actionLogsModel.setNote("Order status update - B2C GPC");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);



            orderRepository.save(orderModelEntity);

            commonRestResponse.setData(orderModelEntity.getId());
            statusCheck(orderModelEntity);
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Order Status has been Added Successfully");
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

    public boolean statusCheck(OrderModelEntity order) throws TemplateException, IOException {
        OrderModelEntity data = order;
        boolean notificationStatus;
        switch(order.getStatusName())
        {
            case "New Order" :
                if(inventoryManage(1, order.getProductId())){
                    notificationStatus = sendMailAndSms(data);
                    if(notificationStatus){
                        return true;
                    } else return false;
                } else return false;
            case "Scheduled" :
            case "Sim Activation" :
            case "Onboarded" :
            case "First Contact" :
            case "Pack Activation" :
                notificationStatus = sendMailAndSms(data);
                if(notificationStatus){
                    return true;
                } else return false;
            case "Cancelled" :
                if(inventoryManage(-1, order.getProductId())){
                    notificationStatus = sendMailAndSms(data);
                    if(notificationStatus){
                        return true;
                    } else return false;
                } else return false;

            case "Installation" :
                if(order.getOrderType().equals("gpc_sim")){
                    TrackerDeviceModelEntity deviceInfo = new TrackerDeviceModelEntity();
                    //deviceInfo.setUserId(existingUser.getId()); // Set the user ID
                    deviceInfo.setImei(order.getImei());
                    //deviceInfo.setTrackerDeviceId(resultCode);
                    //deviceInfo.setUserEmail(resultDesc);
                    deviceInfo.setCustomerName(order.getKcpName());
                    deviceInfo.setOrderId(order.getId());
                    deviceInfo.setCompanyId(order.getCompanyId());
                    deviceInfo.setCustomerName(order.getKcpName());
                    deviceInfo.setCellPhone(order.getKcpContactNumber());
                    deviceInfo.setUserEmail(order.getKcpEmail());
                    deviceInfo.setVtsSim(order.getVtsSimNo());
                    deviceInfo.setDeviceCategory(order.getDeviceCategory());
                    deviceInfo.setDeviceSubCategory(order.getDeviceSubCategory());
                    deviceInfo.setDataPackName(order.getPackName());
                    deviceInfo.setCompanyName(order.getCompanyName());
                    deviceInfo.setInstallationDate(Helper.getCurrentDate());
                    trackerDeviceRepository.save(deviceInfo);
                }
                notificationStatus = sendMailAndSms(data);
                if(notificationStatus){
                    return true;
                } else return false;

            default:
                return false;
        }
    }

    public boolean sendMailAndSms(OrderModelEntity orderData) throws IOException, TemplateException{
        boolean status = false;
        try{
            String toEmail = orderData.getVendorEmail();
            //String body = "Order data has been updated for order ID: " + orderData.getId() + ". " + "Order Status : "+ orderData.getStatusName();
            String subject = "VTS Order Data Update Notification";
            String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com,kalyanmoy@grameenphone.com";

            Configuration cfg = new Configuration();
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            Template freemarkerTemplate = cfg.getTemplate("email-template.ftl");
            String body = FreeMarkerTemplateUtils.processTemplateIntoString(freemarkerTemplate, orderData);

            emailSenderService.sendEmail(toEmail, body, subject, cc);

            String customerMail = "jobaidur@grameenphone.com";
            // String body_kcp = "Order Onboarded Successfully. " + "Username : "+ "88"+orderData.getCustomerContactNumber();
            String body_kcp = body;
            String subject_kcp = "VTS Order Update Notification";
            String cc_kcp = "ifaz@grameenphone.com";
            emailSenderService.sendEmail(customerMail, body_kcp, subject_kcp, cc_kcp);

            SMS sms = new SMS();
            sms.setPhone("88"+orderData.getCustomerContactNumber());
            sms.setText(body);
            sendSMSService.sendSMS(sms);
            return true;
        } catch (IOException | TemplateException ex){
            return false;
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
