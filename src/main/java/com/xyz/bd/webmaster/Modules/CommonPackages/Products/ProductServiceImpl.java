package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

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
}
