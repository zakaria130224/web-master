package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DriversController {
    @RequestMapping(value="/vts/drivers-list", method = RequestMethod.GET)
    public ModelAndView showDriverListPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers List");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/drivers");
    }
    @RequestMapping(value="/vts/add-driver-info", method = RequestMethod.GET)
    public ModelAndView showAddDriverInfoFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-info");
    }
    @RequestMapping(value="/vts/add-driver-license", method = RequestMethod.GET)
    public ModelAndView showAddDriverlicenseFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-license");
    }

    @RequestMapping(value="/vts/add-driver-additional-info", method = RequestMethod.GET)
    public ModelAndView showAddDriverAdditionalInfoFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-additional-info");
    }
}
