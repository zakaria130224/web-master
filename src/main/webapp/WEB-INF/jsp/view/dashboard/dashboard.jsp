<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 5/22/2023
  Time: 5:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<spring:eval expression="@environment.getProperty('app.name')" var="appName"/>
<spring:eval expression="@environment.getProperty('app.domain_url')" var="domain_url"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dashboard</title>

    <jsp:include page="./../../partial_new/header-link.jsp"></jsp:include>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="./../../partial_new/nevbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->

    <jsp:include page="./../../partial_new/aside.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row py-2 mb-1 " style="background-color: white; border-radius: 8px; margin: 1px">
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">General</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">VTS</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">OBD</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Product2</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">

            </div>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">

                <%--Grid block countdown--%>
                <div class="row">
                    <div type="submit" class="col-12 col-md-4 col-lg-2" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-4.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Total Vehicles</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2" type="submit" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-5.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Small Text</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2" type="submit" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-6.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Engine Off</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2" type="submit" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-7.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Idle</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2" type="submit" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Unplugged</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2" type="submit" data-toggle="modal" data-target="#exampleModal">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="float-left mr-3">
                                        <img class="b2b-icon-png" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-9.png">
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Unreachable</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- /.col -->
                </div>

                <%--row block 1--%>
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Distance Travelled (KM) Vs Estimated Fuel Used (L)</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>All Vehicles</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>Last 7 Days</option>
                                                <option>Last 30 Days</option>
                                                <option>Last 6 Month</option>
                                                <option>Last 1 Year</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mb-2">
                                        <canvas id="barChart"></canvas>
                                    </div>

                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="row">
                                            <div class="col-md-3 text-color-gray">
                                                <h6><span class="small-indicator color-blue"></span> Distance Travelled</h6>
                                            </div>
                                            <div class="col-md-3 text-color-gray">
                                                <h6><span class="small-indicator color-hue"></span> Estimated Fuel Used</h6>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mt-1 mb-1">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <h6>Travelled Today</h6>
                                                <h3 class="font-24">65.78 <span class="small-text">km</span></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>Last 7 Days</h6>
                                                <h3 class="font-24">65.78 <span class="small-text">km</span></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>July</h6>
                                                <h3 class="font-24">7041.78 <span class="small-text">km</span></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>June</h6>
                                                <h3 class="font-24">8965.78 <span class="small-text">km</span></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>May</h6>
                                                <h3 class="font-24">6785.45 <span class="small-text">km</span></h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>April</h6>
                                                <h3 class="font-24">6785.45 <span class="small-text">km</span></h3>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4 col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Height Distance Covered (km)</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="col-sm-12 mb-2 mt-2 pl-0">
                                    <!-- select -->
                                    <div class="form-group">
                                        <select class="form-control bg-dropdown select2">
                                            <option>Last 7 Days</option>
                                            <option>Last 30 Days</option>
                                            <option>Last 6 Month</option>
                                            <option>Last 1 Year</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--row block 2--%>
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">VTS Alert</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>All Vehicles</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>Last 7 Days</option>
                                                <option>Last 30 Days</option>
                                                <option>Last 6 Month</option>
                                                <option>Last 1 Year</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-12 mb-4">
                                        <canvas id="myChart"></canvas>
                                    </div>


                                    <div class="col-md-12 mt-1 mb-1">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <h6>Alarm Today</h6>
                                                <h3>4</h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>Last 7 Days</h6>
                                                <h3>5</h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>July</h6>
                                                <h3>7</h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>June</h6>
                                                <h3>24</h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>May</h6>
                                                <h3>34</h3>
                                            </div>
                                            <div class="col-md-2">
                                                <h6>April</h6>
                                                <h3>45</h3>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4 col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Height Distance Covered (km)</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="col-sm-12 mb-2 mt-2 pl-0">
                                    <!-- select -->
                                    <div class="form-group">
                                        <select class="form-control bg-dropdown select2">
                                            <option>Last 7 Days</option>
                                            <option>Last 30 Days</option>
                                            <option>Last 6 Month</option>
                                            <option>Last 1 Year</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-2">
                                    <div class="col-lg-9 col-md-9 pl-2">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 km travelled</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                        <div class="align-items-center justify-content-center">
                                            <h3 class="b2b-grid-number-large">24</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--row block 3--%>
                <div class="row">
                    <div class="col-md-5 col-lg-5 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Driving Score</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>All Vehicles</option>
                                                <option>Personal Vehicles</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>Last 7 Days</option>
                                                <option>Last 30 Days</option>
                                                <option>Last 6 Month</option>
                                                <option>Last 1 Year</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-12 mt-1 mb-1">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <h6>Trips</h6>
                                                <h3>4</h3>
                                            </div>
                                            <div class="col-md-4">
                                                <h6>Time</h6>
                                                <h3>5d 6h 5m</h3>
                                            </div>
                                            <div class="col-md-5">
                                                <h6>Distance</h6>
                                                <h3>134.87 km</h3>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12 mt-4 mb-1">
                                                <p class="font-18" style="color: #B5B5C3">Score</p>
                                            </div>
                                        </div>

                                        <%--Start driving score circle partition--%>
                                        <div class="row align-items-center">
                                            <div class="col-lg-4 col-md-5 col-6">
                                                <input type="text" class="knob" value="80" data-thickness="0.2" data-width="120" data-height="120"
                                                       data-fgColor="#47BE7D">
                                            </div>

                                            <div class="col-lg-8 col-md-7 col-6 mt-4">
                                                <div class="d-flex flex-column">
                                                    <div class="d-flex justify-content-between gap-3 gap-sm-1 b2b-mb-12">
                                                        <div class="d-flex align-items-center">
                                                            <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                            <div class="block-12 b2b-bg-green mr-2" style=""></div>
                                                            <span class="pl-2 font-size-16" style="color: #B5B5C3">Safe</span>
                                                        </div>
                                                        <div>>60</div>
                                                    </div>

                                                    <div class="d-flex justify-content-between gap-3 gap-sm-1 b2b-mb-12">
                                                        <div class="d-flex align-items-center">
                                                            <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                                <div class="block-12 b2b-bg-yellow mr-2" style=""></div>
                                                                <span class="pl-2 font-size-16" style="color: #B5B5C3">Risky</span>
                                                        </div>
                                                        <div>50 ~ 60</div>
                                                    </div>

                                                    <div class="d-flex justify-content-between gap-3 gap-sm-1 b2b-mb-12">
                                                        <div class="d-flex align-items-center">
                                                            <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                                <div class="block-12 b2b-bg-red mr-2" style=""></div>
                                                            <span class="pl-2 font-size-16" style="color: #B5B5C3">Dangerous</span>
                                                        </div>
                                                        <div><50</div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%--End driving score circle partition--%>

                                        <div class="row">
                                            <div class="col-md-12 mt-1 mb-1 mt-5">
                                                <a href="#scoring_criteria" class="mr-5 b2b-icon-link float-left">
                                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                                     Scoring Criteria</a>
                                                <a href="#scoring_criteria" class="b2b-icon-link">
                                                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                                                     Scoring Settings</a>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-7 col-lg-7 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Drivers Info</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="row">
                                    <div class="col-12">

                                        <div class="row mb-3 mt-3">
                                            <div class="col-md-4">
                                                <div class="float-left mr-3">
                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-1.png">
                                                </div>
                                                <div>
                                                    <h4 class="font-18">Total Drivers</h4>
                                                    <h3 class="b2b-font-20-500 black-20">6</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="float-left mr-3">
                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-2.png">
                                                </div>
                                                <div>
                                                    <h4 class="font-18">On Trip</h4>
                                                    <h3 class="b2b-font-20-500 black-20">4</h3>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="float-left mr-3">
                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/icon-3.png">
                                                </div>
                                                <div>
                                                    <h4 class="font-18">Offline</h4>
                                                    <h3 class="b2b-font-20-500 black-20">2</h3>
                                                </div>
                                            </div>

                                        </div>

                                        <div class="row">
                                            <div class="col-sm-6">
                                                <!-- select -->
                                                <div class="form-group">
                                                    <select class="form-control bg-dropdown select2">
                                                        <option>All Vehicles</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-sm-6">
                                                <!-- select -->
                                                <div class="form-group">
                                                    <select class="form-control bg-dropdown select2">
                                                        <option>Last 7 Days</option>
                                                        <option>Last 30 Days</option>
                                                        <option>Last 6 Month</option>
                                                        <option>Last 1 Year</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="row mt-2">
                                            <div class="col-md-4 col-lg-4 text-center">
                                                <h6 class="black-10 font-size-16 mb-3 black-60">Estimated Fuel Used</h6>
                                                <input type="text" class="knob b2b-knob-text" data-thickness="0.3" data-anglearc="250"
                                                       data-angleoffset="-125" value="20" data-width="168" data-height="84" data-fgcolor="#00c0ef"
                                                       style="
                              width: 64px;
                              height: 40px;
                              position: absolute;
                              vertical-align: middle;
                              margin-top: 40px;
                              margin-left: -92px;
                              border: 0px;
                              background: none;
                              font: bold 24px Arial;
                              text-align: center;
                              color: rgb(0, 192, 239);
                              padding: 0px;
                              appearance: none;
                            " />
                                                <p class="black-60 mt-2">Target 200.0</p>
                                            </div>
                                            <div class="col-md-4 col-lg-4 text-center">
                                                <h6 class="black-10 font-size-16 mb-3 black-60">Excessive Idling</h6>
                                                <input type="text" class="knob b2b-knob-text" data-thickness="0.3" data-anglearc="250"
                                                       data-angleoffset="-125" value="54.5" data-width="168" data-height="84" data-fgcolor="#00c0ef"
                                                       style="
                              width: 64px;
                              height: 40px;
                              position: absolute;
                              vertical-align: middle;
                              margin-top: 40px;
                              margin-left: -92px;
                              border: 0px;
                              background: none;
                              font: bold 24px Arial;
                              text-align: center;
                              color: rgb(0, 192, 239);
                              padding: 0px;
                              appearance: none;
                            " />
                                                <p class="black-60 mt-2">Target 200.0</p>
                                            </div>
                                            <div class="col-md-4 col-lg-4 text-center">
                                                <h6 class="black-10 font-size-16 mb-3 black-60">Driving Behavior</h6>
                                                <input type="text" class="knob b2b-knob-text" data-thickness="0.3" data-anglearc="250"
                                                       data-angleoffset="-125" value="85" data-width="168" data-height="84" data-fgcolor="#00c0ef"
                                                       style="
                              width: 64px;
                              height: 40px;
                              position: absolute;
                              vertical-align: middle;
                              margin-top: 40px;
                              margin-left: -92px;
                              border: 0px;
                              background: none;
                              font: bold 24px Arial;
                              text-align: center;
                              color: rgb(0, 192, 239);
                              padding: 0px;
                              appearance: none;
                            " />
                                                <p class="black-60 mt-2">Target 200.0</p>
                                            </div>
                                        </div>

                                        <div class="row mt-3">
                                            <div class="col-md-12 text-center">
                                                <a class="b2b-icon-link" href="#target_settings">
                                                    <i class="fa fa-gear"></i> Target Settings
                                                </a>
                                            </div>
                                        </div>


                                        <div class="row mt-3">
                                            <div class="col-md-12 mt-3 mb-1">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <h6 class="black-20 font-size-14">Harsh Acceleration</h6>
                                                        <h3>0</h3>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <h6 class="black-20 font-size-14">Over Speeding</h6>
                                                        <h3>5</h3>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <h6 class="black-20 font-size-14">Harsh Brake</h6>
                                                        <h3>7</h3>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <h6 class="black-20 font-size-14">Sharp Turn</h6>
                                                        <h3>2</h3>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <h6 class="black-20 font-size-14">Collision</h6>
                                                        <h3>1</h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                    </div>


                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <jsp:include page="./../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header h-75p">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>9 Results Found</p>
                <div class="table-responsive">
                    <table class="table">
                        <thead class="b2b-custom-boder">
                            <th>Vehicle</th>
                            <th>Driver</th>
                            <th>Alarms</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="w-100">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-panel d-flex">
                                        <div class="image float-left">
                                            <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                 class="img-circle" alt="User Image"/>
                                        </div>
                                        <div class="info">
                                            <p class="black-30 font-size-16 m-0">John Doe</p>
                                            <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                            <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                        </div>
                                    </div>
                                </td>
                                <td><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="w-100">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-panel d-flex">
                                        <div class="image float-left">
                                            <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                 class="img-circle" alt="User Image"/>
                                        </div>
                                        <div class="info">
                                            <p class="black-30 font-size-16 m-0">John Doe</p>
                                            <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                            <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                        </div>
                                    </div>
                                </td>
                                <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="w-100">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-panel d-flex">
                                        <div class="image float-left">
                                            <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                 class="img-circle" alt="User Image"/>
                                        </div>
                                        <div class="info">
                                            <p class="black-30 font-size-16 m-0">John Doe</p>
                                            <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                            <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                        </div>
                                    </div>
                                </td>
                                <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="w-100">
                                        <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                        <div class="b2b-list-block">
                                            <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                            <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <div class="user-panel d-flex">
                                        <div class="image float-left">
                                            <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                 class="img-circle" alt="User Image"/>
                                        </div>
                                        <div class="info">
                                            <p class="black-30 font-size-16 m-0">John Doe</p>
                                            <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                            <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                        </div>
                                    </div>
                                </td>
                                <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer h-75p">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- ./wrapper -->

