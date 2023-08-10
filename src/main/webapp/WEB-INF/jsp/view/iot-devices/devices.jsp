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

    <jsp:include page="./../../partial_new/header-link.jsp"></jsp:include>

    <style>
        .b2b-bg-info {
            background-color: #F3FBFF!important;
            border-radius: 12px;
            border-color: #D9EBF8;
        }
        .info-box-b2b {
            display: block;
            margin-top: 0.25rem;
            font-weight: 700;
            font-size: 18px;
        }
        h6{
            color: #181C32;
            font-family: Telenor;
            font-size: 20px;
            font-style: normal;
            font-weight: 500;
            line-height: 28px; /* 140% */
        }

    </style>
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

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <h3 class="card-title">2 Devices</h3>

                                    <div class="d-flex">
                                        <!-- <button
                                          type="button"
                                          class="btn custom-button-outline mr-2"
                                        >
                                          <i class="fa-file-arrow-down"></i>
                                          Trip Summary
                                        </button> -->
                                        <button type="button" class="btn b2b-btn-submit-blue-small mr-2" onclick="window.location.href = '/add_device';">
                                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                                            &nbsp;Add Device
                                        </button>
                                        <button type="button" class="btn b2b-btn-submit-blue-small">
                                            <i class="fa fa-gear"></i>
                                            &nbsp;Settings
                                        </button>

                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <div class="row">


                                </div>
                                <div class="row mt-4 mx-1">
                                    <h6>Monitor</h6>
                                </div>
                            <%--  Widget starts  --%>
                                <div class="row">

                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/map">
                                        <div class="info-box b2b-bg-info p-15p">
<%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/map002.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Map</span>
                                                <span class="progress-description">
                                                    Car navigation through map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                        </a>
                                    </div>

                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/map-vehicle-track">

                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/abs015.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">History</span>
                                                <span class="progress-description">
                                                    All the trips
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/alert">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gen007.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Alerts</span>
                                                <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/active_report">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gra001.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Reports</span>
                                                <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                        </a>
                                    </div>
                                    <!-- /.col -->

                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/driving_score">
                                            <div class="info-box b2b-bg-info p-15p">
                                                <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                                <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gra006.svg"
                                                             alt="User Image"/> </span>
                                                    <span class="info-box-b2b">Driving Score</span>
                                                    <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                                </div>
                                                <!-- /.info-box-content -->
                                            </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>


                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/trip-list">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/map003.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Trips</span>
                                                <span class="progress-description">
                                                    All the trips
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>

                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/vts-health">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/med001.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Health</span>
                                                <span class="progress-description">
                                                    Vehicle health report
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>


                                </div>

                            <%--   Widgets End   --%>
                                <div class="row mt-4 mx-1">
                                    <h6>Logs</h6>
                                </div>

                                <%-- Logs Start --%>
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/fuel-log">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/abs016.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Fuel Log</span>
                                                <span class="progress-description">
                                                    Fuel Logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/expense-list">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/fin003.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Expense</span>
                                                <span class="progress-description">
                                                    Expense Logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/maintenance-log">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/cod001.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Maintenance</span>
                                                <span class="progress-description">
                                                    Maintenance logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->

                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/papers">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gen005.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Papers</span>
                                                <span class="progress-description">
                                                    All papers
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>

                                   <%-- <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">

                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/requisitions">
                                        <div class="info-box b2b-bg-info p-15p">
                                            &lt;%&ndash;                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>&ndash;%&gt;

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gen037.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Requisition</span>
                                                <span class="progress-description">
                                                    Requisition logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>--%>
                                    <!-- /.col -->

                                </div>

                                <%-- Logs End --%>

                                <%-- Setup Start --%>
                                <div class="row mt-4 mx-1">
                                    <h6>Setup</h6>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/vehicle-list">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/teh001.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Vehicles & Trackers</span>
                                                <span class="progress-description">
                                                    List of Vehicles
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/drivers-list">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/com014.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Driver</span>
                                                <span class="progress-description">
                                                    All Driver information
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/map">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/map008.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Geo Fence</span>
                                                <span class="progress-description">
                                                    Geo Fencing on map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        </a>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <a style="color: inherit" class="" href="${pageContext.request.contextPath}/vts/alert">
                                        <div class="info-box b2b-bg-info p-15p">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content info-box-devices">
                                                <span > <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/gen019.svg"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Alert Settings</span>
                                                <span class="progress-description">
                                                    Geo Fencing on map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                        </a>
                                    </div>
                                    <!-- /.col -->
                                    <!-- /.col -->

                                </div>
                                <%-- Setup End --%>
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
