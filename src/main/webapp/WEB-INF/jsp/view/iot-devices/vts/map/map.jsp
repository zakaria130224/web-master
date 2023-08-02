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