<jsp:include page="./../../partial_new/script.jsp" />

<script>
    $( document ).ready(function() {
        $(".select2").select2();
    });

    document.addEventListener("DOMContentLoaded", function () {
        var ctx = document.getElementById("myChart").getContext("2d");
        var myChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: [
                    "Apr 22",
                    "Apr 23",
                    "Apr 24",
                    "Apr 25",
                    "Apr 26",
                    "Apr 27",
                    "Apr 28",
                ],
                datasets: [
                    {
                        label: "Dataset 1",
                        data: [4.5, 5.2, 3.3, 4.7, 6, 5.4, 4.2],
                        backgroundColor: "#D9214E",
                        barThickness: 40,
                    },
                ],
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false,
                        position: "top",
                    },
                    title: {
                        display: false,
                        text: "Chart.js Bar Chart",
                    },
                },
            },
        });
    });
</script>

<script>
    $(function () {
        /* jQueryKnob */

        $(".knob").knob({
            /*change : function (value) {
         //console.log("change : " + value);
         },
         release : function (value) {
         console.log("release : " + value);
         },
         cancel : function () {
         console.log("cancel : " + this.value);
         },*/
            draw: function () {
                // "tron" case
                if (this.$.data("skin") == "tron") {
                    var a = this.angle(this.cv), // Angle
                        sa = this.startAngle, // Previous start angle
                        sat = this.startAngle, // Start angle
                        ea, // Previous end angle
                        eat = sat + a, // End angle
                        r = true;

                    this.g.lineWidth = this.lineWidth;

                    this.o.cursor && (sat = eat - 0.3) && (eat = eat + 0.3);

                    if (this.o.displayPrevious) {
                        ea = this.startAngle + this.angle(this.value);
                        this.o.cursor && (sa = ea - 0.3) && (ea = ea + 0.3);
                        this.g.beginPath();
                        this.g.strokeStyle = this.previousColor;
                        this.g.arc(
                            this.xy,
                            this.xy,
                            this.radius - this.lineWidth,
                            sa,
                            ea,
                            false
                        );
                        this.g.stroke();
                    }

                    this.g.beginPath();
                    this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
                    this.g.arc(
                        this.xy,
                        this.xy,
                        this.radius - this.lineWidth,
                        sat,
                        eat,
                        false
                    );
                    this.g.stroke();

                    this.g.lineWidth = 2;
                    this.g.beginPath();
                    this.g.strokeStyle = this.o.fgColor;
                    this.g.arc(
                        this.xy,
                        this.xy,
                        this.radius - this.lineWidth + 1 + (this.lineWidth * 2) / 3,
                        0,
                        2 * Math.PI,
                        false
                    );
                    this.g.stroke();

                    return false;
                }
            },
        });
        /* END JQUERY KNOB */

        //INITIALIZE SPARKLINE CHARTS
        var sparkline1 = new Sparkline($("#sparkline-1")[0], {
            width: 240,
            height: 70,
            lineColor: "#92c1dc",
            endColor: "#92c1dc",
        });
        var sparkline2 = new Sparkline($("#sparkline-2")[0], {
            width: 240,
            height: 70,
            lineColor: "#f56954",
            endColor: "#f56954",
        });
        var sparkline3 = new Sparkline($("#sparkline-3")[0], {
            width: 240,
            height: 70,
            lineColor: "#3af221",
            endColor: "#3af221",
        });

        sparkline1.draw([1000, 1200, 920, 927, 931, 1027, 819, 930, 1021]);
        sparkline2.draw([
            515, 519, 520, 522, 652, 810, 370, 627, 319, 630, 921,
        ]);
        sparkline3.draw([15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21]);
    });
</script>

<!-- Page specific script -->

<script>
    $(function () {
        $('.Select2').select2({selectOnClose: true});

        $("#example1")
            .DataTable({
                responsive: true,
                lengthChange: false,
                searching: false,
                autoWidth: false,
                // buttons: ["copy", "csv", "excel", "pdf", "print", "colvis"],
            })
            .buttons()
            .container()
            .appendTo("#example1_wrapper .col-md-6:eq(0)");
        $("#example2").DataTable({
            paging: true,
            lengthChange: false,
            searching: false,
            ordering: true,
            info: true,
            autoWidth: false,
            responsive: true,
        });
    });
</script>
</body>

</html>
