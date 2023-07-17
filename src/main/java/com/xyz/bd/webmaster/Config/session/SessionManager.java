package com.xyz.bd.webmaster.Config.session;

import com.xyz.bd.webmaster.Models.UserManagement.DTOs.DTOUserSession;
import com.xyz.bd.webmaster.Models.UserManagement.DTOs.MenuTree;
import com.xyz.bd.webmaster.Models.UserManagement.Entities.Menu;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class SessionManager {

    static Logger logger = LoggerFactory.getLogger("SessionManager");

    public static boolean isControllerInValid(HttpServletRequest request) {
        try {
            return request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) == null ||
                    !((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()));
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
        }
        return false;

    }

    public static int getUnAuthenticated(HttpServletRequest request) {
        if (request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) == null ||
                !((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()))) {
            return 1;
        } else return 0;
    }

    public static void initSession(HttpServletRequest request, DTOUserSession users, List<MenuTree> menuTrees, List<Menu> permittedMenusByUserId) {
        request.getSession().setAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name(), true);
        request.getSession().setAttribute(SessionConstants.SIDE_MENUS_XYZ.name(), menuTrees);
        request.getSession().setAttribute(SessionConstants.USER_DETAILS_XYZ.name(), users);
        request.getSession().setAttribute(SessionConstants.PERMITTED_MENUS_XYZ.name(), permittedMenusByUserId);
    }


    public static void initMenu(HttpServletRequest request, List<MenuTree> menuModelItemRedisList) {
        request.getSession().setAttribute(SessionConstants.SIDE_MENUS_XYZ.name(), menuModelItemRedisList);
    }

    public synchronized static List<MenuTree> getPermittedSideMenuList(HttpServletRequest request) {
        List<MenuTree> menuModelItemRedisList = new ArrayList<>();
        if (request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) != null && ((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()))
                && request.getSession().getAttribute(SessionConstants.SIDE_MENUS_XYZ.name()) != null) {
            try {
                menuModelItemRedisList = (List<MenuTree>) request.getSession().getAttribute(SessionConstants.SIDE_MENUS_XYZ.name());
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage(), e);
            }
        }
        return menuModelItemRedisList;
    }

    public synchronized static List<Menu> getPermittedMenuList(HttpServletRequest request) {
        List<Menu> menuModelItemRedisList = new ArrayList<>();
        if (request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) != null && ((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()))
                && request.getSession().getAttribute(SessionConstants.PERMITTED_MENUS_XYZ.name()) != null) {
            try {
                menuModelItemRedisList = (List<Menu>) request.getSession().getAttribute(SessionConstants.PERMITTED_MENUS_XYZ.name());
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage(), e);
            }
        }
        return menuModelItemRedisList;
    }

    public synchronized static DTOUserSession getUserDetails(HttpServletRequest request) {
        DTOUserSession mdUserModel = new DTOUserSession();
        if (request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()) != null && ((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN_XYZ.name()))
                && request.getSession().getAttribute(SessionConstants.USER_DETAILS_XYZ.name()) != null) {
            try {
                mdUserModel = (DTOUserSession) request.getSession().getAttribute(SessionConstants.USER_DETAILS_XYZ.name());
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage(), e);
            }
        }
        return mdUserModel;
    }

//    public static Map<String, Object> getAllData(HttpServletRequest request) {
//        Map<String, Object> data = new HashMap<>();
//        if (request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN.name()) != null && ((Boolean) request.getSession().getAttribute(SessionConstants.IS_LOGGED_IN.name()))) {
//            data.put(SessionConstants.ID.name(), request.getSession().getAttribute(SessionConstants.ID.name()));
//            data.put(SessionConstants.USER_GROUP_ID.name(), request.getSession().getAttribute(SessionConstants.USER_GROUP_ID.name()));
//            data.put(SessionConstants.NAME.name(), request.getSession().getAttribute(SessionConstants.NAME.name()));
//            data.put(SessionConstants.EMAIL.name(), request.getSession().getAttribute(SessionConstants.EMAIL.name()));
//            data.put(SessionConstants.LOGIN_NAME.name(), request.getSession().getAttribute(SessionConstants.LOGIN_NAME.name()));
//            data.put(SessionConstants.ACTIVE.name(), request.getSession().getAttribute(SessionConstants.ACTIVE.name()));
//            return data;
//        } else {
//            return null;
//        }
//    }

    public synchronized static long getUserID(HttpServletRequest request) {
        DTOUserSession mdUserModel = getUserDetails(request);
        if (mdUserModel.getId() != null) {
            return mdUserModel.getId();
        } else {
            return -1;
        }
    }

    public synchronized static String getUserLoginName(HttpServletRequest request) {
        DTOUserSession mdUserModel = getUserDetails(request);
        if (mdUserModel.getLoginName() != null) {
            return mdUserModel.getLoginName();
        } else {
            return "";
        }
    }

    public static void logoutUser(HttpServletRequest request) {
        try {
            request.getSession().invalidate();
            request.logout();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static synchronized void saveAttribute(String key, Object value, HttpServletRequest request) {
        request.getSession().setAttribute(key, value);
    }

    public static synchronized Object getAttribute(String key, HttpServletRequest request) {
        if (request.getSession().getAttribute(key) != null) {
            try {
                return request.getSession().getAttribute(key);
            } catch (Exception e) {
                e.printStackTrace();
                logger.error(e.getMessage(), e);
            }
        }
        return null;
    }
}