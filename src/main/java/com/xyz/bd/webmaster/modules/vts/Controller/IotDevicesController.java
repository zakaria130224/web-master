package com.xyz.bd.webmaster.modules.vts.Controller;


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

    @RequestMapping(value="/add_device", method = RequestMethod.GET)
    public ModelAndView showAddDevicePage(ModelMap model){
        model.addAttribute("title", "IoT Devices");
        model.addAttribute("menu", "IoT Devices");
        return new ModelAndView("iot-devices/add_device");
    }

//    @RequestMapping(value="/vts/map", method = RequestMethod.GET)
//    public ModelAndView showVtsMapPage(ModelMap model){
//        model.addAttribute("title", "IoT Devices");
//        model.addAttribute("menu", "IoT Devices");
//        return new ModelAndView("iot-devices/add_device");
//    }
}
