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

@Service
public class OrderServiceImpl implements OrderService{

   @Autowired
    private OrderRepository orderRepository;
    @Override
    public List<OrderModelEntity> getAllOrder() {
        return orderRepository.findAll();
    }

//    @Override
//    public void saveData(OrderModelEntity orderModelEntity) {
//        orderRepository.save(orderModelEntity);
//    }

//    public void saveData(String msisdn, MultipartFile excelFile) {
//        OrderModelEntity orderModelEntity = new OrderModelEntity();
//        orderModelEntity.setMsisdn(msisdn);
//        // Process excelFile and set appropriate data in dataEntity
//
//        orderRepository.save(orderModelEntity);
//    }

//        @Override
//        @Transactional
//        public void saveData(String msisdn, MultipartFile excelFile) {
//            try {
//                byte[] excelBytes = excelFile.getBytes();
//                InputStream inputStream = new ByteArrayInputStream(excelBytes);
//
//                Workbook workbook = WorkbookFactory.create(inputStream);
//                Sheet sheet = workbook.getSheetAt(0);
//                DataFormatter dataFormatter = new DataFormatter();
//
//                for (Row row : sheet) {
//                    String email = dataFormatter.formatCellValue(row.getCell(0));
//                    String customerName = dataFormatter.formatCellValue(row.getCell(1));
//
//                    System.out.println("Email: " + email + ", Customer Name: " + customerName);
//
//                    OrderModelEntity orderModelEntity = new OrderModelEntity();
//                    orderModelEntity.setMsisdn(msisdn);
//                    orderModelEntity.setEmail(email);
//                    orderModelEntity.setCustomer_name(customerName);
//
//                    orderRepository.save(orderModelEntity);
//                    System.out.println("Data saved successfully");
//                }
//
//            } catch (IOException | EncryptedDocumentException e) {
//                // Handle exceptions
//            }
//        }

    @Override
    @Transactional
    public void saveData(String msisdn, MultipartFile excelFile) {
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
                String email = dataFormatter.formatCellValue(row.getCell(0));
                String customerName = dataFormatter.formatCellValue(row.getCell(1));

                System.out.println(email);
                System.out.println(customerName);

                OrderModelEntity orderModelEntity = new OrderModelEntity();
                orderModelEntity.setMsisdn(msisdn);
                orderModelEntity.setEmail(email);
                orderModelEntity.setCustomer_name(customerName);

                orderRepository.save(orderModelEntity);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            // Handle exceptions
        }
    }



}
