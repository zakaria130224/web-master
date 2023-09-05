package com.xyz.bd.webmaster.modules.orders.b2cGpShop;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyRepository;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceService;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserService;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;
import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderRepository;
import com.xyz.bd.webmaster.modules.orders.b2bSimBasedOrders.OrderServiceImpl;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServicesImpl;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import freemarker.template.TemplateException;
import org.apache.poi.ss.usermodel.*;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Service
public class B2cGpShopServicesImpl implements B2cGpShopServices{

    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private CompanyRepository companyRepository;

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
    private UserService userService;

    @Autowired
    TrackerDeviceService trackerDeviceService;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    B2cGpcServicesImpl b2cGpcServices;

    @Autowired
    ActionLogService actionLogService;

    @Autowired
    OrderServiceImpl orderServiceimpl;



    @Value("${api.addDeviceUrl}")
    private String addDeviceUrl;

    @Value("${api.webAuthorizationHeader}")
    private String webAuthorizationHeader;

    @Value("${file.upload.dir}")
    private String uploadDirectoryPath;

    private static final Logger LOGGER = LoggerFactory.getLogger(B2cGpcServices.class);



    @Override
    public DataTablesOutput<OrderModelEntity> findAllB2cGpShopOrderList(HttpServletRequest request, String customQuery, DataTablesInput input) {
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
    public void saveData(HttpServletRequest request, MultipartFile excelFile) {
        System.out.println("User name:" + SessionManager.getUserLoginName(request));
        try {
            //save excel

            String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());


            //new excel
            String filename = timestamp + "_" + excelFile.getOriginalFilename();

            // Create the path for the file
            Path filePath = Paths.get(uploadDirectoryPath, filename);

            // Create the directory if it doesn't exist
            Files.createDirectories(filePath.getParent());

            // Save the uploaded Excel file to the specified path
            Files.copy(excelFile.getInputStream(), filePath);
            //new


            byte[] excelBytes = excelFile.getBytes();
            InputStream inputStream = new ByteArrayInputStream(excelBytes);

            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            DataFormatter dataFormatter = new DataFormatter();

            // Skip the first row (header row) by starting the loop from index 1
            for (int rowIndex = 1; rowIndex < sheet.getPhysicalNumberOfRows(); rowIndex++) {
                System.out.println("test1");
                Row row = sheet.getRow(rowIndex);
                String quantityCellValues = dataFormatter.formatCellValue(row.getCell(11));
                System.out.println(quantityCellValues);
                System.out.println("tests2");
                System.out.println(dataFormatter.formatCellValue(row.getCell(4)));
                int productQuantity = 0;
                productQuantity = Integer.parseInt(quantityCellValues);
                System.out.println(productQuantity);
                for (int i = 0; i < productQuantity; i++) {
                    String transaction = dataFormatter.formatCellValue(row.getCell(0));
                    String reqDate = dataFormatter.formatCellValue(row.getCell(1));
                    String reqTime = dataFormatter.formatCellValue(row.getCell(2));
                    String customerName = dataFormatter.formatCellValue(row.getCell(3));
                    String cusMsisdn = dataFormatter.formatCellValue(row.getCell(4));
                    String cusAddress = dataFormatter.formatCellValue(row.getCell(5));
                    String cusCity = dataFormatter.formatCellValue(row.getCell(6));
                    String cusArea = dataFormatter.formatCellValue(row.getCell(7));
                    String cusThana = dataFormatter.formatCellValue(row.getCell(8));
                    String productType = dataFormatter.formatCellValue(row.getCell(9));
                    String productName = dataFormatter.formatCellValue(row.getCell(10));
                //    String productQty = dataFormatter.formatCellValue(row.getCell(11));
                    String mrp = dataFormatter.formatCellValue(row.getCell(12));
                    String deliveryType = dataFormatter.formatCellValue(row.getCell(13));
                    String deliveryCharge = dataFormatter.formatCellValue(row.getCell(14));

                    //  String audNum = dataFormatter.formatCellValue(row.getCell(15));

                    VendorModelEntity vendor = productService.findVendorByProductName(productName);

                    if (vendor != null) {
                        System.out.println("Vendor Name: " + vendor.getName());
                        System.out.println("Vendor Email: " + vendor.getEmail());

                        // Perform any actions with the vendor details here
                    }


                    ProductsModel products = productService.getAllProductDataByProductName(productName);

                    Boolean sim_info = products.getHasSim();

                    OrderModelEntity orderModelEntity = new OrderModelEntity();
                    orderModelEntity.setGpshopTransactionId(transaction);
                    orderModelEntity.setCustomerName(customerName);
                    orderModelEntity.setCustomerContactNumber("880"+cusMsisdn);
                    orderModelEntity.setAddress(cusAddress);
                    orderModelEntity.setCity(cusCity);
                    orderModelEntity.setDistrict(cusArea);
                    orderModelEntity.setThana(cusThana);
                    orderModelEntity.setProductType(productType);
                    orderModelEntity.setGpshopProductType(productType);
                    orderModelEntity.setProductName(productName);
                    orderModelEntity.setGpshopProductName(productName);
                    orderModelEntity.setProductId(products.getId());
                    orderModelEntity.setUnitPrice(Double.valueOf(mrp));
                    orderModelEntity.setGpShopDeliveryType(deliveryType);
                    orderModelEntity.setGpshopDeliveryCharge(Double.valueOf(deliveryCharge));
                    orderModelEntity.setStatusName("New Order");
                    orderModelEntity.setStatusNameId(1);
                    orderModelEntity.setVendorName(vendor.getName());
                    orderModelEntity.setVendorEmail(vendor.getEmail());
                    orderModelEntity.setVendorId(vendor.getId());
                    if (sim_info == true) {
                        orderModelEntity.setOrderType("gpshop_sim");
                    } else {
                        orderModelEntity.setOrderType("gpshop_simless");
                    }
                    String dateTimes = reqDate+" "+ reqTime;
                    try {
                        // Parse the input date string using the input format
                        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MMM-yy h:mm:ss a");
                        Date parsedDate = inputFormat.parse(dateTimes);

                        // Create a new format for the desired output timestamp
                        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        // Format the date into the desired timestamp format
                        String formattedTimestampStr = outputFormat.format(parsedDate);

                        // Parse the formatted timestamp string back to a Timestamp object
                        SimpleDateFormat timestampFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        Date formattedDate = timestampFormat.parse(formattedTimestampStr);
                        Timestamp timestamps = new Timestamp(formattedDate.getTime());

                        System.out.println("Formatted Timestamp: " + formattedTimestampStr);
                        System.out.println("Converted Timestamp: " + timestamps);
                        orderModelEntity.setGpshopRequisitionDt(timestamps);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                    ActionLogsModel actionLogsModel = new ActionLogsModel();
                    actionLogsModel.setAction_type_name(Utility.create_order_gpshop);
                    actionLogsModel.setAction_type_id(1L);
                    actionLogsModel.setEvent_date(Helper.getCurrentDate());
                    actionLogsModel.setForeign_id(1L);
                    actionLogsModel.setForeign_table(Utility.tbl_order);
                    actionLogsModel.setUser_id(SessionManager.getUserID(request));
                    actionLogsModel.setOld_data("");
                    Gson gson = new Gson();
                    String jsonData = gson.toJson(orderModelEntity);
                    actionLogsModel.setNew_data(jsonData);
                    actionLogsModel.setMsisdn(orderModelEntity.getCustomerContactNumber());
                    actionLogsModel.setNote("Order Creation b2C Gpshop");
                    actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
                    actionLogsModel.setCreatedAt(Helper.getCurrentDate());

                    actionLogService.SaveLogsData(actionLogsModel);
                    String customer_msisdn = "880"+cusMsisdn;
                    System.out.println(customer_msisdn);
                    UserModelEntity existingUser = userService.findByUserName(customer_msisdn);
                    System.out.println(existingUser);

                    if (existingUser == null) {
                        // Create a new user entry in tbl_user
                        UserModelEntity newUser = new UserModelEntity();
                            newUser.setUserName(customer_msisdn);
                            newUser.setFullName(customerName);
                            newUser.setMobileNumber(customer_msisdn);
                            newUser.setIsActive(1);
                            UserModelEntity savedUser =  userService.save(newUser);
                            Long userId = savedUser.getId();
                            orderModelEntity.setUserId(userId);
                    }

                    else{
                        orderModelEntity.setUserId(existingUser.getId());
                    }


                    orderRepository.save(orderModelEntity);
                    if (orderModelEntity.getId() != null) {
                        b2cGpcServices.statusCheck(orderModelEntity);
                    }
                }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle exceptions
        }
    }

    @Override
    public CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id, String dateTime) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            // System.out.println("orderStatusData: " + orderStatusData);
            OrderModelEntity updateStatus = new Gson().fromJson(orderStatusData, new TypeToken<OrderModelEntity>() {
            }.getType());
            OrderModelEntity orderModelEntity = orderRepository.getById(id);
            String status_name = updateStatus.getStatusName();



            System.out.println("orderStatusData: " + status_name);
            if ("Installation".equals(status_name)){
                System.out.println("tests success");
                UserModelEntity existingUser = userService.findByUserName(orderModelEntity.getCustomerContactNumber());

                if (existingUser == null) {
                    // Create a new user entry in tbl_user
                    UserModelEntity newUser = new UserModelEntity();
                    newUser.setUserName(orderModelEntity.getCustomerContactNumber());
                    newUser.setFullName(orderModelEntity.getCustomerName());
                    newUser.setMobileNumber(orderModelEntity.getCustomerContactNumber());
                    newUser.setIsActive(1);
                    userService.save(newUser);
                }
                String orderTypeName = orderModelEntity.getOrderType();
                System.out.println(orderTypeName);
                if("gpshop_sim".equals(orderTypeName)){
                    System.out.println("entered");
                String existingImei = trackerDeviceService.checkImeiExists(updateStatus.getImei());
                System.out.println(existingImei);
                System.out.println("-------"+updateStatus.getImei());
                if("false".equals(existingImei)) {

                    long resultCode = 0;
                    String resultDesc = "";
                    try {
                        URL url = new URL(addDeviceUrl);
                        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                        connection.setRequestMethod("POST");
                        connection.setRequestProperty("Authorization", webAuthorizationHeader);
                        connection.setRequestProperty("channel", "WEB");
                        connection.setRequestProperty("Content-Type", "application/json");
                        connection.setDoOutput(true);

                        String payload = "{\n" +
                                "    \"imei\": \"" + updateStatus.getImei() + "\",\n" +
                                "    \"name\": \"Test device\",\n" +
                                "    \"speedLimit\": 20.6\n" +
                                "}";

                        try (DataOutputStream wr = new DataOutputStream(connection.getOutputStream())) {
                            wr.writeBytes(payload);
                            wr.flush();
                        }

                        int responseCode = connection.getResponseCode();
                        System.out.println("POST Response Code: " + responseCode);

                        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        String inputLine;
                        StringBuilder response = new StringBuilder();

                        while ((inputLine = in.readLine()) != null) {
                            response.append(inputLine);
                        }
                        in.close();

                        System.out.println("POST Response: " + response.toString());

                        // Parse the API response
                        JSONObject jsonResponse = new JSONObject(response.toString());
                        JSONObject responseHeader = jsonResponse.getJSONObject("data");
                        resultCode = responseHeader.getLong("id");
                        //  resultDesc  = responseHeader.getString("resultDesc");

                        // Use the resultCode as needed
                        System.out.println("Result Code: " + resultCode);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
//                    String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
                    OrderModelEntity orders = orderRepository.getOrderById(id);

                    //end api call
                    TrackerDeviceModelEntity deviceInfo = new TrackerDeviceModelEntity();
                    deviceInfo.setUserId(existingUser.getId()); // Set the user ID
                    deviceInfo.setImei(updateStatus.getImei());
                    deviceInfo.setTrackerDeviceId(resultCode);
                    deviceInfo.setUserEmail(orderModelEntity.getCustomerEmail());
                    deviceInfo.setCustomerName(orderModelEntity.getCustomerName());
                    deviceInfo.setOrderId(id);
                    deviceInfo.setCustomerName(orderModelEntity.getCustomerName());
                    deviceInfo.setCellPhone(orderModelEntity.getCustomerContactNumber());
                    deviceInfo.setUserEmail(orderModelEntity.getCustomerEmail());
                    deviceInfo.setVtsSim(orderModelEntity.getVtsSimNo());
                    deviceInfo.setDeviceCategory(orderModelEntity.getDeviceCategory());
                    deviceInfo.setDeviceSubCategory(orderModelEntity.getDeviceSubCategory());
                    deviceInfo.setDataPackName(orderModelEntity.getPackName());
                    deviceInfo.setInstallationDate(Helper.getCurrentDate());
                    deviceInfo.setDeviceName(updateStatus.getDeviceName());

                    // Set other device info fields as needed
                    trackerDeviceService.saveDeviceInfo(deviceInfo);
                }

                    orderModelEntity.setUserId(existingUser.getId());
                    orderModelEntity.setInstallationNote(updateStatus.getInstallationNote());
                    orderModelEntity.setInstallationDt(Helper.getCurrentDate());
                    orderModelEntity.setInstallationBy(SessionManager.getUserLoginName(request));
                    orderModelEntity.setImei(updateStatus.getImei());
                    orderModelEntity.setDeviceName(updateStatus.getDeviceName());



                }

            }
            else if ("Scheduled".equals(status_name)){
                orderModelEntity.setScheduledNote(updateStatus.getScheduledNote());
                orderModelEntity.setScheduledDt(Helper.getCurrentDate());
                orderModelEntity.setScheduledBy(SessionManager.getUserLoginName(request));
            }
            else if ("Onboarded".equals(status_name)){
                orderModelEntity.setOnboardedNote(updateStatus.getOnboardedNote());
                orderModelEntity.setOnboardedDt(Helper.getCurrentDate());
                orderModelEntity.setOnboardedBy(SessionManager.getUserLoginName(request));
            }

            else if ("Cancelled".equals(status_name)){
                orderModelEntity.setCancelledNote(updateStatus.getCancelledNote());
                orderModelEntity.setCancelledDt(Helper.getCurrentDate());
                orderModelEntity.setCancelledBy(SessionManager.getUserLoginName(request));
            }
            else if ("Finalization".equals(status_name)){
                orderModelEntity.setFinalizationNote(updateStatus.getFinalizationNote());
                orderModelEntity.setFinalizationDt(Helper.getCurrentDate());
                orderModelEntity.setFinalizationBy(SessionManager.getUserLoginName(request));
            }
            else if ("First Contact".equals(status_name)){
//            try{
                System.out.println("------------------");
                System.out.println("orderStatusData: " + status_name);
                System.out.println("orderStatusData: " + orderStatusData);

                try {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                    Date parsedDate = dateFormat.parse(dateTime);
                    Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
                    orderModelEntity.setScheduledAppointedDt(timestamp);
                    orderModelEntity.setServiceArea(updateStatus.getServiceArea());
                    orderModelEntity.setServiceSla(updateStatus.getServiceSla());
                    orderModelEntity.setFirstContactDt(Helper.getCurrentDate());
                    orderModelEntity.setFirstContactNote(updateStatus.getFirstContactNote());
                    orderModelEntity.setFirstContactBy(SessionManager.getUserLoginName(request));

                    SimpleDateFormat dateFormats = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                    // Get the current date and time
                    Date currentDate = new Date();

                    // Format the current date and time into the desired output format
                    String formattedDatess = dateFormats.format(currentDate);

                    String firstCall = formattedDatess;
                    String createDate = String.valueOf(orderModelEntity.getCreatedAt());
                    System.out.println(firstCall);
                    System.out.println(createDate);

                    long hoursDifference = orderServiceimpl.calculateTimeDifference(createDate, firstCall);
                    orderModelEntity.setContactSlaMin(hoursDifference);

                    System.out.println("Time Difference (hours): " + hoursDifference);
                    orderRepository.save(orderModelEntity);
                } catch(Exception e) { //this generic but you can control another types of exception
                    // look the origin of excption
                }


            }


            else if ("Sim Activation".equals(status_name)){
                orderModelEntity.setSimActivationNote(updateStatus.getSimActivationNote());
                orderModelEntity.setSimActivationDt(Helper.getCurrentDate());
                orderModelEntity.setSimActivationBy(SessionManager.getUserLoginName(request));
            }

//            else if ("Cancelled".equals(status_name)){
//                orderModelEntity.setSimActivationNote(updateStatus.getSimActivationNote());
//                orderModelEntity.setCancelledDt(Helper.getCurrentDate());
//                orderModelEntity.setCancelledBy(SessionManager.getUserLoginName(request));
//            }



            orderModelEntity.setStatusName(updateStatus.getStatusName());
            orderModelEntity.setStatusNameId(updateStatus.getStatusNameId());


            orderModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setUpdatedAt(Helper.getCurrentDate());

            ActionLogsModel actionLogsModel = new ActionLogsModel();
            actionLogsModel.setAction_type_name(Utility.update_order_gpshop);
            actionLogsModel.setAction_type_id(1L);
            actionLogsModel.setEvent_date(Helper.getCurrentDate());
            actionLogsModel.setForeign_id(1L);
            actionLogsModel.setForeign_table(Utility.tbl_order);
            actionLogsModel.setUser_id(SessionManager.getUserID(request));
            actionLogsModel.setOld_data("");
            Gson gson = new Gson();
            String jsonData = gson.toJson(updateStatus);
            actionLogsModel.setNew_data(jsonData);
            actionLogsModel.setMsisdn(orderModelEntity.getCustomerContactNumber());
            actionLogsModel.setNote("Update Order b2C Gp Shop");
            actionLogsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            actionLogsModel.setCreatedAt(Helper.getCurrentDate());

            actionLogService.SaveLogsData(actionLogsModel);


            orderRepository.save(orderModelEntity);

            commonRestResponse.setData(orderModelEntity.getId());
            b2cGpcServices.statusCheck(orderModelEntity);
          //  sendEmailAndSms(orderModelEntity);
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

}
