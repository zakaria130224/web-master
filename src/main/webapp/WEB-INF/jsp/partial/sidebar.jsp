<%@ page import="com.xyz.bd.webmaster.models.UserManagement.Entities.Menu" %>
<%@ page import="com.xyz.bd.webmaster.models.UserManagement.DTOs.MenuTree" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<MenuTree> navTree = (List<MenuTree>) request.getAttribute("sideMenu");


%>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4" style="position: fixed">
    <!-- Brand Logo -->
    <a href="#" class="brand-link logo-switch">
        <img src="${pageContext.request.contextPath}/assets/v2/dist/img/mini-white-logo.svg"
             alt="Grameenphone" class="brand-image-xl logo-xs">
        <img src="${pageContext.request.contextPath}/assets/v2/dist/img/logo-white.svg" alt="Grameenphone"
             class="brand-image-xs logo-xl" style="left: 12px">
    </a>


    <hr>
    <!-- Vertical Nav -->
    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu"
                data-accordion="false">

                <%if (navTree.size() > 0) {%>
                <% for (MenuTree item : navTree) {%>
                <%if (item.getChild().size() == 0) {%>
                <%if (item.isHasLink()) {%>

                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/<%=item.getMenuUrl()%>">
                        <i class="nav-icon  <%=item.getIconClass()%>"></i>
                        <p class="nav-link-text"><%=item.getName()%>
                        </p>
                    </a>
                </li>
                <%} else { %>
                <li class="nav-item">
                    <a class="nav-link" href="#">
                        <i class="nav-icon  <%=item.getIconClass()%>"></i>
                        <p class="nav-link-text"><%=item.getName()%>
                        </p>
                    </a>
                </li>
                <%} %>
                <%} %>

                <%if (item.getChild().size() > 0) {%>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon <%=item.getIconClass()%>"></i>
                        <p>
                            <%=item.getName()%>
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <% for (MenuTree child1 : item.getChild()) {%>
                        <%if (child1.getChild().size() == 0) {%>
                        <%if (child1.isHasLink()) {%>
                        <li class="nav-item">
                            <a class="nav-link"
                               href="${pageContext.request.contextPath}/<%=child1.getMenuUrl()%>">
                                <i class="nav-icon  <%=child1.getIconClass()%>"></i>
                                <p class="nav-link-text"><%=child1.getName()%>
                                </p>
                            </a>
                        </li>
                        <%} else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class=nav-icon "<%=child1.getIconClass()%>"></i>
                                <p class="nav-link-text"><%=child1.getName()%>
                                </p>
                            </a>
                        </li>
                        <%} %>
                        <%} %>
                        <!--2nd Child-->
                        <%if (child1.getChild().size() > 0) {%>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                <i class="nav-icon <%=child1.getIconClass()%>"></i>
                                <p>
                                    <%=child1.getName()%>
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <% for (MenuTree child2 : child1.getChild()) {%>
                                <%--                                                <%if (child2.getChild().size() == 0) {%>--%>
                                <%if (child2.isHasLink()) {%>
                                <li class="nav-item">
                                    <a class="nav-link"
                                       href="${pageContext.request.contextPath}/<%=child2.getMenuUrl()%>">
                                        <i class="nav-icon <%=child2.getIconClass()%>"></i>
                                        <p class="nav-link-text"><%=child2.getName()%>
                                        </p>
                                    </a>
                                </li>
                                <%} else { %>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        <i class="nav-icon <%=child2.getIconClass()%>"></i>
                                        <p class="nav-link-text"><%=child2.getName()%>
                                        </p>
                                    </a>
                                </li>
                                <%} %>
                                <%--                                                <%} %>--%>


                                <%} %>


                                <%}%>

                                <%} %>

                            </ul>
                        </li>
                    </ul>
                </li>
                <%}%>


                <%} %>
                <%}%>
            </ul>
        </nav>
    </div>

</aside>
