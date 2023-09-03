package com.xyz.bd.webmaster.modules.orders.b2cGpShop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/orders")
public class GpShopOrderController {
    @Autowired
    private B2cGpShopServices b2cGpShopServices;
    @PostMapping("/save-data-gpshop")
    @ResponseBody
    public String saveDataGpShop(HttpServletRequest request,
                                 @RequestParam("excelFile") MultipartFile excelFile) {
        b2cGpShopServices.saveData(request, excelFile);
        return "Data saved successfully!";
    }
}


