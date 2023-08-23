package com.xyz.bd.webmaster.modules.inventory;

import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public interface ProductService {

    public List<ProductsModel> getProductList();

    ProductsModel getProductDetail(Long id);

    VendorModelEntity getVendorByProductId(Long id);

    public List<ProductVendorDto> getVendorByProductIdJoin(Long id);

    DataTablesOutput<ProductsModel> findAllItemList(HttpServletRequest request, String customQuery, DataTablesInput input);
}
