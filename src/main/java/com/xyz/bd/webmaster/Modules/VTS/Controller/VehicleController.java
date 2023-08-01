package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VehicleController {
    @RequestMapping(value="/vts/vehicle-list", method = RequestMethod.GET)
    public ModelAndView showDashboardWelcomePage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/vehicles");
    }
}
