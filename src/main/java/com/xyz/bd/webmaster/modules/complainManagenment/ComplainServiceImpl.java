package com.xyz.bd.webmaster.modules.complainManagenment;

import com.xyz.bd.webmaster.modules.actionLogs.ActionLogService;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;

import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class ComplainServiceImpl implements ComplainService{

    @Autowired
    ComplainRepository complainRepository;

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
}
