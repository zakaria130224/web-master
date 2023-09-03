package com.xyz.bd.webmaster.modules.complainManagenment;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ComplainMgtController {
    @RequestMapping(value="/complain-management", method = RequestMethod.GET)
    public ModelAndView showAdminDashboardPage(ModelMap model){
        model.addAttribute("title", "Dashboard");
        model.addAttribute("menu", "Dashboard");
        return new ModelAndView("complain/complain-management");
    }
}
