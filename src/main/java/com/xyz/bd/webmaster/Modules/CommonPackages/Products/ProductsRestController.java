package com.xyz.bd.webmaster.Modules.CommonPackages.Products;

import com.xyz.bd.webmaster.Modules.CommonPackages.OrderStatus.OrderStatus;
import com.xyz.bd.webmaster.Utility.CommonRestResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

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

    @PostMapping("/product-detail")
    public CommonRestResponse getProductDetail(HttpServletRequest request, @RequestParam("id") Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(productService.getProductDetail(id));
        return commonRestResponse;
    }

    @PostMapping("/vendor-list")
    public CommonRestResponse getVendorByProductId(HttpServletRequest request, @RequestParam("id") Long id) {
        CommonRestResponse commonRestResponse = new CommonRestResponse();
        commonRestResponse.setData(productService.getVendorByProductIdJoin(id));
        return commonRestResponse;
    }



}
