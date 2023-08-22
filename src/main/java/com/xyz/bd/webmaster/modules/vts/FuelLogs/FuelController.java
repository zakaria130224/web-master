package com.xyz.bd.webmaster.modules.vts.FuelLogs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FuelController {
    @RequestMapping(value="/vts/fuel-log", method = RequestMethod.GET)
    public ModelAndView showVtsFuelLogView(ModelMap model){
        model.addAttribute("title", "maintenance");
        model.addAttribute("menu", "maintenance");
        return new ModelAndView("iot-devices/vts/logs/vts-fuel-log");
    }
}
