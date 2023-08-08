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
                                                        <span class="info-box-info-b2b black-50 font-14 b2b-font-weight-400"><i class="fa fa-car" style="width: 23px"></i>Vehicle Type <i class="fa fa-circle" style="margin-left: 5px"></i>&nbsp;&nbsp;Vehicle Model</span>
                                                        <span class="progress-description info-box-info-b2b black-50 font-14 b2b-font-weight-400">
                                                  <i class="fa fa-user"></i>  &nbsp;&nbsp;Driver Name
                                                </span>
                                                    </div>
                                                    <!-- /.info-box-content -->
                                                </div>
                                                <!-- /.info-box -->

                                        </div>
                                    </div>

<%--                                    <div class="row mb-3">--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <div class="w-100">--%>
<%--                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>--%>
<%--                                                <div class="b2b-list-block">--%>
<%--                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Vehicle Name</p>--%>
<%--                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">Driver Name</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <hr class="w-100 color-hr custom-hr">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

                                    <a href="${pageContext.request.contextPath}/vts/trip-details" class="">
                                        <div class="row">
                                            <div class="col-md-12 trip-block mt-2">
                                                <div class="float-left">
                                                    <p class="trip-block-primary-text info-box-info-b2b">
<%--                                                        <img class="mr-2" src="${pageContext.request.contextPath}/assets/b2b/dist/icon/trip_target.png">--%>
                                                        <i class="fa fa-clock-o" ></i>&nbsp;
                                                        Last Located Today at 12:10 PM
                                                    </p>
                                                </div>
<%--                                                <div class="float-right trip-timing-block">--%>
<%--                                                    <h6 class="font-12 b2b-font-weight-700">5:49 PM</h6>--%>
<%--                                                </div>--%>
                                            </div>

<%--                                            <div class="col-md-12 trip-block-middle pl-4 ml-3 mb-2 border-left-dotted-black">--%>
<%--                                                <p><i class="fa fa-expand"></i> 14.34 KM</p>--%>
<%--                                                <p><i class="fa fa-clock-o"></i> 1 hour 34 min 21 seconds</p>--%>
<%--                                                <p><i class="fa fa-exclamation-circle"></i> 0 Alarms</p>--%>
<%--                                            </div>--%>

                                            <div class="col-md-12 trip-block">
                                                <div class="float-left">
                                                    <p class="trip-block-primary-text info-box-info-b2b">
                                                        <i class="fa fa-map-marker" ></i> &nbsp;
                                                        Mufti Abdur Rahman Road, 149m West from Marakajul ploat, Block D, Bashundhara R/A, Vatara Dhaka.
                                                    </p>
                                                </div>
<%--                                                <div class="float-right trip-timing-block">--%>
<%--                                                    <h6 class="font-12 b2b-font-weight-700">5:49 PM</h6>--%>
<%--                                                </div>--%>
                                            </div>
                                        </div>
                                    </a>

<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <hr class="w-100 color-hr custom-hr">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

                                    <div class="row mt-3">
                                        <div class="col-md-4">
                                            <p class="font-16 mb-1">Engine</p>

                                            <span><i class="fa fa-power-off" style="font-size: 20px"></i></span>
                                            <span class="font-20 font-weight-500">&nbsp;On</span>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="font-16 mb-1">Speed</p>
                                            <span><i class="fa fa-spinner" style="font-size: 20px"></i></span>
                                            <span class="font-20 font-weight-500">&nbsp;0 Km/h</span>
                                        </div>
                                        <div class="col-md-4">
                                            <p class="font-16 mb-1 align-items-center">Battery</p>
                                            <span><i class="fa fa-bolt" style="font-size: 20px"></i></span>
                                            <span class="font-20 font-weight-500">&nbsp;12.8 V</span>
                                        </div>

                                    </div>

<%--                                    <div class="row">--%>
<%--                                        <div class="col-md-12">--%>
<%--                                            <hr class="w-100 color-hr custom-hr">--%>
<%--                                        </div>--%>
<%--                                    </div>--%>

                                    <div class="row mt-3">
                                        <div class="col-md-4">
                                            <div class="trip-details-blue-block text-center">
                                                <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gps.png">
                                                <p>Track</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="trip-details-blue-block text-center">
                                                <img src="${pageContext.request.contextPath}/assets/v2/dist/img/share.png">
                                                <p>Nearby</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="trip-details-blue-block text-center" id="detailFunctions">
<%--                                                <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/play-circle.png">--%>
                                                <img src="${pageContext.request.contextPath}/assets/v2/dist/img/document-text.png">
                                                <p>Details</p>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <!-- changes -->

                            </div>


                </div>
