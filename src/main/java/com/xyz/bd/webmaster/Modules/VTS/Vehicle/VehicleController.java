package com.xyz.bd.webmaster.Modules.VTS.Vehicle;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class VehicleController {
    @RequestMapping(value="/vts/vehicle-list", method = RequestMethod.GET)
    public ModelAndView showVehicleListPage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/vehicles");
    }

    @RequestMapping(value="/vts/add-vehicle-type", method = RequestMethod.GET)
    public ModelAndView showAddVehicleTypePage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/add-vehicle-type");
    }

    @RequestMapping(value="/vts/add-vehicle-info", method = RequestMethod.GET)
    public ModelAndView showAddVehicleInfoPage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/add-vehicle-info");
    }

    @RequestMapping(value="/vts/add-vehicle-purchase-info", method = RequestMethod.GET)
    public ModelAndView showAddVehiclePurchaseInfoPage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/add-vehicle-purchase-info");
    }

    @RequestMapping(value="/vts/add-ownership-info", method = RequestMethod.GET)
    public ModelAndView showAddOwnershipTypePage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/add-ownership-info");
    }

    @RequestMapping(value="/vts/add-linked-device", method = RequestMethod.GET)
    public ModelAndView showAddLinkedDevicePage(ModelMap model){
        model.addAttribute("title", "VTS Vehicle List");
        model.addAttribute("menu", "VTS Vehicles");
        return new ModelAndView("iot-devices/vts/vehicle/add-linked-device");
    }
}
