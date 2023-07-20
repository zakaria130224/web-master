package com.xyz.bd.webmaster.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IotDevicesController {
    @RequestMapping(value="/devices", method = RequestMethod.GET)
    public ModelAndView showDashboardPage(ModelMap model){
        model.addAttribute("title", "IoT Devices");
        model.addAttribute("menu", "IoT Devices");
        return new ModelAndView("iot-devices/devices");
    }
}
