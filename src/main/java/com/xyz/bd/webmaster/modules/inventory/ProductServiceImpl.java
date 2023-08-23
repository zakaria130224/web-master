package com.xyz.bd.webmaster.modules.inventory;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.xyz.bd.webmaster.modules.commonPackages.models.ProductVendorDto;
import com.xyz.bd.webmaster.modules.commonPackages.models.VendorModelEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService{

    @Autowired
    ProductRepository productRepository;

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

    public VendorModelEntity findVendorByProductName(String productName) {
        return productRepository.findVendorByProductName(productName);
    }
}
