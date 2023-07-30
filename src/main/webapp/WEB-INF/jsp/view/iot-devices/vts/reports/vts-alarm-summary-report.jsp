<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 7/24/2023
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
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

        .b2b-flex-basis50{
            flex-basis: 50%;
        }

        .b2b-block-24 {
            height: 24px;
            width: 24px;
            border-radius: 2px;
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
                                <div class="d-flex justify-content-between align-items-center">
                                    <h3 class="card-title">Report For Alarm Summary</h3>
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
                                <div class="d-flex justify-content-between align-items-center">
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
<%--                                <div class="row mt-4 mx-1">--%>
<%--                                    <h6>9 Results Found</h6>--%>
<%--                                </div>--%>

                                <!-- Start circle -->
                                    <div class="row align-items-center">
                                        <div class="col-lg-6 col-md-6 col-12">
                                            <div class="card-body">
                                            <canvas id="pieChart" style="min-height: 500px; height: 500px; max-height: 500px; max-width: 100%;"></canvas>
                                            </div>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-12 mt-4">
                                            <div class="d-flex flex-column">
                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #D9214E"></div>
                                                            <div>
                                                        <div class="" style="color: #232026;font-size: 18px; font-weight: bold">0</div>
                                                           <div class="font-size-14" style="color: #918f92">Collision</div>
                                                            </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #d9bbc2"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">4</div>
                                                            <div class="font-size-14" style="color: #918f92">Harsh Acceleration</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #F27321"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">1</div>
                                                            <div class="font-size-14" style="color: #918f92">Device Unplugged</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #f4c7aa"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">2</div>
                                                            <div class="font-size-14" style="color: #918f92">Harsh Brake</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #E9B500"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">2</div>
                                                            <div class="font-size-14" style="color: #918f92">Displacement</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #f9efcc"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">1</div>
                                                            <div class="font-size-14" style="color: #918f92">Low Battery Level</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #47BE7D"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">3</div>
                                                            <div class="font-size-14" style="color: #918f92">Engine On/Off</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #bcd6c7"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">0</div>
                                                            <div class="font-size-14" style="color: #918f92">Low Battery Voltage</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #39D5FD"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">2</div>
                                                            <div class="font-size-14" style="color: #918f92">Excessive Idling</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #c5ebf4"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">0</div>
                                                            <div class="font-size-14" style="color: #918f92">Maintenance</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #2884EF"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">6</div>
                                                            <div class="font-size-14" style="color: #918f92">Geofence</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #d7e9ff"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">1</div>
                                                            <div class="font-size-14" style="color: #918f92">Vibration</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="d-flex gap-3 gap-sm-1 b2b-mb-12">
                                                    <div class="d-flex align-items-center b2b-flex-basis50">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #5014d0"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">3</div>
                                                            <div class="font-size-14" style="color: #918f92">Over Speeding</div>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex align-items-center">
                                                        <%--<img src="${pageContext.request.contextPath}/assets/dist/img/indicator.svg" alt="png" />--%>
                                                        <div class="b2b-block-24 gap-3 mr-2" style="background-color: #c7bbe1"></div>
                                                        <div>
                                                            <div class=" font-size-16" style="color: #232026;font-size: 18px; font-weight: bold">1</div>
                                                            <div class="font-size-14" style="color: #918f92">SOS</div>
                                                        </div>
                                                    </div>
                                                </div>





                                            </div>
                                        </div>
                                    </div>
                                <!-- End Circle -->

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

        //-------------
        //- DONUT CHART -
        //-------------
        // Get context with jQuery - using jQuery's .get() method.

        var donutData        = {
            // labels: [
            //     'Chrome',
            //     'IE',
            //     'FireFox',
            //     'Safari',
            //     'Opera',
            //     'Navigator',
            // ],
            datasets: [
                {
                    data: [700,500,400,600,300,100],
                    backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
                }
            ]
        }



        // -------------
        // - PIE CHART -
        // -------------
        // Get context with jQuery - using jQuery's .get() method.
        var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
        var pieData        = donutData;
        var pieOptions     = {
            maintainAspectRatio : false,
            responsive : true,
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        new Chart(pieChartCanvas, {
            type: 'pie',
            data: pieData,
            options: pieOptions
        })

    });
</script>


</body>

</html>


