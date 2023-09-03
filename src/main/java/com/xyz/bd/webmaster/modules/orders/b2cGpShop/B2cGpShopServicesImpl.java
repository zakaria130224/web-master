package com.xyz.bd.webmaster.modules.orders.b2cGpShop;


import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyRepository;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceService;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserService;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;
import com.xyz.bd.webmaster.modules.inventory.ProductsModel;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderRepository;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServicesImpl;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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

    private HttpServletRequest requests;

    @Value("${file.upload.dir}")
    private String uploadDirectoryPath;

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
                Row row = sheet.getRow(rowIndex);
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
                String productQty = dataFormatter.formatCellValue(row.getCell(11));
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

//                System.out.println(bsCode);
//                System.out.println(companyName);
//
//                CompanyModelEntity existingCompany = companyRepository.findByCompanyNameAndBsCode(companyName, bsCode);
//
//                if (existingCompany == null) {
//                    // Create a new company entry in tbl_company
//                    CompanyModelEntity newCompany = new CompanyModelEntity();
//                    newCompany.setCompanyName(companyName);
//                    newCompany.setBsCode(bsCode);
//                    // ... (set other properties)
//                    companyRepository.save(newCompany);
//                }

                ProductsModel products = productService.getAllProductDataByProductName(productType);

                OrderModelEntity orderModelEntity = new OrderModelEntity();
              //  orderModelEntity.setChtTicketId(chtticket);
                orderModelEntity.setGpshopTransactionId(transaction);
                orderModelEntity.setCustomerName(customerName);
                orderModelEntity.setCustomerContactNumber(cusMsisdn);
                orderModelEntity.setAddress(cusAddress);
                orderModelEntity.setCity(cusCity);
                orderModelEntity.setDistrict(cusArea);
                orderModelEntity.setThana(cusThana);
                orderModelEntity.setProductType(productType);
                orderModelEntity.setProductName(productName);
                orderModelEntity.setQuantity(Long.valueOf(productQty));
                orderModelEntity.setUnitPrice(Double.valueOf(mrp));
                orderModelEntity.setGpShopDeliveryType(deliveryType);
                orderModelEntity.setGpshopDeliveryCharge(Double.valueOf(deliveryCharge));
//                orderModelEntity.setKcpContactNumber(kcpContact);
//                orderModelEntity.setKcpEmail(kcpEmail);
//                orderModelEntity.setSupportPartnerName(supportPartner);
//                orderModelEntity.setProductType(productType);
//                orderModelEntity.setAudioListenMsisdn(audNum);
                orderModelEntity.setStatusName("New Order");
                orderModelEntity.setOrderType("b2b_simbased");
//                orderModelEntity.setCompanyId(existingCompany.getId());
//                orderModelEntity.setVendorName(vendor.getName());
//                orderModelEntity.setVendorEmail(vendor.getEmail());
//                orderModelEntity.setVendorId(vendor.getId());
//                orderModelEntity.setDeviceCategory(products.getDeviceCategory());
//                orderModelEntity.setDeviceSubCategory(products.getDeviceSubCategory());
//                orderModelEntity.setProductId(products.getId());
//                orderModelEntity.setProductName(products.getProductName());
//                orderModelEntity.setStatusNameId(1);
//                orderModelEntity.setProductType(products.getProductType());
//                orderModelEntity.setCustomerName(kcpName);
//                orderModelEntity.setCustomerContactNumber(kcpContact);
//                orderModelEntity.setCustomerEmail(kcpEmail);


                orderRepository.save(orderModelEntity);
                if(orderModelEntity.getId() != null){
                    b2cGpcServices.statusCheck(orderModelEntity);
                }
            }


        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle exceptions
        }
    }

}
