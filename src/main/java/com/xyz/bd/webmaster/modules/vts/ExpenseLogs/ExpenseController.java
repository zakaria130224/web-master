package com.xyz.bd.webmaster.modules.vts.ExpenseLogs;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExpenseController {
    @RequestMapping(value="/vts/expense-list", method = RequestMethod.GET)
    public ModelAndView showExpenseListPage(ModelMap model){
        model.addAttribute("title", "VTS Drivers List");
        model.addAttribute("menu", "VTS Drivers");
        return new ModelAndView("iot-devices/vts/expense/expense-list");
    }
}
