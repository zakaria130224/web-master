package com.xyz.bd.webmaster.modules.vts.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TripController {
    @RequestMapping(value="/vts/trip-list", method = RequestMethod.GET)
    public ModelAndView showDashboardWelcomePage(ModelMap model){
        model.addAttribute("title", "VTS Trip List");
        model.addAttribute("menu", "VTS Trips");
        return new ModelAndView("iot-devices/vts/trips/vts-trip-list");
    }

    @RequestMapping(value="/vts/trip-map-view", method = RequestMethod.GET)
    public ModelAndView showVtsTripMapView(ModelMap model){
        model.addAttribute("title", "Map View");
        model.addAttribute("menu", "VTS Trips");
        return new ModelAndView("iot-devices/vts/trips/vts-trip-map-view");
    }

    @RequestMapping(value="/vts/trip-details", method = RequestMethod.GET)
    public ModelAndView showVtsTripDetailsView(ModelMap model){
        model.addAttribute("title", "Map View");
        model.addAttribute("menu", "VTS Trips");
        return new ModelAndView("iot-devices/vts/trips/vts-trip-details");
    }
    @RequestMapping(value="/vts/alert", method = RequestMethod.GET)
    public ModelAndView showVtsAlertView(ModelMap model){
        model.addAttribute("title", "Map View");
        model.addAttribute("menu", "VTS Trips");
        return new ModelAndView("iot-devices/vts/alerts/alerts");
    }




}
