package com.xyz.bd.webmaster.Controller.UserManagement;

import com.xyz.bd.webmaster.Models.UserManagement.DTOs.ReqResponsibility;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Responsibility;
import com.xyz.bd.webmaster.Models.common.ResponseModel.Response;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import com.xyz.bd.webmaster.Repositories.UserManagement.MenuRepository;
import com.xyz.bd.webmaster.Repositories.UserManagement.ResponsibilityRepository;
import com.xyz.bd.webmaster.Services.UserManagement.MenuService;
import com.xyz.bd.webmaster.Services.UserManagement.ResponsibilityService;
import com.xyz.bd.webmaster.Utility.Helper;
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
import java.util.List;

@RestController
@RequestMapping("/responsibility")
public class ResponsibilityController {

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private ResponsibilityService responsibilityService;

    @Autowired
    private ResponsibilityRepository responsibilityRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView indexPage(ModelMap model, HttpServletRequest request) {
        List<Menu> menuList = menuRepository.findAllByActiveTrue();
        model.addAttribute("menus", menuList);
        model.addAttribute("title", "User Management");
        return new ModelAndView("responsibility/index");
    }


    @PostMapping(value = "/save")
    public RedirectView save(ReqResponsibility req, ModelMap model, RedirectAttributes attributes, HttpServletRequest request) {
        ///TODO: Add User
        try {
            Response res = responsibilityService.saveNewResponsibility(req, request);
            attributes.addFlashAttribute(res.getResponseHeader().getResultCodeString(), res.getResponseHeader().getResultDesc());
        } catch (Exception ex) {
            attributes.addFlashAttribute("error", "Something went wrong!");
        }
        return new RedirectView("/responsibility", true);
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public ModelAndView updateLoad(@PathVariable Long id, ModelMap model, HttpServletRequest request) {
        ///TODO: Add User
        Responsibility responsibility = responsibilityRepository.findFirstById(id);
        model.addAttribute("menus", menuRepository.findAllByActiveTrue());
        model.addAttribute("info", responsibility);
        ModelAndView modelAndView = new ModelAndView("responsibility/update");
        return modelAndView;
    }

    @PostMapping(value = "/update")
    public RedirectView update(ReqResponsibility req, ModelMap model, RedirectAttributes attributes, HttpServletRequest request) throws Exception {

        try {
            Response res = responsibilityService.updateResponsibility(req, request);
            attributes.addFlashAttribute(res.getResponseHeader().getResultCodeString(), res.getResponseHeader().getResultDesc());
        } catch (Exception ex) {
            attributes.addFlashAttribute("error", "Something went wrong!");
        }
        return new RedirectView("/responsibility", true);
    }

    @RequestMapping(value = "/DtData", method = RequestMethod.GET)
    public DataTablesOutput<Responsibility> DTMenu(@Valid DataTablesInput input, HttpServletRequest request) {
        return responsibilityService.DTData(input, request);
    }

}
