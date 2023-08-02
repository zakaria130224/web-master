package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PapersController {
    @RequestMapping(value="/vts/papers", method = RequestMethod.GET)
    public ModelAndView showVtsGeoFencePapersView(ModelMap model){
        model.addAttribute("title", "Requisitions");
        model.addAttribute("menu", "requisitions");
        return new ModelAndView("iot-devices/vts/geo-fence/papers");
    }
    @RequestMapping(value="/vts/papers-details", method = RequestMethod.GET)
    public ModelAndView showVtsGeoFencePapersDetailsView(ModelMap model){
        model.addAttribute("title", "Requisitions");
        model.addAttribute("menu", "requisitions");
        return new ModelAndView("iot-devices/vts/geo-fence/papers-details");
    }
}
