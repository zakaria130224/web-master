package com.xyz.bd.webmaster.Security;


import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUserSession;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.AppUser;
import com.xyz.bd.webmaster.Repositories.UserManagement.AppUserRepository;
import com.xyz.bd.webmaster.Services.UserManagement.MenuService;
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
//    @Autowired
//    private OtpHandlerService otpHandlerService;

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
                    .build();
            if (dtoUserSession != null) {
//                MDUserModel mdUserModel = usersList.get(0);
//                logger.info("Login User: " + authentication.getDetails().toString());
//                SessionManager.initSession(httpServletRequest, mdUserModel, new ArrayList<MenuModelItemRedis>());
//                CommonRestResponse commonRestResponse = otpHandlerService.sendFirstOtp(mdUserModel.getWORK_PHONE(), 1, httpServletRequest);
//                if (commonRestResponse.getCode() == 200) {
//                    redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, ConstantGlobal.DEFAULT_OTP);
//                } else {
//                    redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, ConstantGlobal.DEFAULT_OTP_ERROR);
//                }
                SessionManager.initSession(httpServletRequest, dtoUserSession, menuService.getPermittedSideMenusByUserId(appUser.getId()), menuService.getPermittedMenusByUserId(appUser.getId()));

                redirectStrategy.sendRedirect(httpServletRequest, httpServletResponse, "/home");
            }
        } catch (Exception e) {
            e.printStackTrace();
            logger.error("onAuthenticationSuccess Error");
            logger.error(e.getMessage(), e);
        }
    }
}
