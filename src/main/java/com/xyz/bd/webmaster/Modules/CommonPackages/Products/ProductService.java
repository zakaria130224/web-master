package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus.OrderStatusModel;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ProductService {

    public List<ProductsModel> getProductList();
}
