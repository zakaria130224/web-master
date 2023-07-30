package com.xyz.bd.webmaster.Modules.VTS.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RequisitionController {
    @RequestMapping(value="/vts/requisitions", method = RequestMethod.GET)
    public ModelAndView showVtsRequisitionView(ModelMap model){
        model.addAttribute("title", "Map View");
        model.addAttribute("menu", "VTS Trips");
        return new ModelAndView("iot-devices/vts/requisitions/requisitions");
    }
    @RequestMapping(value="/vts/add-requisition", method = RequestMethod.GET)
    public ModelAndView showVtsRequisitionAddView(ModelMap model){
        model.addAttribute("title", "Requisitions");
        model.addAttribute("menu", "requisitions");
        return new ModelAndView("iot-devices/vts/requisitions/add-requisitions");
    }
    @RequestMapping(value="/vts/edit-requisition", method = RequestMethod.GET)
    public ModelAndView showVtsRequisitionEditView(ModelMap model){
        model.addAttribute("title", "Requisitions");
        model.addAttribute("menu", "requisitions");
        return new ModelAndView("iot-devices/vts/requisitions/edit-requisitions");
    }
    @RequestMapping(value="/vts/requisition-details", method = RequestMethod.GET)
    public ModelAndView showVtsRequisitionDetailsView(ModelMap model){
        model.addAttribute("title", "Requisitions");
        model.addAttribute("menu", "requisitions");
        return new ModelAndView("iot-devices/vts/requisitions/requisition-details");
    }
}
