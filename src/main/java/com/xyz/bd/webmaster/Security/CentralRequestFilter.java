package com.xyz.bd.webmaster.Security;


import com.xyz.bd.webmaster.AppLogger.Service.AuditLoggerService;
import com.xyz.bd.webmaster.Config.session.SessionConstants;
import com.xyz.bd.webmaster.Config.session.SessionManager;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.MenuTree;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import com.xyz.bd.webmaster.Services.UserManagement.MenuService;
import com.xyz.bd.webmaster.Utility.CachedBodyHttpServletRequest;
import com.xyz.bd.webmaster.Utility.Constant;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Component
public class CentralRequestFilter extends OncePerRequestFilter {

    final Logger logger = LoggerFactory.getLogger(this.getClass().getName());

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    //    @Autowired
//    private AuditLoggerService auditLoggerService;
    private final AuditLoggerService auditLoggerService;

    public CentralRequestFilter(AuditLoggerService auditLoggerService) {
        this.auditLoggerService = auditLoggerService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        try {
            boolean isUnAuthrized = false;
            //MDC Configuration
            String uuid = UUID.randomUUID().toString();
            MDC.put("loggerId", uuid);

            String uri = request.getRequestURI();
            logger.info("Request Uri: " + request.getRequestURI());
            Menu modelItemRedis = null;

            if (!Constant.isInDevelopment && !request.getRequestURI().equals("/accessDenied")) {
                try {
                    if (request.getRequestURI() != null && isSessionValid(request) && !request.getRequestURI().contains("/assets/")) {
                        modelItemRedis = getMenuItem(request);
                        if (!response.isCommitted() && modelItemRedis == null) {
                            //Will add unauth flag in table
                            isUnAuthrized = true;
                            auditLoggerService.preparedAuditItem(request, uuid);

//                            String redirectURL = request.getContextPath() + "/accessDenied";
//                            response.sendRedirect(redirectURL);
                            redirectStrategy.sendRedirect(request, response, "/accessDenied");
                            return;
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
//            CachedBodyHttpServletRequest cachedBodyHttpServletRequest =
//                    new CachedBodyHttpServletRequest(request);
//            ContentCachingResponseWrapper responseWrapper=new ContentCachingResponseWrapper(response);

            filterChain.doFilter(request, response);
            if (!isUnAuthrized)
                auditLoggerService.preparedAuditItem(request, uuid);

//            APP_LOGGER app_logger = preparedAuditItem(request, modelItemRedis);
//            if (app_logger != null) {
//                app_logger.setUNAUTHORIZED_ACCESS(0);
//                saveAuditItem(app_logger);
//            }

        } catch (Exception e) {
            e.printStackTrace();
            filterChain.doFilter(request, response);
        }
    }

    @Override
    protected boolean shouldNotFilter(HttpServletRequest request)
            throws ServletException {
        String path = request.getRequestURI();
        return path.contains("/assets/") || path.contains("favicon") || path.contains("/logout");
    }

    public boolean isSessionValid(HttpServletRequest request) {
        try {
            return request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) != null &&
                    ((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()));
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return false;
    }

    private Menu getMenuItem(HttpServletRequest request) {
        try {
            String requestURI = getRequestUri(request.getRequestURI());
            long userId = SessionManager.getUserID(request);
            if (userId < 0)
                return null;

            List<Menu> menuModelItemRedis = SessionManager.getPermittedMenuList(request);
            if (menuModelItemRedis.isEmpty())
                return null;
            else {
                for (Menu m : menuModelItemRedis) {
                    if (m.getMenuUrl().equalsIgnoreCase(requestURI) || m.getMenuUrl().equalsIgnoreCase(requestURI.replaceAll("/\\d+", "/#"))) {
                        return m;
                    }
                }
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String getRequestUri(String uri) {
        String requestURI = uri;
        if (requestURI.startsWith("/") && requestURI.length() > 1)
            requestURI = requestURI.substring(1);

        if (requestURI.startsWith("web-master/") && requestURI.length() > 8) {
            requestURI = requestURI.substring(8);
        } else if (requestURI.startsWith("web-master/")) {
            requestURI = requestURI.substring(7);
        }

        return requestURI;
    }


}
