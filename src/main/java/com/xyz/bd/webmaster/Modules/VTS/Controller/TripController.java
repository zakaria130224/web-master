package com.xyz.bd.webmaster.Modules.VTS.Controller;


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
    @RequestMapping(value="/vts/maintenance -log", method = RequestMethod.GET)
    public ModelAndView showVtsMaintenanceLogView(ModelMap model){
        model.addAttribute("title", "maintenance");
        model.addAttribute("menu", "maintenance");
        return new ModelAndView("iot-devices/vts/logs/vts-maintenance-log");
    }
}
