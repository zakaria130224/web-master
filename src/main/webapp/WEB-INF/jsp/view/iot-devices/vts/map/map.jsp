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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/modal-style.css">
    <style>
        /*#map {*/
        /*    width: 1251px;*/
        /*    height: 778px;*/
        /*    flex-shrink: 0;*/
        /*}*/
        /*html, body {height: 100%; overflow-y: hidden}*/
        .col-md-12{
            position: relative;
            width: 100%;
            padding-right: 0;
            padding-left: 0;
            padding-bottom: 0;
        }

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
        .info-box-b2b {
            display: block;
            margin-top: 0.25rem;
            font-weight: 700;
            font-size: 18px;
        }

        .info-box-info-b2b {
            display: block;
            margin-top: 0.25rem;
            font-weight: 700;
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
        <!-- Content Header (Page header) -->


        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">


                            <div id="map" style="height: 90vh; width: 100%;">
                            </div>



                </div>
                <!--/.col-md-12-->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <!-- Modal -->
    <div class="modal left fade" id="vehicleStatus" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="myModalLabel2">Vehicle Status</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                            style="height: 20px;width:
                            20px;border: 1px solid;
                            display: block;
                            border-radius: 50%;
                            padding: 0px;
                            line-height: 17px;
                            margin-top: 5px;
                            margin-right: 5px;">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="position: relative; -ms-flex: 1 1 auto;flex: 1 1 auto;padding: 1rem; margin-left: 30px;margin-right: 30px;">


                            <div class="row">
                            <!-- changes -->
                                <div class="col-lg-12 col-md-12">
                                    <div class="row">
                                        <div class="col-md-12">

                                                <div class="info-box b2b-bg-info">
                                                    <%--                                            <span class="info-box-icon"><i class="far fa-bookmark"></i></span>--%>
                                                    <span class="info-box-icon"><img src="${pageContext.request.contextPath}/assets/v2/dist/img/car_photo.png"></span>
                                                    <div class="info-box-content">
                                                <span class="info-box-b2b"> Vehicle Name </span>
                                                        <span class="info-box-info-b2b"><i class="fa fa-car" style="width: 23px"></i>Vehicle Type <i class="fa fa-circle" style="margin-left: 5px"></i>&nbsp;&nbsp;Vehicle Model</span>
                                                        <span class="progress-description">
                                                    Car navigation through map
                                                </span>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                                <!-- /.info-box -->

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
                                        <div class="col-md-4">
                                            <p class="font-12 mb-1">AVG Speed</p>
                                            <h3 class="font-20 font-weight-500">16.8 km/h</h3>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="font-12 mb-1">Distance</p>
                                            <h3 class="font-20 font-weight-500">1.3 KM</h3>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="font-12 mb-1">Trip Time</p>
                                            <h3 class="font-20 font-weight-500">34m 4s</h3>
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
                                                <p>Track</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="trip-details-blue-block text-center">
                                                <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/user.png">
                                                <p>Nearby</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="trip-details-blue-block text-center">
                                                <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/play-circle.png">
                                                <p>Details</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- changes -->

                            </div>


                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>
                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->


    <jsp:include page="./../../../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->

<!-- Control Sidebar -->
<%--<aside class="control-sidebar control-sidebar-dark">--%>
<%--    <!-- Control sidebar content goes here -->--%>
<%--</aside>--%>
<!-- /.control-sidebar -->

<!-- ./wrapper -->

<jsp:include page="./../../../../partial_new/script.jsp" />

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
            $("#vehicleStatus").modal("show");
        });
    };
</script>
<!--Load the API from the specified URL
* The async attribute allows the browser to render the page while the API loads
* The key parameter will contain your own API key (which is not needed for this tutorial)
* The callback parameter executes the initMap() function
-->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVgrZSN03iRyOjMtsON-aIyjTgph0vefQ&libraries=geometry&callback=initMap">
</script>

</body>

</html>


