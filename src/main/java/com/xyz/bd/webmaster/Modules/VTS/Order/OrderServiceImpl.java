package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.ss.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService{

   @Autowired
    private OrderRepository orderRepository;
    @Override
    public List<OrderModelEntity> getAllOrder() {
        return orderRepository.findAll();
    }

    @Override
    @Transactional
    public void saveData(String chtticket, MultipartFile excelFile) {
        try {
            byte[] excelBytes = excelFile.getBytes();
            InputStream inputStream = new ByteArrayInputStream(excelBytes);

            Workbook workbook = WorkbookFactory.create(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            DataFormatter dataFormatter = new DataFormatter();

//            XSSFWorkbook workbook = new XSSFWorkbook(UPLOADED_FOLDER + timestamp.getTime() + "_" + file.getOriginalFilename().replace(" ", "_"));
//            XSSFSheet sheet = workbook.getSheetAt(0);
//            XSSFRow row = sheet.getRow(0);
//            int colNum = row.getLastCellNum();

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

                OrderModelEntity orderModelEntity = new OrderModelEntity();
                orderModelEntity.setChtTicket(chtticket);
                orderModelEntity.setBs_code(bsCode);
                orderModelEntity.setCompany_name(companyName);
                orderModelEntity.setVts_sim(vtsSim);
                orderModelEntity.setSim_kit(simKit);
                orderModelEntity.setPack_name(packName);
                orderModelEntity.setBase_price(basePrice);
                orderModelEntity.setVid(vid);
                orderModelEntity.setRate_plan_name(ratePlan);
                orderModelEntity.setMrp(mrp);
                orderModelEntity.setAlt_contact_num(altContact);
                orderModelEntity.setKcp_name(kcpName);
                orderModelEntity.setAlt_contact_num(kcpContact);
                orderModelEntity.setKcp_email(kcpEmail);
                orderModelEntity.setSup_partner_name(supportPartner);
                orderModelEntity.setProduct_type(productType);
                orderModelEntity.setAudio_num(audNum);


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
    }





}
