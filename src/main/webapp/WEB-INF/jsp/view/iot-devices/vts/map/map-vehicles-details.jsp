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
    <style>
        /*#map {*/
        /*    width: 1251px;*/
        /*    height: 778px;*/
        /*    flex-shrink: 0;*/
        /*}*/
        /*html, body {height: 100%; overflow-y: hidden}*/
        /*.col-md-12{*/
        /*    position: relative;*/
        /*    width: 100%;*/
        /*    padding-right: 0;*/
        /*    padding-left: 0;*/
        /*    padding-bottom: 0;*/
        /*}*/

        .severity-dot {
            width: 16px;
            height: 16px;
            border-radius: 50%;
            margin-right: 5px;
            margin-top: 5px;
        }
        .icon-font-size-32{
            font-size: 32px;
        }
        table.dataTable td {
            vertical-align: middle;
        }

        .b2b-bg-info {
            background-color: #F3FBFF!important;
            border-radius: 12px;
            border-color: #D9EBF8;
        }

        .b2b-bg-info-map {
            background-color: #F7F7F7!important;
            border-radius: 8px;
            border-color: #D9EBF8;
        }
        .info-box-b2b {
            display: block;
            margin-top: 0.25rem;
            font-weight: 700;
            font-size: 16px;
        }

        .info-box-info-b2b {
            display: block;
            margin-top: 0.25rem;
            font-weight: 400;
            font-size: 14px;
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

        <!-- Main content -->
        <%--        <section class="content">--%>
        <div class="container-fluid">


            <%--row block 1--%>
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-lg-8 col-md-7">
                                                    <div id="map" style="height: 80vh;"></div>
                                                </div>
                                                <div class="col-lg-4 col-md-5">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <h3 class="font-20 font-weight-500 my-3 black-20">Vehicle Details</h3>
                                                        </div>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <div class="col-md-12">
                                                            <div class="w-100">
                                                                <div class="text-center">
                                                                    <img src="${pageContext.request.contextPath}/assets/v2/dist/img/car_photo.png">
                                                                </div>
                                                                <div class="text-center">
                                                                    <p class="info-box-b2b">Vehicle Name</p>
                                                                </div>
                                                                <div class="text-center">
                                                                    <span class="info-box-info-b2b black-50 font-14 b2b-font-weight-400"></i>Vehicle Type <i class="fa fa-circle" style="margin-left: 5px"></i>&nbsp;&nbsp;Vehicle Model</span>
                                                                </div>
                                                                <div class="text-center">
                                                                    <span class="info-box-info-b2b black-50 font-14 b2b-font-weight-400">Driver Name<i class="fa fa-circle" style="margin-left: 5px"></i>&nbsp;&nbsp;Driver Number</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="row mt-4">
                                                        <div class="col-md-3">
                                                            <div class="trip-details-blue-block text-center" id="trackFunctions">
                                                                <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gps.png">
                                                                <p>Track</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="trip-details-blue-block text-center" id="nearbyFunctions">
                                                                <img src="${pageContext.request.contextPath}/assets/v2/dist/img/share.png">
                                                                <p>Nearby</p>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="trip-details-blue-block text-center">
                                                                <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/user.png">
                                                                <p>Driver</p>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-3">
                                                            <div class="trip-details-blue-block text-center">
                                                                <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/car.png">
                                                                <p>Vehicle</p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="info-box b2b-bg-info-map" style="margin-top: 20px">

                                                        <div class="row ">
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Distance Travelled</p>
                                                                <span><i class="fa fa-angle-double-right" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;32.2 Km</span>
                                                            </div>
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Fuel Consumed</p>
                                                                <span><i class="fa fa-spinner" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;32.2 Km</span>
                                                            </div>
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Engine</p>
                                                                <span><i class="fa fa-play-circle-o" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;32.2 Km</span>
                                                            </div>
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Speed</p>
                                                                <span><i class="fa fa-play-circle-o" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;12.4 Km/H</span>
                                                            </div>
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Battery Voltage</p>
                                                                <span><i class="fa fa-battery-half" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;13.3 V</span>
                                                            </div>
                                                            <div class="col-md-6 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Speed</p>
                                                                <span><i class="fa fa-play-circle-o" style="font-size: 20px"></i></span>
                                                                <span class="font-20 font-weight-500">&nbsp;12.4 Km/H</span>
                                                            </div>
                                                            <div class="col-md-12 p-3">
                                                                <p class="font-14 mb-1 font-weight-400">Last Location</p>
                                                                <span><i class="fa fa-map-marker" style="font-size: 20px"></i></span>
                                                                <span class="font-14 font-weight-500">&nbsp;Mufti Abdur Rahman Road, 149m West from Marakajul ploat, Block D, Bashundhara R/A, Vatara Dhaka.</span>
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
        <%--        </section>--%>
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
    window.onload = function() {
        // Center of the map (latitude and longitude)
        var centerLatLng = { lat: 23.811056, lng: 90.407608 }; // Replace these values with your desired coordinates

        // Create the map
        var map = new google.maps.Map(document.getElementById('map'), {
            center: centerLatLng,
            zoom: 15 // You can adjust the zoom level here
        });

        // Add a marker at the specified location
        var marker = new google.maps.Marker({
            position: centerLatLng,
            map: map,
            title: 'My Marker' // You can set a custom title for the marker
        });

        marker.addListener('click', function() {
            var devs_imei;
            // var devs_imei = $('#carIMEI').val()
            //  alert("hello world");
            //  $("#vehicleStatus").modal("show");
            window.location.href="${pageContext.request.contextPath}/vts/map-selected";
        });
    };
</script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVgrZSN03iRyOjMtsON-aIyjTgph0vefQ&libraries=geometry&callback=initMap">
</script>
<script>
    $(document).ready(function() {
        $('#detailFunctions').click(function(e) {
            // alert(1);
            window.location.href="${pageContext.request.contextPath}/vts/map-vehicles-details";
        });
    });
</script>
<script>
    $(document).ready(function() {
        $('#trackFunctions').click(function(e) {
            // alert(1);
            window.location.href="${pageContext.request.contextPath}/vts/map-vehicle-track";
        });
    });
</script>

<script>
    $(document).ready(function() {
        $('#nearbyFunctions').click(function(e) {
            // alert(1);
            window.location.href="${pageContext.request.contextPath}/vts/map-nearby-vehicle";
        });
    });
</script>

</body>

</html>
