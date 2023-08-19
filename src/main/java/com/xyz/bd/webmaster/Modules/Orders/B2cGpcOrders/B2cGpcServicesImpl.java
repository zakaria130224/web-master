package com.xyz.bd.webmaster.Modules.Orders.B2cGpcOrders;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Modules.CommonPackages.Products.ProductService;
import com.xyz.bd.webmaster.Modules.CommonPackages.Products.ProductsModel;
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
import java.util.Random;

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

    @Autowired
    ProductService productService;

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
            Integer random = new Random().nextInt(90000) + 10000;
            ProductsModel productsModel = productService.getProductDetail(order.getProductId());

            if(productsModel.getHas_sim().equals(true)){
                orderModelEntity.setOrderType("gpc-sim");
            } else{
                orderModelEntity.setOrderType("gpc-simless");
            }

            orderModelEntity.setCustomerName(order.getCustomerName());
            orderModelEntity.setAddress(order.getAddress());
            orderModelEntity.setProductId(order.getProductId());
            orderModelEntity.setProductType(productsModel.getProduct_type());
            orderModelEntity.setProductName(productsModel.getProduct_name());
            orderModelEntity.setPackName(productsModel.getPackage_name());
            orderModelEntity.setDeviceCategory(productsModel.getDevice_category());
            orderModelEntity.setDeviceSubCategory(productsModel.getDevice_sub_category());
            orderModelEntity.setCustomerContactNumber(order.getCustomerContactNumber());
            orderModelEntity.setVtsSimNo(order.getVtsSimNo());
            orderModelEntity.setStatusName("New Order");
            orderModelEntity.setVendorId(order.getVendorId());
            orderModelEntity.setVendorEmail(order.getVendorEmail());
            orderModelEntity.setVendorName(order.getVendorName());
            orderModelEntity.setCloudId(Integer.toString(random));
            orderModelEntity.setSimKit("898801"+ Integer.toString(random) +"38163F");
            orderModelEntity.setRatePlan(order.getRatePlan());


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

            orderModelEntity.setStatusName(updateStatus.getStatusName());

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
