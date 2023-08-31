package com.xyz.bd.webmaster.modules.orders.b2bDeviceOnly;

import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.actionLogs.ActionLogsModel;
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
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServicesImpl;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.Helper;
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
public class B2bDeviceServiceImpl implements B2bDeviceServices{
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
    public DataTablesOutput<OrderModelEntity> findAllB2bDeviceOrderList(HttpServletRequest request, String customQuery, DataTablesInput input) {
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
    public void saveData(String chtticket, MultipartFile excelFile) {
        try {
            //save excel
            String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());

            // Define the upload directory
//            String uploadDirectory = "./upload";
//
//            // Generate the filename using the timestamp and original filename
//            String filename = timestamp + "_" + excelFile.getOriginalFilename();
//
//            // Create the path for the file
//            Path filePath = Paths.get(uploadDirectory, filename);
//
//            // Save the uploaded Excel file to the specified path
//            Files.copy(excelFile.getInputStream(), filePath);
            //save excel

            //new excel save
            //new excel
            String filename = timestamp + "_" + excelFile.getOriginalFilename();

            // Create the path for the file
            Path filePath = Paths.get(uploadDirectoryPath, filename);

            // Create the directory if it doesn't exist
            Files.createDirectories(filePath.getParent());

            // Save the uploaded Excel file to the specified path
            Files.copy(excelFile.getInputStream(), filePath);
            //new excel save

            byte[] excelBytes = excelFile.getBytes();
            InputStream inputStream = new ByteArrayInputStream(excelBytes);

            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            DataFormatter dataFormatter = new DataFormatter();


            // Skip the first row (header row) by starting the loop from index 1
            for (int rowIndex = 1; rowIndex < sheet.getPhysicalNumberOfRows(); rowIndex++) {
                Row row = sheet.getRow(rowIndex);
                String quantityCellValue = dataFormatter.formatCellValue(row.getCell(2));
                int productQuantity = 0;
                productQuantity = Integer.parseInt(quantityCellValue);
                for (int i = 0; i < productQuantity; i++) {
                String bsCode = dataFormatter.formatCellValue(row.getCell(0));
                String companyName = dataFormatter.formatCellValue(row.getCell(1));
                String kcpName = dataFormatter.formatCellValue(row.getCell(6));
                String kcpContact = dataFormatter.formatCellValue(row.getCell(7));
                String kcpEmail = dataFormatter.formatCellValue(row.getCell(8));
                String supportPartner = dataFormatter.formatCellValue(row.getCell(9));
                String productType = dataFormatter.formatCellValue(row.getCell(10));

                VendorModelEntity vendor = productService.findVendorByProductName(productType);

                if (vendor != null) {
                    System.out.println("Vendor Name: " + vendor.getName());
                    System.out.println("Vendor Email: " + vendor.getEmail());

                    // Perform any actions with the vendor details here
                }

                System.out.println(bsCode);
                System.out.println(companyName);

                CompanyModelEntity existingCompany = companyRepository.findByCompanyNameAndBsCode(companyName, bsCode);

                if (existingCompany == null) {
                    // Create a new company entry in tbl_company
                    CompanyModelEntity newCompany = new CompanyModelEntity();
                    newCompany.setCompanyName(companyName);
                    newCompany.setBsCode(bsCode);

                    companyRepository.save(newCompany);
                }

                ProductsModel products = productService.getAllProductDataByProductName(productType);

                OrderModelEntity orderModelEntity = new OrderModelEntity();
                orderModelEntity.setChtTicketId(chtticket);
                orderModelEntity.setBsCode(bsCode);
                orderModelEntity.setCompanyName(companyName);
                orderModelEntity.setKcpName(kcpName);
                orderModelEntity.setKcpContactNumber(kcpContact);
                orderModelEntity.setKcpEmail(kcpEmail);
                orderModelEntity.setCustomerName(kcpName);
                orderModelEntity.setCustomerContactNumber(kcpContact);
                orderModelEntity.setSupportPartnerName(supportPartner);
                orderModelEntity.setProductType(productType);
                orderModelEntity.setStatusName("New Order");
                orderModelEntity.setOrderType("b2b_simless");
                orderModelEntity.setCompanyId(existingCompany.getId());
                orderModelEntity.setVendorName(vendor.getName());
                orderModelEntity.setVendorEmail(vendor.getEmail());
                orderModelEntity.setVendorId(vendor.getId());
                orderModelEntity.setDeviceCategory(products.getDeviceCategory());
                orderModelEntity.setDeviceSubCategory(products.getDeviceSubCategory());
                orderModelEntity.setProductId(products.getId());
                orderModelEntity.setProductName(products.getProductName());
                orderModelEntity.setStatusNameId(1);
                orderModelEntity.setProductType(products.getProductType());


                orderRepository.save(orderModelEntity);
                    if(orderModelEntity.getId() != null){
                        b2cGpcServices.statusCheck(orderModelEntity);
                    }

//                    ActionLogsModel actionLogsModel = new ActionLogsModel();
//                    actionLogsModel.setAction_type_name(Utility.create_order_gps);
//                    actionLogsModel.setAction_type_id(1L);
//                    actionLogsModel.setEvent_date(Helper.getCurrentDate());
//                    actionLogsModel.setF_id(1L);
//                    actionLogsModel.setF_table(Utility.tbl_order);
//                    actionLogsModel.setUser_id(1321L);
//                    actionLogsModel.setOld_data("");
//                    actionLogsModel.setNew_data("");
//                    actionLogsModel.setMsisdn(orderModelEntity.getKamContactNumber());
//                    actionLogsModel.setNote("Order Creation b2b simless");
//                    actionLogsModel.setCreatedBy("zakaria.ahmaad");
//                    actionLogsModel.setCreatedAt(Helper.getCurrentDate());
//
//                    actionLogService.SaveLogsData(actionLogsModel);
            }
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle exceptions
        }
    }


}
