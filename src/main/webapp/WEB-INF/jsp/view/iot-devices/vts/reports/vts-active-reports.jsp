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
    <title>Devices</title>

    <jsp:include page="./../../../../partial_new/header-link.jsp"></jsp:include>

    <style>
        .b2b-bg-info {
            background-color: #F3FBFF!important;
            border-radius: 12px;
            border-color: #D9EBF8;
        }
        .b2b-text-color-grey {
            color: #B5B5C3;
            text-decoration: none;
            background-color: transparent;
        }


    </style>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="./../../../../partial_new/nevbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->

    <jsp:include page="./../../../../partial_new/aside.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->



    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-1">
                    <div class="col-sm-6">
                        <h5>VTS Report</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#" class="b2b-text-color-grey">Report</a></li>
                            <li class="breadcrumb-item active">VTS Report</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">Report For Active Time</h3>
                                    <div class="d-flex">
                                        <!-- <button
                                          type="button"
                                          class="btn custom-button-outline mr-2"
                                        >
                                          <i class="fa-file-arrow-down"></i>
                                          Trip Summary
                                        </button> -->
                                        <button type="button" class="btn custom-button">
                                            Export in PDF
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
<%--                                <div class="row">--%>
<%--                                    <div class="col-lg-6 col-md-6 col-sm-12 col-12 d-flex">--%>
<%--                                        <div class="dropdown mr-2">--%>
<%--                                            <button--%>
<%--                                                    class="btn btn-sm btn-outline-secondary dropdown-toggle"--%>
<%--                                                    type="button"--%>
<%--                                                    id="dropdownMenuButton"--%>
<%--                                                    data-toggle="dropdown"--%>
<%--                                                    aria-haspopup="true"--%>
<%--                                                    aria-expanded="false"--%>
<%--                                            >--%>
<%--                                                All Resources--%>
<%--                                            </button>--%>
<%--                                            <div--%>
<%--                                                    class="dropdown-menu"--%>
<%--                                                    aria-labelledby="dropdownMenuButton"--%>
<%--                                            >--%>
<%--                                                <a class="dropdown-item" href="#">Option 1</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 2</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 3</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dropdown mr-2">--%>
<%--                                            <button--%>
<%--                                                    class="btn btn-sm btn-outline-secondary dropdown-toggle"--%>
<%--                                                    type="button"--%>
<%--                                                    id="dropdownMenuButton"--%>
<%--                                                    data-toggle="dropdown"--%>
<%--                                                    aria-haspopup="true"--%>
<%--                                                    aria-expanded="false"--%>
<%--                                            >--%>
<%--                                                Date Range--%>
<%--                                            </button>--%>
<%--                                            <div--%>
<%--                                                    class="dropdown-menu"--%>
<%--                                                    aria-labelledby="dropdownMenuButton"--%>
<%--                                            >--%>
<%--                                                <a class="dropdown-item" href="#">Option 1</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 2</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 3</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dropdown mr-2">--%>
<%--                                            <button--%>
<%--                                                    class="btn btn-sm btn-outline-secondary dropdown-toggle"--%>
<%--                                                    type="button"--%>
<%--                                                    id="dropdownMenuButton"--%>
<%--                                                    data-toggle="dropdown"--%>
<%--                                                    aria-haspopup="true"--%>
<%--                                                    aria-expanded="false"--%>
<%--                                            >--%>
<%--                                                Option--%>
<%--                                            </button>--%>
<%--                                            <div--%>
<%--                                                    class="dropdown-menu"--%>
<%--                                                    aria-labelledby="dropdownMenuButton"--%>
<%--                                            >--%>
<%--                                                <a class="dropdown-item" href="#">Option 1</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 2</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 3</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dropdown mr-2">--%>
<%--                                            <button--%>
<%--                                                    class="btn btn-sm btn-outline-secondary dropdown-toggle"--%>
<%--                                                    type="button"--%>
<%--                                                    id="dropdownMenuButton"--%>
<%--                                                    data-toggle="dropdown"--%>
<%--                                                    aria-haspopup="true"--%>
<%--                                                    aria-expanded="false"--%>
<%--                                            >--%>
<%--                                                Option--%>
<%--                                            </button>--%>
<%--                                            <div--%>
<%--                                                    class="dropdown-menu"--%>
<%--                                                    aria-labelledby="dropdownMenuButton"--%>
<%--                                            >--%>
<%--                                                <a class="dropdown-item" href="#">Option 1</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 2</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 3</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="dropdown mr-2">--%>
<%--                                            <button--%>
<%--                                                    class="btn btn-sm btn-outline-secondary dropdown-toggle"--%>
<%--                                                    type="button"--%>
<%--                                                    id="dropdownMenuButton"--%>
<%--                                                    data-toggle="dropdown"--%>
<%--                                                    aria-haspopup="true"--%>
<%--                                                    aria-expanded="false"--%>
<%--                                            >--%>
<%--                                                Option--%>
<%--                                            </button>--%>
<%--                                            <div--%>
<%--                                                    class="dropdown-menu"--%>
<%--                                                    aria-labelledby="dropdownMenuButton"--%>
<%--                                            >--%>
<%--                                                <a class="dropdown-item" href="#">Option 1</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 2</a>--%>
<%--                                                <a class="dropdown-item" href="#">Option 3</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                   --%>

