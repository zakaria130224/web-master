package com.xyz.bd.webmaster.Services.UserManagement;


import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOResetPassword;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.MenuTree;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUserPasswordHistory;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Models.common.ResponseModel.Response;
import com.xyz.bd.webmaster.Repositories.UserManagement.*;
import com.xyz.bd.webmaster.Repositories.specifier.CustomSpecifier;
import com.xyz.bd.webmaster.Utility.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class MenuService {
    private Logger logger = LoggerFactory.getLogger(MenuService.class);

    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private MenuDTRepository menuDTRepository;

    public DataTablesOutput<Menu> DTData(@Valid DataTablesInput input, HttpServletRequest request) {
        DataTablesOutput<Menu> output = new DataTablesOutput<>();
        try {
            output = menuDTRepository.findAll(input, new CustomSpecifier<Menu>().textInAllColumns(input.getSearch().getValue()));
            //output = menuDTRepository.findAll(input);

        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return output;
    }


    public List<MenuTree> getPermittedSideMenusByUserId(Long usrId) {
        List<Menu> menus = menuRepository.findAllPermittedSideMenuByUserId(usrId);
        List<MenuTree> parent = menus.stream().filter(x -> x.getParentId() == 0)
                .sorted(Comparator.comparing(Menu::getPriority))
                .map(p -> mapToMenuTree(p))
                .collect(Collectors.toList());
        //1st Child
        for (MenuTree item : parent) {
            Long id = item.getId();
//            List<MenuTree> menuTree = menus.stream().filter(x -> x.getParentId() == (long) id)
//                    .sorted(Comparator.comparing(Menu::getPriority))
//                    .map(p -> mapToMenuTree(p))
//                    .collect(Collectors.toList());
            item.setChild(menus.stream().filter(x -> x.getParentId() == (long) id)
                    .sorted(Comparator.comparing(Menu::getPriority))
                    .map(p -> mapToMenuTree(p))
                    .collect(Collectors.toList()));
        }
        //1st Child's Child
        for (MenuTree item : parent) {
            if (item.getChild() != null) {
                for (MenuTree child : item.getChild()) {
                    child.setChild(menus.stream().filter(x -> x.getParentId() == (long) child.getId())
                            .sorted(Comparator.comparing(Menu::getPriority))
                            .map(p -> mapToMenuTree(p))
                            .collect(Collectors.toList()));
                }
            }
        }
        return parent;
    }

    public List<Menu> getPermittedMenusByUserId(Long usrId) {
        return menuRepository.findAllMenuByUserId(usrId);
    }

    private MenuTree mapToMenuTree(Menu menus) {
        MenuTree menuTree = MenuTree.builder()
                .id(menus.getId())
                .name(menus.getName())
                .menuUrl(menus.getMenuUrl())
                .description(menus.getDescription())
                .iconClass(menus.getIconClass())
                .parent(menus.isParent())
                .parentId(menus.getParentId())
                .ajaxUrl(menus.isAjaxUrl())
                .hasLink(menus.isHasLink())
                .checkFullPath(menus.getCheckFullPath())
                .priority(menus.getPriority())
                .sidebarMenu(menus.isSidebarMenu())
                .api(menus.isApi())
                .active(menus.isActive())
                .build();
        return menuTree;


    }

//    @ModelAttribute
//    public void addAttributes(ModelMap model) {
//        model.addAttribute("success", "Your message in here!");
//    }
}
