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
                <div class="row mx-1 py-2 mb-1 " style="background-color: white; border-radius: 8px;">
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-2 col-lg-1">
                        <div class="tabs_bar">
                            <span class="mt-5">Tab</span>
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
                                        <button type="button" class="btn custom-button mr-2">
                                            <i class="fa fa-plus"></i>
                                            &nbsp;Add Device
                                        </button>
                                        <button type="button" class="btn custom-button">
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
                                        <div class="info-box b2b-bg-info">
<%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/map002.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Map</span>
                                                <span class="progress-description">
                                                    Car navigation through map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/abs015.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">History</span>
                                                <span class="progress-description">
                                                    All the trips
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gen007.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Alerts</span>
                                                <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gra001.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Reports</span>
                                                <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gra006.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Driving Score</span>
                                                <span class="progress-description">
                                                    Score based on driving parameters
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/map003.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Trips</span>
                                                <span class="progress-description">
                                                    All the trips
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>

                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/med001.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Health</span>
                                                <span class="progress-description">
                                                    Vehicle health report
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
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
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/abs016.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Fuel Log</span>
                                                <span class="progress-description">
                                                    Fuel Logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/fin003.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Expense</span>
                                                <span class="progress-description">
                                                    Expense Logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/cod001.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Maintenance</span>
                                                <span class="progress-description">
                                                    Maintenance logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gen005.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Papers</span>
                                                <span class="progress-description">
                                                    All papers
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gen037.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Requisition</span>
                                                <span class="progress-description">
                                                    Requisition logs
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->

                                </div>

                                <%-- Logs End --%>

                                <%-- Setup Start --%>
                                <div class="row mt-4 mx-1">
                                    <h6>Setup</h6>
                                </div>

                                <div class="row">
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/teh001.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Vehicles & Trackers</span>
                                                <span class="progress-description">
                                                    List of Vehicles
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/com014.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Driver</span>
                                                <span class="progress-description">
                                                    All Driver information
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/map008.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Geo Fence</span>
                                                <span class="progress-description">
                                                    Geo Fencing on map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-md-3 col-sm-6 col-12">
                                        <div class="info-box b2b-bg-info">
                                            <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>

                                            <div class="info-box-content">
                                                <span > <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gen019.png"
                                                             alt="User Image"/> </span>
                                                <span class="info-box-b2b">Alert Settings</span>
                                                <span class="progress-description">
                                                    Geo Fencing on map
                                                </span>
                                            </div>
                                            <!-- /.info-box-content -->
                                        </div>
                                        <!-- /.info-box -->
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
