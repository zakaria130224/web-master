package com.xyz.bd.webmaster.modules.inventory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.repositories.CommonRepository;
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
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductRepository productRepository;

    @Autowired
    QueryBuilderService queryBuilderService;

    @Autowired
    CommonRepository commonRepository;

    @Autowired
    private EntityManager entityManager;

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

}
