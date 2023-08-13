package com.xyz.bd.webmaster.Modules.VTS.Drivers;

import com.google.gson.Gson;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Services.UserManagement.AppUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DriversController {

    @Autowired
    DriverService driverService;

    @Autowired
    AppUserService appUserService;

    @RequestMapping(value="/vts/drivers-list", method = RequestMethod.GET)
    public ModelAndView showDriverListPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers List");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/drivers");
    }
    @RequestMapping(value="/vts/add-driver-info", method = RequestMethod.GET)
    public ModelAndView showAddDriverInfoFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-info");
    }
    @RequestMapping(value="/vts/add-driver-license", method = RequestMethod.GET)
    public ModelAndView showAddDriverlicenseFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-license");
    }

    @RequestMapping(value="/vts/add-driver-additional-info", method = RequestMethod.GET)
    public ModelAndView showAddDriverAdditionalInfoFormPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/drivers/add-driver-additional-info");
    }
    @RequestMapping(value = "/vts/driver/{id}", method = RequestMethod.GET)
    public ModelAndView showUpdateUserPage(ModelMap model, HttpServletRequest request, @PathVariable(name = "id") Long id){
        DriversModelEntity driversModelEntity = driverService.getDriverById(id);
        List<AppUser> appUser = appUserService.getAllUsersList();
        model.addAttribute("title", "VTS Drivers Update");
        model.addAttribute("menu", "VTS Drivers");
        model.addAttribute("driver_info", driversModelEntity);
        model.addAttribute("userList", appUser);
        return new ModelAndView("iot-devices/vts/drivers/update-driver");
    }
}
