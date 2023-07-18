package com.xyz.bd.webmaster.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class DashboardController {
    @RequestMapping(value="/dashboard", method = RequestMethod.GET)
    public ModelAndView showDashboardPage(ModelMap model){
        model.addAttribute("title", "Dashboard");
        model.addAttribute("menu", "Dashboard");
        return new ModelAndView("dashboard/dashboard");
    }
}
