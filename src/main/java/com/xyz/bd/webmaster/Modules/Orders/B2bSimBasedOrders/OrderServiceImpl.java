package com.xyz.bd.webmaster.Modules.Orders.B2bSimBasedOrders;

import com.xyz.bd.webmaster.Modules.CommonPackages.Company.CompanyModelEntity;
import com.xyz.bd.webmaster.Modules.CommonPackages.Company.CompanyRepository;
import com.xyz.bd.webmaster.Modules.CommonPackages.Products.ProductService;
import com.xyz.bd.webmaster.Modules.Orders.B2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.Modules.Orders.OrderModelEntity;
import com.xyz.bd.webmaster.Modules.Orders.OrderRepository;
import com.xyz.bd.webmaster.Repositories.CommonRepository;
import com.xyz.bd.webmaster.Services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.Services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.Utility.Utility;
import com.xyz.bd.webmaster.Utility.dataTable.QueryBuilderService;
import org.apache.poi.ss.usermodel.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
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
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService{

   @Autowired
    private OrderRepository orderRepository;
   @Autowired
   private CompanyRepository companyRepository;

    @Autowired
    private EmailSenderService emailSenderService;

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    ProductService productService;

    @Autowired
    SendSMSService sendSMSService;


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
                orderModelEntity.setKamEmail(kcpEmail);
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


}
