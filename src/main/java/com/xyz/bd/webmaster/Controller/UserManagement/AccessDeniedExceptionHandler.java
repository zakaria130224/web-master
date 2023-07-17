package com.xyz.bd.webmaster.Controller.UserManagement;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccessDeniedExceptionHandler {

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String showAccessDeniedView(ModelMap modelMap) {
        modelMap.put("pageTitle", "Access Denied");
        modelMap.put("exceptionMessage", "You don't have permission to visit the page. Try re-login or contact with Administrator.");
        return "exception";
    }
}
