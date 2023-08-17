package com.xyz.bd.webmaster.Modules.Orders.B2cGpcOrders;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Modules.Orders.OrderModelEntity;
import com.xyz.bd.webmaster.Modules.Orders.OrderRepository;
import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriverService;
import com.xyz.bd.webmaster.Modules.VTS.Drivers.DriversModelEntity;
import com.xyz.bd.webmaster.Repositories.CommonRepository;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import com.xyz.bd.webmaster.Utility.Helper;
import com.xyz.bd.webmaster.Utility.Utility;
import com.xyz.bd.webmaster.Utility.dataTable.QueryBuilderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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

            orderModelEntity.setCustomer_name(order.getCustomer_name());
            orderModelEntity.setAddress(order.getAddress());
            orderModelEntity.setProduct_type(order.getProduct_type());
            orderModelEntity.setKcp_contact_num(order.getKcp_contact_num());

            orderModelEntity.setCreatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setCreatedAt(Helper.getCurrentDate());


            orderRepository.save(orderModelEntity);
            commonRestResponse.setData(orderModelEntity.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Order has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Order Creation request has been Failed");
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

            orderModelEntity.setStatus(updateStatus.getStatus());

            orderModelEntity.setUpdatedBy(SessionManager.getUserLoginName(request));
            orderModelEntity.setUpdatedAt(Helper.getCurrentDate());


            orderRepository.save(orderModelEntity);
            commonRestResponse.setData(orderModelEntity.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Order Status has been Added Successfully");
        }
        catch(ArrayIndexOutOfBoundsException ex)
        {
            commonRestResponse.setCode(402);
            commonRestResponse.setData(null);
            commonRestResponse.setMessage("Order Update Status request has been Failed");
            LOGGER.error(ex.toString());
        }

        return commonRestResponse;
    }
}
