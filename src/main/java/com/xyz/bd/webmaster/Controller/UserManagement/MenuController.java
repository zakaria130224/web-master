package com.xyz.bd.webmaster.Controller.UserManagement;

import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUser;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.MenuTree;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import com.xyz.bd.webmaster.Repositories.UserManagement.MenuRepository;
import com.xyz.bd.webmaster.Services.UserManagement.MenuService;
import com.xyz.bd.webmaster.Utility.Constant;
import com.xyz.bd.webmaster.Utility.Helper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Constraint;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuRepository menuRepository;

    @Autowired
    private MenuService menuService;

    @Autowired
    private AppUserRepository appUserRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public ModelAndView indexPage(ModelMap model, HttpServletRequest request) {
        List<Menu> menuList = menuRepository.findAllByActiveTrue();
        model.addAttribute("menus", menuList);
        model.addAttribute("title", "User Management");
        return new ModelAndView("menu/index2");
    }


    @PostMapping(value = "/save")
    public RedirectView save(Menu req, ModelMap model, RedirectAttributes attributes, HttpServletRequest request) {
        ///TODO: Add User
        try {
            req.setCreatedBySession(request);
            menuRepository.save(req);
            attributes.addFlashAttribute("success", "Menu saved successfully!");
        } catch (Exception ex) {
            attributes.addFlashAttribute("error", "Menu not saved!");
        }
        return new RedirectView("/menu", true);
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
    public ModelAndView updateLoad(@PathVariable Long id, ModelMap model, HttpServletRequest request) {
        ///TODO: Add User
        model.addAttribute("menus", menuRepository.findAllByActiveTrue());
        model.addAttribute("info", menuRepository.findFirstById(id));
        ModelAndView modelAndView = new ModelAndView("menu/update");
        return modelAndView;
    }

    @PostMapping(value = "/update")
    public RedirectView update(Menu req, ModelMap model, RedirectAttributes attributes, HttpServletRequest request) throws Exception {
        ///TODO: create service to check duplicate and save
        req.setUpdatedBySession(request);
        req.setUpdatedAt(Helper.getCurrentDate());
        menuRepository.save(req);
        return new RedirectView("/menu", true);
    }

    @RequestMapping(value = "/DtData", method = RequestMethod.GET)
    public DataTablesOutput<Menu> DTMenu(@Valid DataTablesInput input, HttpServletRequest request) {
        return menuService.DTData(input, request);
    }


}
