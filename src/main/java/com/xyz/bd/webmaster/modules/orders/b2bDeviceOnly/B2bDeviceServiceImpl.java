package com.xyz.bd.webmaster.modules.orders.b2bDeviceOnly;

import com.xyz.bd.webmaster.modules.commonPackages.company.CompanyRepository;
import com.xyz.bd.webmaster.modules.commonPackages.trackerDevice.TrackerDeviceService;
import com.xyz.bd.webmaster.modules.commonPackages.user.UserService;
import com.xyz.bd.webmaster.modules.inventory.ProductRepository;
import com.xyz.bd.webmaster.modules.inventory.ProductService;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderRepository;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.services.CommonServices.EmailSenderService;
import com.xyz.bd.webmaster.services.CommonServices.SendSMSService;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
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


}
