package com.xyz.bd.webmaster.modules.inventory;

import com.xyz.bd.webmaster.modules.orders.OrderModelEntity;
import com.xyz.bd.webmaster.utility.CommonRestResponse;
import com.xyz.bd.webmaster.utility.Utility;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

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

    @RequestMapping(value = "/product/listDT", method = RequestMethod.GET)
    public DataTablesOutput<ProductsModel> findAllItemList(@Valid DataTablesInput input, HttpServletRequest request, @RequestParam(value = "customQuery",required = false) String customQuery) {
        return productService.findAllItemList(request, customQuery, input);
    }

    @RequestMapping(value = "/product/save", method = RequestMethod.POST)
    public CommonRestResponse addNewProduct(HttpServletRequest request,
                                           @RequestParam("productInfo") String productInfo) {
        return productService.addNewProduct(request, productInfo);

    }

    @RequestMapping(value = "/product/update", method = RequestMethod.POST)
    public CommonRestResponse updateNewProduct(HttpServletRequest request,
                                           @RequestParam("productInfo") String productInfo, @RequestParam("id") Long id) {
        return productService.updateNewProduct(request, productInfo, id);

    }

    @RequestMapping(value = "/vendor-list", method = RequestMethod.GET)
    public CommonRestResponse getVendorList(HttpServletRequest request) {
        return productService.getVendorList();
    }

}