<%--                                    <div--%>
<%--                                            class="col-lg-6 col-md-6 col-sm-12 col-12 mt-2 mt-lg-0 mt-md-0"--%>
<%--                                    >--%>
<%--                                        <div class="search-box float-right">--%>
<%--                                            <input--%>
<%--                                                    class="search-input"--%>
<%--                                                    type="text"--%>
<%--                                                    placeholder="Search"--%>
<%--                                            />--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
    <div class="d-flex justify-content-between">
        <div class="d-flex">
            <div class="dropdown mr-2">
                <button
                        class="btn btn-sm btn-outline-secondary dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    All Resources
                </button>
                <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownMenuButton"
                >
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                </div>
            </div>
            <div class="dropdown mr-2">
                <button
                        class="btn btn-sm btn-outline-secondary"
                        type="button"
                        id="dropdownMenuButton"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    Date Range
                    <img
                            src="${pageContext.request.contextPath}/assets/b2b/dist/img/calendar-fill.png"
                            width="10"
                            class="ml-1"
                    />
                </button>
                <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownMenuButton"
                >
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                </div>
            </div>
            <div class="dropdown mr-2">
                <button
                        class="btn btn-sm btn-outline-secondary dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    Option
                </button>
                <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownMenuButton"
                >
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                </div>
            </div>
            <div class="dropdown mr-2">
                <button
                        class="btn btn-sm btn-outline-secondary dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    Option
                </button>
                <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownMenuButton"
                >
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                </div>
            </div>
            <div class="dropdown mr-2">
                <button
                        class="btn btn-sm btn-outline-secondary dropdown-toggle"
                        type="button"
                        id="dropdownMenuButton"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    Option
                </button>
                <div
                        class="dropdown-menu"
                        aria-labelledby="dropdownMenuButton"
                >
                    <a class="dropdown-item" href="#">Option 1</a>
                    <a class="dropdown-item" href="#">Option 2</a>
                    <a class="dropdown-item" href="#">Option 3</a>
                </div>
            </div>
        </div>

        <div class="search-box">
          <input
            class="search-input"
            type="text"
            placeholder="Search"
          />
        </div>
    </div>
                                <div class="row mt-4 mx-1">
                                    <h6>9 Results Found</h6>
                                </div>
                                <table id="example1" class="table">
                                    <thead class="header-bg">
                                    <tr>
                                        <th>Vehicle</th>
                                        <th>Driver</th>
                                        <th>Active Time</th>
                                        <th>Trips</th>
                                        <th>Avg Trip Duration</th>
                                    </tr>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
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
                                        <td>1h 25m</td>
                                        <td>5</td>
                                        <td>25m</td>
                                    </tr>
                                    </tbody>
                                    <!-- <tfoot>
                                      <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                      </tr>
                                    </tfoot> -->
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>


    <jsp:include page="./../../../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->

<!-- ./wrapper -->

<jsp:include page="./../../../../partial_new/script.jsp" />

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

