package com.xyz.bd.webmaster.modules.dashboard;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class HomeController {
    @RequestMapping(value="/dashboard-admin", method = RequestMethod.GET)
    public ModelAndView showAdminDashboardPage(ModelMap model){
        model.addAttribute("title", "Dashboard");
        model.addAttribute("menu", "Dashboard");
        return new ModelAndView("dashboard/dashboard-admin");
    }

    @RequestMapping(value="/dashboard-vendor", method = RequestMethod.GET)
    public ModelAndView showvendorDashboardPage(ModelMap model){
        model.addAttribute("title", "Dashboard");
        model.addAttribute("menu", "Dashboard");
        return new ModelAndView("dashboard/dashboard-vendor");
    }
}
