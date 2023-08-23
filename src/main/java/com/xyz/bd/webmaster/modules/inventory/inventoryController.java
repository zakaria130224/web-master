package com.xyz.bd.webmaster.modules.inventory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/inventory")
public class inventoryController {
    @GetMapping("/management")
    public ModelAndView getProductList(Model model) {
        model.addAttribute("title", "Inventory");
        model.addAttribute("menu", "inventory");
        return new ModelAndView("inventory/inventory");
    }
}