<%--                <div class="modal-footer">--%>
<%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
<%--                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>--%>
<%--                </div>--%>
            </div>
        </div>
    </div>

    <!-- Modal -->


    <!-- Modal 2-->
    <div class="modal left" id="vehicleDetails" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" >
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
<%--                <div class="modal-header">--%>
<%--                    <h4 class="modal-title float-left" id="myModalLabel2">Vehicle Details</h4>--%>
<%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"--%>
<%--                            style="height: 20px;width:--%>
<%--                            20px;border: 1px solid;--%>
<%--                            display: block;--%>
<%--                            border-radius: 50%;--%>
<%--                            padding: 0px;--%>
<%--                            line-height: 17px;--%>
<%--                            margin-top: 5px;--%>
<%--                            margin-right: 5px;">--%>
<%--                        <span aria-hidden="true">&times;</span>--%>
<%--                    </button>--%>
<%--                </div>--%>
                <div class="modal-body" style="position: relative; -ms-flex: 1 1 auto;flex: 1 1 auto;padding: 1rem; margin-left: 30px;margin-right: 30px;">


                    <div class="row">
                        <!-- changes -->
                        <div class="col-lg-12 col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="font-20 font-weight-500 my-3 black-20">Vehicle Details</h3>
                                    <p class="font-size-14 black-50">01 July 2023, 11:45 PM - 12:55 AM</p>
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
                                    <div class="trip-details-blue-block text-center">
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

<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <hr class="w-100 color-hr custom-hr">--%>
<%--                                </div>--%>
<%--                            </div>--%>


<%--                            <div class="row">--%>
<%--                                <div class="col-md-12">--%>
<%--                                    <hr class="w-100 color-hr custom-hr">--%>
<%--                                </div>--%>
<%--                            </div>--%>
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

                            <div class="row">
                                <div class="col-md-12">
                                    <hr class="w-100 color-hr custom-hr">
                                </div>
                            </div>



                        </div>

                        <!-- changes -->

                    </div>


                </div>
                <%--                <div class="modal-footer">--%>
                <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
                <%--                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>

    <!-- Modal 2-->

    <!-- Modal 3-->
    <div class="modal left" id="trackDetails" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <%--                <div class="modal-header">--%>
                <%--                    <h4 class="modal-title float-left" id="myModalLabel2">Vehicle Details</h4>--%>
                <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"--%>
                <%--                            style="height: 20px;width:--%>
                <%--                            20px;border: 1px solid;--%>
                <%--                            display: block;--%>
                <%--                            border-radius: 50%;--%>
                <%--                            padding: 0px;--%>
                <%--                            line-height: 17px;--%>
                <%--                            margin-top: 5px;--%>
                <%--                            margin-right: 5px;">--%>
                <%--                        <span aria-hidden="true">&times;</span>--%>
                <%--                    </button>--%>
                <%--                </div>--%>
                <div class="modal-body" style="position: relative; -ms-flex: 1 1 auto;flex: 1 1 auto;padding: 1rem; margin-left: 30px;margin-right: 30px;">


                    <div class="row">
                        <!-- changes -->
                        <div class="col-lg-12 col-md-12">
                            <div class="row">
                                <div class="col-md-12">
                                    <h3 class="font-20 font-weight-500 my-3 black-20">Vehicle Status</h3>
                                    <p class="font-size-14 black-50">01 July 2023, 11:45 PM - 12:55 AM</p>
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
                                    <div class="trip-details-blue-block text-center">
                                        <img src="${pageContext.request.contextPath}/assets/v2/dist/img/gps.png">
                                        <p>Track</p>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="trip-details-blue-block text-center">
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

                            <%--                            <div class="row">--%>
                            <%--                                <div class="col-md-12">--%>
                            <%--                                    <hr class="w-100 color-hr custom-hr">--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>


                            <%--                            <div class="row">--%>
                            <%--                                <div class="col-md-12">--%>
                            <%--                                    <hr class="w-100 color-hr custom-hr">--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
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

                            <div class="row">
                                <div class="col-md-12">
                                    <hr class="w-100 color-hr custom-hr">
                                </div>
                            </div>



                        </div>

                        <!-- changes -->

                    </div>


                </div>
                <%--                <div class="modal-footer">--%>
                <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
                <%--                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>

    <!-- Modal 2-->


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
          //  $("#vehicleStatus").modal("show");
            window.location.href="${pageContext.request.contextPath}/vts/map-selected";
        });
    };
</script>

<script>
    $(document).ready(function() {
        $('#detailFunctions').click(function(e) {
           // alert(1);
            $('#vehicleStatus').modal('hide');
            $("#vehicleDetails").modal("show");
        });
    });
</script>

<script>
    $(document).ready(function() {
        $('#trackFunctions').click(function(e) {
            // alert(1);
            $('#vehicleDetails').modal('hide');
            $("#trackDetails").modal("show");
        });
    });
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


