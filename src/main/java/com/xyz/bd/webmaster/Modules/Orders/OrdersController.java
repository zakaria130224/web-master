package com.xyz.bd.webmaster.Modules.Orders;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/orders")
public class OrdersController {
    @RequestMapping(value="/b2c-gp-shop", method = RequestMethod.GET)
    public ModelAndView showB2CGpShopOrders(ModelMap model){
        model.addAttribute("title", "B2B GP SHOP");
        model.addAttribute("menu", "Orders");
        return new ModelAndView("orders/b2c-gp-shop");
    }

    @RequestMapping(value="/b2c-gpc", method = RequestMethod.GET)
    public ModelAndView showB2CGpcOrders(ModelMap model){
        model.addAttribute("title", "B2C GPC");
        model.addAttribute("menu", "Orders");
        return new ModelAndView("orders/b2c-gpc");
    }

    @RequestMapping(value="/b2b", method = RequestMethod.GET)
    public ModelAndView showB2BOnlyOrders(ModelMap model){
        model.addAttribute("title", "B2B Only");
        model.addAttribute("menu", "Orders");
        return new ModelAndView("orders/b2c");
    }

    @RequestMapping(value="/b2b-sim-based", method = RequestMethod.GET)
    public ModelAndView showB2BSimBasedOrders(ModelMap model){
        model.addAttribute("title", "B2B Sim Based");
        model.addAttribute("menu", "Orders");
        return new ModelAndView("orders/b2b-sim-based");
    }
}
