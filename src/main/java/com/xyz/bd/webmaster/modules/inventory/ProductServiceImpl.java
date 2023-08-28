package com.xyz.bd.webmaster.modules.inventory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.commonPackages.repository.VendorRepository;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.modules.orders.b2cGpcOrders.B2cGpcServices;
import com.xyz.bd.webmaster.repositories.CommonRepository;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Helper;
import com.xyz.bd.webmaster.utility.Utility;
import com.xyz.bd.webmaster.utility.dataTable.QueryBuilderService;
import freemarker.template.TemplateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.IOException;
import java.util.List;
import java.util.Random;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductRepository productRepository;

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    private EntityManager entityManager;

    @Autowired
    VendorRepository vendorRepository;

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductService.class);

    @Override
    public List<ProductsModel> getProductList() {
        List<ProductsModel> result = productRepository.findAll();
        return result;
    }

    @Override
    public ProductsModel getProductDetail(Long id) {
        return productRepository.getById(id);
    }

    @Override
    public VendorModelEntity getVendorByProductId(Long id) {
        Object data = productRepository.getVendorByProductId(id);
        VendorModelEntity vendorModel = new Gson().fromJson((String) data, new TypeToken<VendorModelEntity>() {}.getType());

        return vendorModel;
    }

    @Override
    public List<ProductVendorDto> getVendorByProductIdJoin(Long id) {
        List<ProductVendorDto> list = productRepository.getVendorByProductIdJoin(id);
        list.forEach(l -> System.out.println(l));
        return list;
    }

    @Override
    public DataTablesOutput<ProductsModel> findAllItemList(HttpServletRequest request, String customQuery, DataTablesInput input) {
        String whereQuery = queryBuilderService.generateSearchQuery(customQuery, Utility.tbl_product, ProductsModel.class);

        String searchQuery = queryBuilderService.selectAllQuery(whereQuery, Utility.tbl_product);

        searchQuery = queryBuilderService.generatePaginationQuery(input.getStart(), input.getLength(), searchQuery);

        String count = queryBuilderService.countQuery("ID", whereQuery, Utility.tbl_product, ProductsModel.class);

        int totalData = commonRepository.CommoNumberOfRow(count);

        List<ProductsModel> resultList = entityManager.createNativeQuery(searchQuery, ProductsModel.class).getResultList();

        DataTablesOutput<ProductsModel> tableData = new DataTablesOutput<>();

        tableData.setData(resultList);
        tableData.setRecordsFiltered(totalData);
        tableData.setRecordsTotal(totalData);
        tableData.setDraw(input.getDraw());

        return tableData;
    }

    public VendorModelEntity findVendorByProductName(String productName) {
        return productRepository.findVendorByProductName(productName);
    }

    @Override
    public ProductsModel getAllProductDataByProductName(String productName) {
        return productRepository.findByProductName(productName);
    }

    @Override
    public CommonRestResponse addNewProduct(HttpServletRequest request, String productInfo) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ProductsModel product = new Gson().fromJson(productInfo, new TypeToken<ProductsModel>() {
            }.getType());

            ProductsModel productsModel = new ProductsModel();

            productsModel.setItemCode(product.getItemCode());
            productsModel.setProductName(product.getProductName());
            productsModel.setProductType(product.getProductType());
            productsModel.setDeviceCategory(product.getDeviceCategory());
            productsModel.setDeviceSubCategory(product.getDeviceSubCategory());
            productsModel.setChannel(product.getChannel());
            productsModel.setPackageName(product.getPackageName());
            productsModel.setMonthlyCharge(product.getMonthlyCharge());
            productsModel.setTotalCharge(product.getTotalCharge());
            productsModel.setQuantity(product.getQuantity());
            productsModel.setHasSim(product.getHasSim());
            productsModel.setVendorId(product.getVendorId());
            productsModel.setStatus(true);
            productsModel.setRemarks(product.getRemarks());
            productsModel.setDescription(product.getDescription());
            productsModel.setCreatedBy(SessionManager.getUserLoginName(request));
            productsModel.setCreatedAt(Helper.getCurrentDate());

            //appUserService.saveNewUserNew(newMdUserModel);


            productRepository.save(productsModel);
            commonRestResponse.setData(productsModel.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Product has been Added Successfully");
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

    @Override
    public CommonRestResponse updateNewProduct(HttpServletRequest request, String productInfo, Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        try
        {
            ProductsModel product = new Gson().fromJson(productInfo, new TypeToken<ProductsModel>() {
            }.getType());

            ProductsModel productsModel = productRepository.getById(id);
            productsModel.setItemCode(product.getItemCode());
            productsModel.setProductName(product.getProductName());
            productsModel.setProductType(product.getProductType());
            productsModel.setDeviceCategory(product.getDeviceCategory());
            productsModel.setDeviceSubCategory(product.getDeviceSubCategory());
            productsModel.setChannel(product.getChannel());
            productsModel.setPackageName(product.getPackageName());
            productsModel.setMonthlyCharge(product.getMonthlyCharge());
            productsModel.setTotalCharge(product.getTotalCharge());
            productsModel.setQuantity(product.getQuantity());
            productsModel.setHasSim(product.getHasSim());
            productsModel.setVendorId(product.getVendorId());
            productsModel.setRemarks(product.getRemarks());
            productsModel.setDescription(product.getDescription());

            productsModel.setUpdatedBy(SessionManager.getUserLoginName(request));
            productsModel.setUpdatedAt(Helper.getCurrentDate());


            productRepository.save(productsModel);

            commonRestResponse.setData(productsModel.getId());
            commonRestResponse.setCode(200);
            commonRestResponse.setMessage("Product Status has been Added Successfully");
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

    @Override
    public CommonRestResponse getVendorList() {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(vendorRepository.findAll());
        return commonRestResponse;
    }

}
