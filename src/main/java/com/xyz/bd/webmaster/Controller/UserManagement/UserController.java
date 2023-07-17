package com.xyz.bd.webmaster.Controller.UserManagement;

import com.google.gson.Gson;
import com.xyz.bd.webmaster.Config.session.SessionConstants;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUser;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Models.common.ResponseModel.FailedResponse;
import com.xyz.bd.webmaster.Models.common.ResponseModel.Response;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import com.xyz.bd.webmaster.Repositories.UserManagement.ResponsibilityRepository;
import com.xyz.bd.webmaster.Services.UserManagement.AppUserService;
import com.xyz.bd.webmaster.Utility.Constant;
import com.xyz.bd.webmaster.Utility.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private AppUserService appUserService;

    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private ResponsibilityRepository responsibilityRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView indexPage(ModelMap model, HttpServletRequest request) {
        //new MenuViewer().setupSideMenu(model, request);
        model.addAttribute("responsibility", responsibilityRepository.findAllByActiveTrue());
        model.addAttribute("title", "Dashboard");
        return new ModelAndView("user/index");
    }


    @PostMapping(value = "/save")
    public Response save(@RequestParam("dtoUser") String data, HttpServletRequest request) {
        try {
            DTOUser dtoUser = new Gson().fromJson(data, DTOUser.class);
            return appUserService.saveNewUser(dtoUser, request);
        } catch (Exception ex) {
            return new Response(Constant.generalFailed, new FailedResponse(ex.getMessage()));
        }
    }

    @PostMapping(value = "/update")
    public Response updateUser(@RequestParam("dtoUser") String data, HttpServletRequest request) {
        try {
            DTOUser dtoUser = new Gson().fromJson(data, DTOUser.class);
            return appUserService.updateUser(dtoUser, request);
        } catch (Exception ex) {
            return new Response(Constant.generalFailed, new FailedResponse(ex.getMessage()));
        }
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public ModelAndView updateUserLoad(@PathVariable Long id, ModelMap model, HttpServletRequest request) {
        ///TODO: Add User
        model.addAttribute("user", appUserRepository.findFirstById(id));
        model.addAttribute("responsibility", appUserService.getResponsibilityByUserId(id));
        ModelAndView modelAndView = new ModelAndView("user/update");
        return modelAndView;
    }


    @RequestMapping(value = "/DtData", method = RequestMethod.GET)
    public DataTablesOutput<AppUser> DTMenu(@Valid DataTablesInput input, HttpServletRequest request) {
        return appUserService.DTData(input, request);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public AppUser get(@PathVariable Long id, HttpServletRequest request) {
        return appUserRepository.findFirstById(id);
    }


}
