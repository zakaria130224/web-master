package com.xyz.bd.webmaster.Modules.VTS.Order;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
    @RequestMapping(value = "/order-list", method = RequestMethod.GET)
    public ModelAndView showOrderListPage(ModelMap model) {
        model.addAttribute("title", "Order List");
        model.addAttribute("menu", "Order List");
        return new ModelAndView("order-management/order-list");

    }

}
