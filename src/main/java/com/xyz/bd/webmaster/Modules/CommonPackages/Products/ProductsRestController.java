package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus.OrderStatus;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/web/utility")
public class ProductsRestController {
    private final Logger logger = LoggerFactory.getLogger("ProductsRestController");

    @Autowired
    private ProductService productService;

    @GetMapping("/product-list")
    public CommonRestResponse getProductList() {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(productService.getProductList());
        return commonRestResponse;
    }
}
