package com.xyz.bd.webmaster.security;


import com.xyz.bd.webmaster.config.session.SessionManager;
import com.xyz.bd.webmaster.models.UserManagement.DTOs.DTOUserSession;
import com.xyz.bd.webmaster.models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.repositories.UserManagement.AppUserRepository;
import com.xyz.bd.webmaster.services.UserManagement.MenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
@Transactional
public class LoginHandler implements AuthenticationSuccessHandler {

    private final Logger logger = LoggerFactory.getLogger(LoginHandler.class);

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private MenuService menuService;


    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {

        try {
            logger.info("onAuthenticationSuccess");
            AppUser appUser = appUserRepository.findFirstByLoginName(authentication.getName());
            DTOUserSession dtoUserSession = DTOUserSession.builder()
                    .id(appUser.getId())
                    .name(appUser.getName())
                    .loginName(appUser.getLoginName())
                    .email(appUser.getEmail())
                    .phone(appUser.getPhone())
                    .active(appUser.isActive())
                    .userType(appUser.getUserType())
                    .isSystemAdmin(appUser.isSystemAdmin())
                    .isB2bAdmin(appUser.isB2bAdmin())
                    .isB2cAdmin(appUser.isB2cAdmin())
                    .build();
            if (dtoUserSession != null) {
                SessionManager.initSession(httpServletRequest, dtoUserSession, menuService.getPermittedSideMenusByUserId(appUser.getId()), menuService.getPermittedMenusByUserId(appUser.getId()));

                redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "/dashboard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("onAuthenticationSuccess Error");
            logger.error(e.getMessage(), e);
        }
    }
}
