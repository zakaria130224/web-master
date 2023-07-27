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
    <title>VTS</title>

    <jsp:include page="./../../../../partial_new/header-link.jsp"></jsp:include>

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBReZYNJkZMsbONTHWrci1uYEzcYI_Dtj4&callback=initMap"></script>


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

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-1">
                    <div class="col-sm-6">
                        <h5>Trips</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">VTS</a></li>
                            <li class="breadcrumb-item active">Trips</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">


                <%--row block 1--%>
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-head-custom">
                                    <div class="float-left">
                                        <h3 class="b2b-font-20-500 black-10 float-left">Map View</h3>
                                    </div>
                                    <div class="float-right">
                                        <button type="submit" class="btn btn-sm btn-custom-white mr-2">Trip Summary</button>
                                        <button type="submit" class="btn btn-sm btn-custom-blue">List View</button>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-sm-12 col-md-12 col-lg-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-8 col-md-7">
                                                        <div id="map"></div>
                                                    </div>
                                                    <div class="col-lg-4 col-md-5">
                                                        <div class="d-flex gap-4">
                                                            <div
                                                                    class="dropdown col-5 d-flex justify-content-between align-items-center gap-3 border rounded-3 px-3 py-2"
                                                                    id="my-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> All Vehicles

                                                                <!-- <button  class="btn btn-primary btn-block dropdown-toggle" >Text</button> -->
                                                                <div class="dropdown-menu" aria-labelledby="my-dropdown">
                                                                    <a class="dropdown-item active" href="#">All Vehicle</a>
                                                                    <a class="dropdown-item " href="#">Vehicle #1</a>
                                                                    <a class="dropdown-item " href="#">Vehicle #2</a>
                                                                </div>

                                                                <div><img src="${pageContext.request.contextPath}/assets/b2b/dist/img/Vector 62.png" alt="" /></div>
                                                            </div>
                                                            <div
                                                                    class="dropdown col-5 d-flex justify-content-between align-items-center gap-3 border rounded-3 px-3 py-2"
                                                                    id="my-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> All Vehicles

                                                                <!-- <button  class="btn btn-primary btn-block dropdown-toggle" >Text</button> -->
                                                                <div class="dropdown-menu" aria-labelledby="my-dropdown">
                                                                    <a class="dropdown-item active" href="#">Today</a>
                                                                    <a class="dropdown-item " href="#">This Week</a>
                                                                    <a class="dropdown-item " href="#">This Moneth</a>
                                                                </div>

                                                                <div><img src="${pageContext.request.contextPath}/assets/b2b/dist/img/Vector 62.png" alt="" /></div>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <h2 class="font-weight-500 my-3">15 Trips</h2>
                                                        </div>

                                                        <div class="border-bottom mb-2">
                                                            <div class="d-flex gap-2">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
                                                                </div>
                                                            </div>

                                                            <div class="position-relative lh-0">
                                                                <hr />

                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/alaram-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">14.12 KM</p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex gap-2 mb-3">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="border-bottom mb-2">
                                                            <div class="d-flex gap-2">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
                                                                </div>
                                                            </div>

                                                            <div class="position-relative lh-0">
                                                                <hr />

                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/alaram-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">14.12 KM</p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex gap-2 mb-3">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="border-bottom mb-2">
                                                            <div class="d-flex gap-2">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
                                                                </div>
                                                            </div>

                                                            <div class="position-relative lh-0">
                                                                <hr />

                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/alaram-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">14.12 KM</p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                                <div class="d-flex gap-2 pl-29 mt-1 mb-1">
                                                                    <div class="text-color-light-gray">
                                                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/time-icon.svg" width="12" height="12" alt="" />
                                                                    </div>
                                                                    <p class="text-color-light-gray">
                                                                        1 hour 48 mins 21 seconds
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div class="d-flex gap-2 mb-3">
                                                                <div>
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/icons/location-icon.svg" width="22" height="22" alt="" />
                                                                </div>

                                                                <div class="w-60">
                                                                    <p>On Motijheel Road, 33m North</p>
                                                                </div>

                                                                <div class="">
                                                                    <p class="color-light-danger">5:49 PM</p>
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
                    </div>

                </div>

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


<!-- Modal -->

<!-- ./wrapper -->

<jsp:include page="./../../../../partial_new/script.jsp" />
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.js"></script>
<noscript src="${pageContext.request.contextPath}/assets/b2b/dist/js/pages/trips.js"></noscript>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">
<script>
    $( document ).ready(function() {
        $(".select2").select2();

        //Date range as a button
        $('#daterange-btn').daterangepicker(
            {
                ranges   : {
                    'Today'       : [moment(), moment()],
                    'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month'  : [moment().startOf('month'), moment().endOf('month')],
                    'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate  : moment(),
                opens: 'right'
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        );
    });
</script>
<script>
    $(document).ready(function () {
        $("#toggle-navbar").click("click", function () {
            $("#left-navbar").toggleClass("open");
        });
    });

    const map = L.map("map").setView([23.81, 90.43], 13);
    L.tileLayer("https://tile.openstreetmap.org/{z}/{x}/{y}.png", {
        attribution:
            '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(map);

    const markerGroup = L.layerGroup().addTo(map);

    const markerData = [
        [23.812, 90.435],
        [23.811, 90.434],
        [23.810, 90.433],
        [23.809, 90.432],
        [13.808, 90.331],
    ];

    markerData.forEach(function (coords) {
        const marker = L.marker(coords).addTo(markerGroup);
        marker.bindPopup("A pretty CSS popup.<br> Easily customizable.");
    });

    markerGroup.addTo(map);

</script>

</body>

</html>
