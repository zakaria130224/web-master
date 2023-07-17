package com.xyz.bd.webmaster.Security;

import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    //@Autowired
    //LDAPService ldapService;

    private final Logger logger = LoggerFactory.getLogger(CustomAuthenticationFailureHandler.class);

    @Autowired
    private AppUserRepository appUserRepository;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request,
                                        HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {
        String errorMessage = "";
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (username.trim().isEmpty() || password.trim().isEmpty()) {
                errorMessage = "Credentials can't be empty!";
                response.sendRedirect(request.getContextPath() + "/login?error=" + errorMessage);
            }

            String domainUser = "";

            if (!username.contains("@") && !username.contains(".com"))
                domainUser = username + "@xyz.com.bd";
            else domainUser = username;

            //TODO: LDAP
            //String ldapAuthStatus = ldapService.getLDAPAuthStatusWithError(domainUser, password);
            //if (!ldapAuthStatus.equals("0")) {
            //    errorMessage = ldapAuthStatus;
            //    response.sendRedirect(request.getContextPath() + "/login?error=" + errorMessage);
            //} else {
            int emailIndex = domainUser.indexOf("@");
            String loginName = domainUser.substring(0, emailIndex).toUpperCase();
            AppUser appUser = appUserRepository.findFirstByLoginName(loginName);
            if (appUser != null) {
                errorMessage = "Something wrong. Please try again!";
                response.sendRedirect(request.getContextPath() + "/login?error=" + errorMessage);
            } else {
                errorMessage = "User not found. Please contact with Administrator.";
                response.sendRedirect(request.getContextPath() + "/login?error=" + errorMessage);
            }
            //}
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            errorMessage = "Error occurred. Please try later!";
            response.sendRedirect(request.getContextPath() + "/login?error=" + errorMessage);
        }
    }
}