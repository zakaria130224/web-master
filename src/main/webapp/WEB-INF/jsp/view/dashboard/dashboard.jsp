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
                <div class="row mx-1 py-2 mb-1 " style="background-color: white; border-radius: 8px;">
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

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-purple circle p-2 d-flex justify-content-center
                       align-items-center">
                                        <i class="fas fa-gear text-white"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Total Vehicles</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-green circle p-2 d-flex justify-content-center
                       align-items-center font-21">
                                        <i class="fa fa-exchange text-white"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Small Text</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-danger circle p-2 d-flex justify-content-center
                       align-items-center font-21">
                                        <i class="fa fa-stop-circle-o text-white"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Engine Off</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-primary circle p-2 d-flex justify-content-center
                       align-items-center font-21">
                                        <i class="fa fa-pause-circle-o text-white"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Idle</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-gray circle p-2 d-flex justify-content-center
                       align-items-center font-21">
                                        <i class="fas fa-plug text-white"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-1">5</h4>
                                        <p class="text-muted">Unplugged</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-4 col-lg-2">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <div class="circle mr-3 bg-gray circle p-2 d-flex justify-content-center
                       align-items-center font-21">
                                        <i class="fa fa-question-circle-o text-white"></i>
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
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h6 class=" p-2">Alarms</h6>
                                    <div class="d-flex">
                                        <!-- <button
                                            type="button"
                                            class="btn custom-button-outline mr-2"
                                          >
                                            <i class="fa-file-arrow-down"></i>
                                            Trip Summary
                                          </button> -->
                                        <!-- <button type="button" class="btn custom-button">
                                            Export
                                          </button> -->
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="dropdown mr-2">
                                            <button class=" text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Vehicle List
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">Option 1</a>
                                                <a class="dropdown-item" href="#">Option 2</a>
                                                <a class="dropdown-item" href="#">Option 3</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="dropdown mr-2">
                                            <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Duration
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">Option 1</a>
                                                <a class="dropdown-item" href="#">Option 2</a>
                                                <a class="dropdown-item" href="#">Option 3</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row mt-4 mx-1">
                                    <div class="col-4">Total Alarm </br>
                                        <h5>9</h5>
                                    </div>
                                    <div class="col-4">Critical Alarm </br>
                                        <h5>7</h5>
                                    </div>
                                    <div class="col-4">Non Critical Alarm </br>
                                        <h5>2</h5>
                                    </div>
                                </div>
                                <div class="col-12 my-2">
                                    <canvas id="myChart"></canvas>
                                </div>


                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h6 class=" p-2">Top Alarm Generating Vehicles</h6>

                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="dropdown mr-2">
                                            <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                    id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Duration
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="#">Option 1</a>
                                                <a class="dropdown-item" href="#">Option 2</a>
                                                <a class="dropdown-item" href="#">Option 3</a>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="col-12 my-2">
                                <div class="card pl-3 pt-1">
                                    <div class="row">
                                        <div class="col-3 my-2">
                                            <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                                <i class="fa fa-car " aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="card-body">
                                                <h5 class="card-title">Light Demo</h5>
                                                <p class="card-text">small details</p>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <h3>4</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3 my-2">
                                            <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                                <i class="fa fa-car " aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="card-body">
                                                <h5 class="card-title">Light Demo</h5>
                                                <p class="card-text">small details</p>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <h3>4</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3 my-2">
                                            <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                                <i class="fa fa-car " aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="card-body">
                                                <h5 class="card-title">Light Demo</h5>
                                                <p class="card-text">small details</p>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <h3>4</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3 my-2">
                                            <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                                <i class="fa fa-car " aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="card-body">
                                                <h5 class="card-title">Light Demo</h5>
                                                <p class="card-text">small details</p>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <h3>4</h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3 my-2">
                                            <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                                <i class="fa fa-car " aria-hidden="true"></i>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="card-body">
                                                <h5 class="card-title">Light Demo</h5>
                                                <p class="card-text">small details</p>
                                            </div>
                                        </div>
                                        <div class="col-3">
                                            <div class="card-body d-flex align-items-center justify-content-center">
                                                <h3>4</h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>


                </div>

            </div>
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h6 class=" p-2">Alarms</h6>
                                <div class="d-flex">
                                    <!-- <button
                                        type="button"
                                        class="btn custom-button-outline mr-2"
                                      >
                                        <i class="fa-file-arrow-down"></i>
                                        Trip Summary
                                      </button> -->
                                    <!-- <button type="button" class="btn custom-button">
                                        Export
                                      </button> -->
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="dropdown mr-2">
                                        <button class=" text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Vehicle List
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Option 1</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="#">Option 3</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="dropdown mr-2">
                                        <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Duration
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Option 1</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="#">Option 3</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row mt-4 mx-1">
                                <div class="col-4">Total Alarm </br>
                                    <h5>9</h5>
                                </div>
                                <div class="col-4">Critical Alarm </br>
                                    <h5>7</h5>
                                </div>
                                <div class="col-4">Non Critical Alarm </br>
                                    <h5>2</h5>
                                </div>
                            </div>
                            <div class="col-12 my-2">
                                <canvas id="barChart"></canvas>
                            </div>


                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h6 class=" p-2">Highest Distance Covered</h6>

                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="dropdown mr-2">
                                        <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Duration
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Option 1</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="#">Option 3</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="col-12 my-2">
                            <div class="card pl-3 pt-1">
                                <div class="row">
                                    <div class="col-3 my-2">
                                        <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                            <i class="fa fa-car " aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card-body">
                                            <h5 class="card-title">Light Demo</h5>
                                            <p class="card-text">small details</p>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <h3>4</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 my-2">
                                        <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                            <i class="fa fa-car " aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card-body">
                                            <h5 class="card-title">Light Demo</h5>
                                            <p class="card-text">small details</p>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <h3>4</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 my-2">
                                        <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                            <i class="fa fa-car " aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card-body">
                                            <h5 class="card-title">Light Demo</h5>
                                            <p class="card-text">small details</p>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <h3>4</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 my-2">
                                        <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                            <i class="fa fa-car " aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card-body">
                                            <h5 class="card-title">Light Demo</h5>
                                            <p class="card-text">small details</p>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <h3>4</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-3 my-2">
                                        <div class="card-body bg-primary text-center" style="border-radius: 8px;">
                                            <i class="fa fa-car " aria-hidden="true"></i>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="card-body">
                                            <h5 class="card-title">Light Demo</h5>
                                            <p class="card-text">small details</p>
                                        </div>
                                    </div>
                                    <div class="col-3">
                                        <div class="card-body d-flex align-items-center justify-content-center">
                                            <h3>4</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-12 col-lg-5">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h6 class=" p-2">Driving Score</h6>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="dropdown mr-2">
                                        <button class=" text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Vehicle List
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Option 1</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="#">Option 3</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="dropdown mr-2">
                                        <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Duration
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="#">Option 1</a>
                                            <a class="dropdown-item" href="#">Option 2</a>
                                            <a class="dropdown-item" href="#">Option 3</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row mt-4 mx-1">
                                <div class="col-4">Trips </br>
                                    <h5>9</h5>
                                </div>
                                <div class="col-4">Time </br>
                                    <h5>7</h5>
                                </div>
                                <div class="col-4">Distance </br>
                                    <h5>2</h5>
                                </div>
                            </div>
                            <div class="col-12 my-2">
                                <div class="container">
                                    <div class="row align-items-center">
                                        <div class="col-lg-4 col-md-5 col-6">
                                            <div class="chart-container" style="width: 120px">
                                                <canvas id="circle"></canvas>
                                            </div>
                                        </div>

                                        <div class="col-lg-8 col-md-7 col-6 mt-4">
                                            <div class="d-flex flex-column mt-4">
                                                <div class="d-flex justify-content-between gap-3 gap-sm-1">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />
                                                        <span class="pl-2">Safe</span>
                                                    </div>
                                                    <div>-60</div>
                                                </div>

                                                <div class="d-flex justify-content-between gap-3 gap-sm-1">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />
                                                        <span class="pl-2">Risk</span>
                                                    </div>
                                                    <div>-60</div>
                                                </div>

                                                <div class="d-flex justify-content-between gap-3 gap-sm-1">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />
                                                        <span class="pl-2">Dangerous</span>
                                                    </div>
                                                    <div>-60</div>
                                                </div>

                                                <div class="d-flex align-items-center gap-2 mt-4">
                                                    <img src="${pageContext.request.contextPath}/assets/dist/img/Subtract.svg" alt="png" />
                                                    <span style="color: #0078cf" class="ml-2">Target Settings</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>

                <div class="col-12 col-lg-7">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h6 class=" p-2">Driver's Info</h6>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row">

                                        <div class="d-flex align-items-center p-2">
                                            <div class="circle mr-3 bg-primary circle p-2 d-flex justify-content-center
                             align-items-center">
                                                <i class="fas fa-star text-white"></i>
                                            </div>
                                            <div>
                                                <h4 class="mb-1">5</h4>
                                                <p class="text-muted">Small Text</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center p-2">
                                            <div class="circle mr-3 bg-primary circle p-2 d-flex justify-content-center
                             align-items-center">
                                                <i class="fas fa-star text-white"></i>
                                            </div>
                                            <div>
                                                <h4 class="mb-1">5</h4>
                                                <p class="text-muted">Small Text</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center p-2">
                                            <div class="circle mr-3 bg-primary circle p-2 d-flex justify-content-center
                             align-items-center">
                                                <i class="fas fa-star text-white"></i>
                                            </div>
                                            <div>
                                                <h4 class="mb-1">5</h4>
                                                <p class="text-muted">Small Text</p>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <div class="dropdown mr-2">
                                                <button class=" text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Vehicle List
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">Option 1</a>
                                                    <a class="dropdown-item" href="#">Option 2</a>
                                                    <a class="dropdown-item" href="#">Option 3</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="dropdown mr-2">
                                                <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Duration
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">Option 1</a>
                                                    <a class="dropdown-item" href="#">Option 2</a>
                                                    <a class="dropdown-item" href="#">Option 3</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12  mt-3">
                                        <div class="d-flex align-items-center justify-content-center row">

                                            <div class="p-2 mr-3">
                                                <div>
                                                    <h6 class="mb-1">Estimated Fuel</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center p-2 mr-5 ml-5">
                                                <div>
                                                    <h6 class="mb-1">Excessive Idling</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center p-2 ml-3">
                                                <div>
                                                    <h6 class="mb-1">Driving Behavior</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12 col-lg-4 text-center">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                            <div class="text-center col-12 col-lg-4">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                            <div class="text-center col-12 col-lg-4">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                        </div>

                                    </div>

                                </div>


                            </div>

                        </div>
                        <div class="col-12">
                            <div class="row">

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="row">
                <div class="col-12 ">
                    <div class="card">
                        <div class="card-header">
                            <div class="d-flex justify-content-between">
                                <h6 class=" p-2">Driver's Info</h6>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <div class="dropdown mr-2">
                                                <button class=" text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Vehicle List
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">Option 1</a>
                                                    <a class="dropdown-item" href="#">Option 2</a>
                                                    <a class="dropdown-item" href="#">Option 3</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="dropdown mr-2">
                                                <button class="text-left  btn full-width btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    Duration
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="#">Option 1</a>
                                                    <a class="dropdown-item" href="#">Option 2</a>
                                                    <a class="dropdown-item" href="#">Option 3</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12  mt-3">
                                        <div class="d-flex align-items-center justify-content-center row">
                                            <div class="p-2 mr-3">
                                                <div>
                                                    <h6 class="mb-1">Estimated Fuel</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>
                                            <div class="p-2 mr-5 ml-5">
                                                <div>
                                                    <h6 class="mb-1">Estimated Fuel</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center p-2 mr-5 ml-5">
                                                <div>
                                                    <h6 class="mb-1">Excessive Idling</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center p-2 ml-3">
                                                <div>
                                                    <h6 class="mb-1">Driving Behavior</h6>
                                                    <p class="text-muted">Small Text</p>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row mt-3">
                                            <div class="col-12 col-md-6 col-lg-3 text-center">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>
                                            <div class="col-12 col-md-6 col-lg-3 text-center">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                            <div class="text-center col-12 col-lg-3 col-md-6">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                            <div class="text-center col-12 col-lg-3 col-md-6">
                                                <!-- Knob input code -->
                                                <input type="text" class="knob" data-thickness="0.2" data-anglearc="250"
                                                       data-angleoffset="-125" value="30" data-width="120" data-height="120" data-fgcolor="#00c0ef"
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
                                                <span class="target-span">Target 5.0</span>
                                            </div>

                                        </div>

                                    </div>

                                </div>


                            </div>

                        </div>
                        <div class="col-12">
                            <div class="row">

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

<!-- ./wrapper -->

<jsp:include page="./../../partial_new/script.jsp" />

<script>
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
