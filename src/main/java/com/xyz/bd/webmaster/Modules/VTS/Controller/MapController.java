package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
    @RequestMapping(value = "/vts/map", method = RequestMethod.GET)
    public ModelAndView showMapPage(ModelMap model) {
        model.addAttribute("title", "Map");
        model.addAttribute("menu", "Map");
        return new ModelAndView("iot-devices/vts/map/map");

    }

    @RequestMapping(value = "/vts/map-selected", method = RequestMethod.GET)
    public ModelAndView showSelectedMapPage(ModelMap model) {
        model.addAttribute("title", "Map Selected");
        model.addAttribute("menu", "Map Selected");
        return new ModelAndView("iot-devices/vts/map/map-selected");

    }

    @RequestMapping(value = "/vts/map-vehicles-details", method = RequestMethod.GET)
    public ModelAndView showMapVehicleDetailsPage(ModelMap model) {
        model.addAttribute("title", "Map Vehicle Details");
        model.addAttribute("menu", "Map Vehicle Details");
        return new ModelAndView("iot-devices/vts/map/map-vehicles-details");

    }

    @RequestMapping(value = "/vts/map-vehicle-track", method = RequestMethod.GET)
    public ModelAndView showMapVehicleTrackPage(ModelMap model) {
        model.addAttribute("title", "Map Vehicle Track");
        model.addAttribute("menu", "Map Vehicle Track");
        return new ModelAndView("iot-devices/vts/map/map-vehicle-track");

    }
}
