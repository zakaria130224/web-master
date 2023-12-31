<%@ page import="com.xyz.bd.webmaster.Models.UserManagement.DTOs.MenuTree" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: shafa
  Date: 6/16/2023
  Time: 3:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
    <%--<div class="sidebar">
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
                                &lt;%&ndash;                                                <%if (child2.getChild().size() == 0) {%>&ndash;%&gt;
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
                                &lt;%&ndash;                                                <%} %>&ndash;%&gt;


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
    </div>--%>

    <div class="sidebar">
        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                   with font-awesome or any other icon font library -->

                <li class="nav-item active-element">
                    <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                        <i class="nav-icon fa fa-tachometer"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/devices" class="nav-link">
                        <i class="nav-icon fa fa-cube"></i>
                        <p>IoT Devices</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/alarm" class="nav-link">
                        <i class="nav-icon far fa-bell"></i>
                        <p>Alarm</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/map" class="nav-link">
                        <i class="nav-icon fa fa-map"></i>
                        <p>Map</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/trips" class="nav-link">
                        <i class="nav-icon fa fa-car"></i>
                        <p>Trips</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/settings" class="nav-link">
                        <i class="nav-icon fa fa-gear"></i>
                        <p>Settings</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fa fa-clipboard"></i>
                        <p>
                            Reports
                            <i class="right fa fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/reports/report-engine-off" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Engine Off Report</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/reports/report-fuel-used" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Fuel Used Report</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/active_report" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Active Time Report</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/reports/report-idle-time" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Idle Time Report</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/reports/report-tips" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Trips Reports</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/billing" class="nav-link">
                        <i class="nav-icon fa fa-file-text"></i>
                        <p>Billing</p>
                    </a>
                </li>



                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/logs" class="nav-link">
                        <i class="nav-icon fa fa-list-alt"></i>
                        <p>Logs</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/support" class="nav-link">
                        <i class="nav-icon fa fa-phone-square"></i>
                        <p>Support</p>
                    </a>
                </li>

                <li class="nav-item">
                    <a href="${pageContext.request.contextPath}/logout" class="nav-link">
                        <i class="nav-icon fa fa-sign-out"></i>
                        <p>Logout</p>
                    </a>
                </li>

            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>

</aside>
