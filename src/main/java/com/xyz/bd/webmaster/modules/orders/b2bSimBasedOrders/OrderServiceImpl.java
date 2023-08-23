package com.xyz.bd.webmaster.modules.orders.b2bSimBasedOrders;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.common.DTOs.SMS;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyRepository;
import com.xyz.bd.webmaster.modules.commonPackages.products.ProductService;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceService;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserService;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderRepository;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import org.apache.poi.ss.usermodel.*;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService{

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

    @Value("${api.addDeviceUrl}")
    private String addDeviceUrl;

    @Value("${api.webAuthorizationHeader}")
    private String webAuthorizationHeader;

    private static final Logger LOGGER = LoggerFactory.getLogger(B2cGpcServices.class);

    @Override
    public List<OrderModelEntity> getAllOrder() {
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        return orderRepository.findAll(sort);
    }

    @Override
    @Transactional
    public void saveData(String chtticket, MultipartFile excelFile) {
        try {
            //save excel
            String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());

            // Define the upload directory
            String uploadDirectory = "./upload";

            // Generate the filename using the timestamp and original filename
            String filename = timestamp + "_" + excelFile.getOriginalFilename();

            // Create the path for the file
            Path filePath = Paths.get(uploadDirectory, filename);

            // Save the uploaded Excel file to the specified path
            Files.copy(excelFile.getInputStream(), filePath);
            //save excel

            byte[] excelBytes = excelFile.getBytes();
            InputStream inputStream = new ByteArrayInputStream(excelBytes);

            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            DataFormatter dataFormatter = new DataFormatter();

            // Skip the first row (header row) by starting the loop from index 1
            for (int rowIndex = 1; rowIndex < sheet.getPhysicalNumberOfRows(); rowIndex++) {
                Row row = sheet.getRow(rowIndex);
                String bsCode = dataFormatter.formatCellValue(row.getCell(0));
                String companyName = dataFormatter.formatCellValue(row.getCell(1));
                String vtsSim = dataFormatter.formatCellValue(row.getCell(2));
                String simKit = dataFormatter.formatCellValue(row.getCell(3));
                String packName = dataFormatter.formatCellValue(row.getCell(4));
                String basePrice = dataFormatter.formatCellValue(row.getCell(5));
                String vid = dataFormatter.formatCellValue(row.getCell(6));
                String ratePlan = dataFormatter.formatCellValue(row.getCell(7));
                String mrp = dataFormatter.formatCellValue(row.getCell(8));
                String altContact = dataFormatter.formatCellValue(row.getCell(9));
                String kcpName = dataFormatter.formatCellValue(row.getCell(10));
                String kcpContact = dataFormatter.formatCellValue(row.getCell(11));
                String kcpEmail = dataFormatter.formatCellValue(row.getCell(12));
                String supportPartner = dataFormatter.formatCellValue(row.getCell(13));
                String productType = dataFormatter.formatCellValue(row.getCell(14));
                String audNum = dataFormatter.formatCellValue(row.getCell(15));

                System.out.println(bsCode);
                System.out.println(companyName);

                CompanyModelEntity existingCompany = companyRepository.findByCompanyNameAndBsCode(companyName, bsCode);

                if (existingCompany == null) {
                    // Create a new company entry in tbl_company
                    CompanyModelEntity newCompany = new CompanyModelEntity();
                    newCompany.setCompanyName(companyName);
                    newCompany.setBsCode(bsCode);
                    // ... (set other properties)
                    companyRepository.save(newCompany);
                }

                OrderModelEntity orderModelEntity = new OrderModelEntity();
                orderModelEntity.setChtTicketId(chtticket);
                orderModelEntity.setBsCode(bsCode);
                orderModelEntity.setCompanyName(companyName);
                orderModelEntity.setVtsSimNo(vtsSim);
                orderModelEntity.setSimKit(simKit);
                orderModelEntity.setPackName(packName);
                orderModelEntity.setBasePrice(Double.parseDouble(basePrice));
                orderModelEntity.setVid(vid);
                orderModelEntity.setRatePlan(ratePlan);
                orderModelEntity.setUnitPrice(Double.parseDouble(mrp));
                orderModelEntity.setAltContactNum(altContact);
                orderModelEntity.setKcpName(kcpName);
                orderModelEntity.setKcpContactNumber(kcpContact);
                orderModelEntity.setKcpEmail(kcpEmail);
                orderModelEntity.setSupportPartnerName(supportPartner);
                orderModelEntity.setProductType(productType);
                orderModelEntity.setAudioListenMsisdn(audNum);
                orderModelEntity.setStatusName("New Order");


                orderRepository.save(orderModelEntity);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle exceptions
        }
    }



    @Override
    public OrderModelEntity getOrderById(Long orderId) {
        // Implement the logic to get the order by ID from the repository
        Optional<OrderModelEntity> optionalOrder = orderRepository.findById(orderId);
        return optionalOrder.orElse(null);
    }

    @Override
    public void saveOrder(OrderModelEntity order) {
        // Implement the logic to save the order to the repository
        orderRepository.save(order);

//        String toEmail = "recipient@example.com";
//        String body = "Email body content";
//        String subject = "Email subject";
//        String cc = "cc@example.com"; // Optional, can be an empty string
//        boolean emailSent = emailSenderService.sendEmail(toEmail, body, subject, cc);
//
//        if (emailSent) {
//            System.out.println("Email sent successfully");
//        } else {
//            System.out.println("Failed to send email");
//        }

    }

    @Override
    public void updateFinalOrder(OrderModelEntity order) {
        orderRepository.save(order);
    }


    //New v2 Orders
    @Override
    public DataTablesOutput<OrderModelEntity> findAllB2bSimOrderList(HttpServletRequest request, String customQuery, DataTablesInput input) {
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
    public CommonRestResponse updateOrderStatus(HttpServletRequest request, String orderStatusData, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
           // System.out.println("orderStatusData: " + orderStatusData);
            OrderModelEntity updateStatus = new Gson().fromJson(orderStatusData, new TypeToken<OrderModelEntity>() {
            }.getType());

            String status_name = updateStatus.getStatusName();

        //    System.out.println("orderStatusData: " + test);
          if ("Finalization".equals(status_name)){
                System.out.println("tests success");
                UserModelEntity existingUser = userService.findByUserName(updateStatus.getKcpContactNumber());

                if (existingUser == null) {
                    // Create a new user entry in tbl_user
                    UserModelEntity newUser = new UserModelEntity();
                    newUser.setUserName(updateStatus.getKcpContactNumber());
                    newUser.setFullName(updateStatus.getKcpName());
                    newUser.setMobileNumber(updateStatus.getKcpEmail());
                    newUser.setIsActive(1);
                    userService.save(newUser);
                }

             String existingImei = trackerDeviceService.checkImeiExists(updateStatus.getImei());
                    System.out.println(existingImei);
              System.out.println("-------"+updateStatus.getImei());
                if("false".equals(existingImei)) {
                    // Send HTTP POST request
//                    String apiUrl = "https://tteche.grameenphone.com/federal-mw/so/api/web/device/add";
//                    String authorizationHeader = "Basic aW90d2ViOmdwNzU4MA==";

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
                        JSONObject responseHeader = jsonResponse.getJSONObject("responseHeader");
                        resultCode = responseHeader.getLong("resultCode");
                        resultDesc  = responseHeader.getString("resultDesc");

                        // Use the resultCode as needed
                        System.out.println("Result Code: " + resultCode);

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    //end api call
                    TrackerDeviceModelEntity deviceInfo = new TrackerDeviceModelEntity();
                    deviceInfo.setUserId(existingUser.getId()); // Set the user ID
                    deviceInfo.setImei(updateStatus.getImei());
                    deviceInfo.setTrackerDeviceId(resultCode);
                    deviceInfo.setUserEmail(resultDesc);
                    // Set other device info fields as needed
                    trackerDeviceService.saveDeviceInfo(deviceInfo);
                }

            }

            OrderModelEntity orderModelEntity = orderRepository.getById(id);

            orderModelEntity.setStatusName(updateStatus.getStatusName());
            orderModelEntity.setStatusNameId(updateStatus.getStatusNameId());

            orderModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setUpdatedAt(Helper.getCurrentDate());


            orderRepository.save(orderModelEntity);

            commonRestResponse.setData(orderModelEntity.getId());
          //  sendEmailAndSms(orderModelEntity);
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Order Status has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }

    public void sendEmailAndSms(OrderModelEntity orderData){
        String toEmail = orderData.getVendorEmail();
        String body = "Order data has been updated for order ID: " + orderData.getId() + ". " + "Order Status : "+ orderData.getStatusName();
        String subject = "VTS Order Data Update Notification";
        String cc = "jobaidur@grameenphone.com,ifaz@grameenphone.com";

        emailSenderService.sendEmail(toEmail, body, subject, cc);

        String customerMail = "jobaidur@grameenphone.com";
        String body_kcp = "Order Onboarded Successfully. " + "Username : "+ "88"+orderData.getCustomerContactNumber();
        String subject_kcp = "VTS Order Update Notification";
        String cc_kcp = "ifaz@grameenphone.com";

        emailSenderService.sendEmail(customerMail, body_kcp, subject_kcp, cc_kcp);

        SMS sms = new SMS();
        sms.setPhone(orderData.getCustomerContactNumber());
        sms.setText(body);
        sendSMSService.sendSMS(sms);
    }


}