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
}
