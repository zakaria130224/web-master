package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogsController {
    @RequestMapping(value="/vts/maintenance-log", method = RequestMethod.GET)
    public ModelAndView showVtsMaintenanceLogView(ModelMap model){
        model.addAttribute("title", "maintenance");
        model.addAttribute("menu", "maintenance");
        return new ModelAndView("iot-devices/vts/logs/vts-maintenance-log");
    }
    @RequestMapping(value="/vts/fuel-log", method = RequestMethod.GET)
    public ModelAndView showVtsFuelLogView(ModelMap model){
        model.addAttribute("title", "maintenance");
        model.addAttribute("menu", "maintenance");
        return new ModelAndView("iot-devices/vts/logs/vts-fuel-log");
    }
}
