package com.xyz.bd.webmaster.modules.inventory;

import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<ProductsModel> getProductList();

    ProductsModel getProductDetail(Long id);

    VendorModelEntity getVendorByProductId(Long id);

    public List<ProductVendorDto> getVendorByProductIdJoin(Long id);

    VendorModelEntity findVendorByProductName(String productName);
}
