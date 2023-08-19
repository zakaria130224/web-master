package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.xyz.bd.webmaster.Modules.CommonPackages.Models.ProductVendorDto;
import com.xyz.bd.webmaster.Modules.CommonPackages.Models.ProductVendorMapping;
import com.xyz.bd.webmaster.Modules.CommonPackages.Models.VendorModelEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<ProductsModel> getProductList();

    ProductsModel getProductDetail(Long id);

    VendorModelEntity getVendorByProductId(Long id);

    public List<ProductVendorDto> getVendorByProductIdJoin(Long id);
}
