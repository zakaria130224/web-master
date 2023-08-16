package com.xyz.bd.webmaster.Modules.Billing;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BillingController {
    @RequestMapping(value="/billing", method = RequestMethod.GET)
    public ModelAndView showDashboardPage(ModelMap model){
        model.addAttribute("title", "Billing");
        model.addAttribute("menu", "Billing");
        return new ModelAndView("billing/billing");
    }
}
