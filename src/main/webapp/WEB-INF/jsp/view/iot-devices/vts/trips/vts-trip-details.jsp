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

    <script defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBReZYNJkZMsbONTHWrci1uYEzcYI_Dtj4&libraries=visualization&callback=initMap">
    </script>

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
                                        <a type="submit" class="btn btn-sm btn-custom-white mr-2">Trip Summary</a>
                                        <a href="${pageContext.request.contextPath}/vts/trip-list" class="btn btn-sm btn-custom-blue">List View</a>
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
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <h3 class="font-20 font-weight-500 my-3 black-20">Trip Details</h3>
                                                                <p class="font-size-14 black-50">01 July 2023, 11:45 PM - 12:55 AM</p>
                                                            </div>
                                                        </div>

                                                        <div class="row mb-3">
                                                            <div class="col-md-12">
                                                                <div class="w-100">
                                                                    <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                    <div class="b2b-list-block">
                                                                        <p class="black-30 font-16 b2b-font-weight-500 mb-0">Vehicle Name</p>
                                                                        <p class="card-text black-50 font-12 b2b-font-weight-700">Driver Name</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <hr class="w-100 color-hr custom-hr">
                                                            </div>
                                                        </div>

                                                        <a href="${pageContext.request.contextPath}/vts/trip-details" class="">
                                                            <div class="row">
                                                                <div class="col-md-12 trip-block mt-2">
                                                                    <div class="float-left">
                                                                        <p class="trip-block-primary-text">
                                                                            <img class="mr-2" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/trip_target.png">
                                                                            On Motijheel Road, 33m North
                                                                        </p>
                                                                    </div>
                                                                    <div class="float-right trip-timing-block">
                                                                        <h6 class="font-12 b2b-font-weight-700">5:49 PM</h6>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12 trip-block-middle pl-4 ml-3 mb-2 border-left-dotted-black">
                                                                    <p><i class="fa fa-expand"></i> 14.34 KM</p>
                                                                    <p><i class="fa fa-clock-o"></i> 1 hour 34 min 21 seconds</p>
                                                                    <p><i class="fa fa-exclamation-circle"></i> 0 Alarms</p>
                                                                </div>

                                                                <div class="col-md-12 trip-block">
                                                                    <div class="float-left">
                                                                        <p class="trip-block-primary-text">
                                                                            <img class="mr-2" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/navigation.png">
                                                                            On Motijheel Road, 33m North
                                                                        </p>
                                                                    </div>
                                                                    <div class="float-right trip-timing-block">
                                                                        <h6 class="font-12 b2b-font-weight-700">5:49 PM</h6>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <hr class="w-100 color-hr custom-hr">
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">AVG Speed</p>
                                                                <h3 class="font-20 font-weight-500">16.8 km/h</h3>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">Distance</p>
                                                                <h3 class="font-20 font-weight-500">1.3 KM</h3>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">Trip Time</p>
                                                                <h3 class="font-20 font-weight-500">34m 4s</h3>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">Est. Fuel Consumed</p>
                                                                <h3 class="font-20 font-weight-500">1.3 L</h3>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">Alert</p>
                                                                <h3 class="font-20 font-weight-500">0</h3>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <p class="font-12 mb-1">Est. Fuel Consumed</p>
                                                                <h3 class="font-20 font-weight-500">1.3 L</h3>
                                                            </div>
                                                        </div>

                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <hr class="w-100 color-hr custom-hr">
                                                            </div>
                                                        </div>

                                                        <div class="row mt-3">
                                                            <div class="col-md-4">
                                                                <div class="trip-details-blue-block text-center">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/car.png">
                                                                    <p>Vehicle</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="trip-details-blue-block text-center">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/user.png">
                                                                    <p>Driver</p>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="trip-details-blue-block text-center">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/play-circle.png">
                                                                    <p>Play</p>
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
                opens: 'left'
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
        );
    });
</script>

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 0, lng: 0},
            zoom: 3,
            styles: [{
                featureType: 'poi',
                stylers: [{ visibility: 'off' }]  // Turn off points of interest.
            }, {
                featureType: 'transit.station',
                stylers: [{ visibility: 'off' }]  // Turn off bus stations, train stations, etc.
            }],
            disableDoubleClickZoom: true,
            streetViewControl: false
        });
    }
</script>

</body>

</html>
