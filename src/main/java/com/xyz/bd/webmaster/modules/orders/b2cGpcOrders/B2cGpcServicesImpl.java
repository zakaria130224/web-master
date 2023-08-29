package com.xyz.bd.webmaster.modules.orders.b2cGpcOrders;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.models.common.DTOs.SMS;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
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
            actionLogsModel.setF_id(1L);
            actionLogsModel.setF_table(Utility.tbl_order);
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
    public CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            OrderModelEntity updateStatus = new Gson().fromJson(orderStatusData, new TypeToken<OrderModelEntity>() {
            }.getType());

            OrderModelEntity orderModelEntity = orderRepository.getById(id);

            orderModelEntity.setStatusName(updateStatus.getStatusName());
            orderModelEntity.setStatusNameId(updateStatus.getStatusNameId());

            orderModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setUpdatedAt(Helper.getCurrentDate());


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
        if(order.getStatusName().equals("New Order")){
            if(inventoryManage(1, order.getProductId())){
                boolean notificationStatus = sendMailAndSms(data);
                if(notificationStatus){
                    return true;
                } else return false;
            } else return false;

        } else if (order.getStatusName().equals("Scheduled")) {
            if(inventoryManage(1, order.getProductId())){
                boolean notificationStatus = sendMailAndSms(data);
                if(notificationStatus){
                    return true;
                } else return false;
            } else return false;
        } else if (order.getStatusName().equals("Sim Activation")) {
            boolean notificationStatus = sendMailAndSms(data);
            if(notificationStatus){
                return true;
            } else return false;
        } else if (order.getStatusName().equals("Installation")) {
            boolean notificationStatus = sendMailAndSms(data);
            if(notificationStatus){
                return true;
            } else return false;
        } else if (order.getStatusName().equals("Onboarded")) {
            boolean notificationStatus = sendMailAndSms(data);
            if(notificationStatus){
                return true;
            } else return false;
        } else if (order.getStatusName().equals("Cancelled")) {
            if(inventoryManage(-1, order.getProductId())){
                boolean notificationStatus = sendMailAndSms(data);
                if(notificationStatus){
                    return true;
                } else return false;
            } else return false;
        } else if (order.getStatusName().equals("First Contact")) {
            boolean notificationStatus = sendMailAndSms(data);
            if(notificationStatus){
                return true;
            } else return false;
        } else if (order.getStatusName().equals("Pack Activation")) {
            boolean notificationStatus = sendMailAndSms(data);
            if(notificationStatus){
                return true;
            } else return false;
        }
        return false;
    }

    public boolean sendMailAndSms(OrderModelEntity orderData) throws IOException, TemplateException{
        boolean status = false;
        try{
            String toEmail = orderData.getVendorEmail();
            //String body = "Order data has been updated for order ID: " + orderData.getId() + ". " + "Order Status : "+ orderData.getStatusName();
            String subject = "VTS Order Data Update Notification";
            String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com";

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
