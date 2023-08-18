package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<ProductsModel> getProductList();

    ProductsModel getProductDetail(Long id);
}
