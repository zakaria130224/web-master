package com.xyz.bd.webmaster.Controller;

import com.xyz.bd.webmaster.Config.session.SessionManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage(ModelMap model, @RequestParam(value = "error", required = false) String error, String logout, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        if (error != null && !error.isEmpty()) {
            //logger.info("Error message: " + error);
            model.addAttribute("error", error);
        }
        if (logout != null) {
            model.addAttribute("success", "Successfully Logged Out");
        }


        model.put("errorMessage", error);
        model.put("title", "Login");
        return "login";
    }

    @RequestMapping(value = "/loginFailed", method = RequestMethod.POST)
    public String showLoginPagePost(ModelMap model, HttpServletRequest request, RedirectAttributes redirectAttributes) {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String error = loginControllerService.logAndGetLoginFailedReason(username, password, request);
//        if (error != null && !error.isEmpty()) {
//            if (error.equalsIgnoreCase("Expired")) {
//                redirectAttributes.addFlashAttribute("error", "Password has been expired. Please change to proceed");
//                return "redirect:/external/changePassword";
//            }
//            model.addAttribute("error", error);
//        }

        model.put("errorMessage", "65565");
        model.put("title", "Login");
        model.addAttribute("error", "Custom error");
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        if (SessionManager.isControllerInValid(request)) {
            return "redirect:/login";
        } else {
            SessionManager.logoutUser(request);
            return "redirect:/login";
        }
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String showHomePage(ModelMap model, HttpServletRequest request) {
        //new MenuViewer().setupSideMenu(model, request);
        model.addAttribute("title", "Dashboard");

        return "home";
    }


}
