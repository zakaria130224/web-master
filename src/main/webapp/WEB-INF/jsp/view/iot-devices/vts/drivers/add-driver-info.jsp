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

    <style>
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
    </style>

</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="./../../../../partial_new/loader.jsp"></jsp:include>
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
                        <h5>Add Drivers Info</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/vts/drivers-list">Drivers </a></li>
                            <li class="breadcrumb-item active">Add New Driver</li>
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
                    <div class="col-md-3 col-lg-3 col-sm-12">
                        <div class="card b2b-custom-card p-2">
                            <a class="active-form" href="${pageContext.request.contextPath}/vts/add-driver-info">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number active float-left" id="basic_tab_btn">1</div>
                                    <div class="tab-custom-text">General Info</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-driver-license">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left" id="license_tab_btn">2</div>
                                    <div class="tab-custom-text">License Info</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-driver-additional-info">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left" id="additional_tab_btn">3</div>
                                    <div class="tab-custom-text">Additional Info</div>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-md-9 col-lg-9 col-sm-12">
                        <div id="createSrNotification"></div>
                        <%--Driver basic info card--%>
                        <div class="card b2b-custom-card active-form" id="driver-basic-form-card">
                            <div class="card-body">
                                <div class="card-head-custom">
                                    <div class="float-left">
                                        <h3 class="b2b-font-20-500 black-10 float-left">General Info</h3>
                                    </div>
                                </div>

                                <hr>

                                <form class="form-horizontal b2b-custom-form" id="driver_basic_info">
                                    <div class="form-group">
                                        <label>Name <span class="text-red">*</span></label>
                                        <input type="text" class="form-control" required id="name" placeholder="Write here">
                                    </div>
                                    <div class="form-group">
                                        <label>Date of Birth</label>
                                        <input type="date" class="form-control" id="dob" placeholder="Select Date">
                                    </div>
                                    <div class="form-group">
                                        <label>Phone Number <span class="text-red">*</span></label>
                                        <input type="text" class="form-control" required id="mobile_number" placeholder="Ex:01777-111111">
                                    </div>
                                    <div class="form-group">
                                        <label>Email <span class="text-red">*</span></label>
                                        <input type="email" class="form-control" id="email" required placeholder="Enter email address">
                                    </div>
                                    <div class="form-group">
                                        <label>Designation</label>
                                        <input type="text" class="form-control" id="designation" placeholder="Write here">

                                    </div>
                                </form>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <button class="btn b2b-btn-submit-blue" onclick="driverBasicInfoSubmit()" id="driver_basic_info_submit_btn">Add Entry</button>
                                        <button class="btn b2b-btn-submit-blue" id="next_page">Next</button>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <%--Driver license info card--%>
                        <div class="card b2b-custom-card" id="driver-license-form-card">
                            <div class="card-body">
                                <div class="card-head-custom">
                                    <div class="float-left">
                                        <h3 class="b2b-font-20-500 black-10 float-left">License Info</h3>
                                    </div>
                                </div>
                                <hr>
                                <form class="form-horizontal b2b-custom-form" id="driver_license_info">
                                    <div class="form-group">
                                        <label>License Number  <span class="text-red">*</span></label>
                                        <input type="text" class="form-control" id="license_no" placeholder="Write here">
                                    </div>
                                    <div class="form-group">
                                        <label>Issue Date  <span class="text-red">*</span></label>
                                        <input type="date" class="form-control" id="license_issue_date" placeholder="Select date">
                                    </div>
                                    <div class="form-group">
                                        <label>Expiry Date  <span class="text-red">*</span></label>
                                        <input type="date" class="form-control" id="license_expired_date" placeholder="Select date">
                                    </div>
                                    <div class="form-group">
                                        <label>Driving License (Front)</label>
                                        <input type="file" class="form-control" id="license_front" placeholder="Uploaded file have to be less than 10MB">
                                    </div>
                                    <div class="form-group">
                                        <label>Driving License (Back)</label>
                                        <input type="file" class="form-control" id="license_back" placeholder="Uploaded file have to be less than 10MB">
                                    </div>
                                </form>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <button class="btn b2b-btn-submit-blue" id="driverLicenseSubmitBtn" onclick="driverLicenseSubmit()">Add License Entry</button>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <%--Driver Additional Info--%>
                        <div class="card b2b-custom-card" id="driver-additional-form-card">
                            <div class="card-body">
                                <div class="card-head-custom">
                                    <div class="float-left">
                                        <h3 class="b2b-font-20-500 black-10 float-left">Additional Info</h3>
                                    </div>
                                </div>

                                <hr>

                                <form class="form-horizontal b2b-custom-form" id="driver-additional-info">
                                    <div class="form-group">
                                        <label>Reports To <span class="text-red">*</span></label>
                                        <select class="form-control" id="reports_to" required>
                                            <option>Chose Manager</option>
                                            <option value="1/Hasan.Mahmud">Hasan.Mahmud</option>
                                            <option value="3/Shamim.Reza">Shamim.Reza</option>
                                            <option value="2/zakaria.ahmed">zakaria.ahmed</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Notes</label>
                                        <textarea type="text" class="form-control" id="additional_note" placeholder="Write here"></textarea>
                                    </div>
                                </form>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <button class="btn b2b-btn-submit-blue" id="driverAdditionalSubmit" onclick="driverAdditionalSubmit()">Add Entry</button>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">

<script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
<link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />

<script>
    const base_url = $("#domain_url").val() + "/";
    const form_tracker = {
        basic: false,
        license: false,
        additional: false,
        id: ''
    };
    $( document ).ready(function() {
        showSubmitBtn();
        $(".select2").select2();
        /*$("#license_front").dropzone();
        $("#license_back").dropzone();*/
        $(".loader_body").hide();
    });

    function driverBasicInfoSubmit(){
        $(".loader_body").show();

        if($("#driver_basic_info").parsley().validate()){

            let driverBasicInfo = {
                name: $("#name").val(),
                mobile_number: $("#mobile_number").val(),
                dob: $( "#dob" ).val(),
                email: $("#email").val(),
                designation: $("#designation").val(),
            }

            $.ajax({
                type: 'POST',
                url: base_url + "api/web/VTS/driver/save-basic-info",
                data: {driverBasicInfo: JSON.stringify(driverBasicInfo)},
                success: function (resultData) {
                    $(".loader_body").hide();
                    if (resultData.code === 200) {
                        let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        //$("#notification_bar").show();
                        $("#createSrNotification").html(custom_msg);
                        clearBasicForm();
                        switchLicenseForm();
                        form_tracker.id = resultData.data;
                        form_tracker.basic = true;
                    } else {
                        $(".loader_body").hide();
                        let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        $("#createSrNotification").html(custom_msg);
                    }
                },
                error: function (resultData) {
                    $(".loader_body").hide();
                    let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                    $("#createSrNotification").html(custom_msg);
                    $(window).scrollTop(0);
                }
            });
        } else{
            $(".loader_body").hide();
        }
    }

    function driverLicenseSubmit(){
        $(".loader_body").show();

        if($("#driver_license_info").parsley().validate()){

            let driverLicenseInfo = {
                license_no: $("#license_no").val(),
                license_type: $("#license_type").val(),
                license_issue_date: $( "#license_issue_date" ).val(),
                license_expired_date: $("#license_expired_date").val(),
            }

            $.ajax({
                type: 'POST',
                url: base_url + "api/web/VTS/driver/update-license-info",
                data: {driverLicenseInfo: JSON.stringify(driverLicenseInfo), id: parseInt(form_tracker.id)},
                success: function (resultData) {
                    $(".loader_body").hide();
                    if (resultData.code === 200) {
                        let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        //$("#notification_bar").show();
                        $("#createSrNotification").html(custom_msg);
                        clearLicenseForm();
                        switchAdditionalForm();
                        form_tracker.id = resultData.data;
                        form_tracker.license = true;
                    } else {
                        $(".loader_body").hide();
                        let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver License info update request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        $("#createSrNotification").html(custom_msg);
                    }
                },
                error: function (resultData) {
                    $(".loader_body").hide();
                    let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver License info update request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                    $("#createSrNotification").html(custom_msg);
                    $(window).scrollTop(0);
                }
            });
        } else{
            $(".loader_body").hide();
        }
    }

    function driverAdditionalSubmit(){
        $(".loader_body").show();

        if($("#driver-additional-info").parsley().validate()){

            let driverAdditionalInfo = {
                additional_note: $("#additional_note").val(),
                report_manager_id: $("#license_type").val(),
                report_manager_name: $( "#license_issue_date" ).val()
            }

            $.ajax({
                type: 'POST',
                url: base_url + "api/web/VTS/driver/update-additional-info",
                data: {driverAdditionalInfo: JSON.stringify(driverAdditionalInfo), id: parseInt(form_tracker.id)},
                success: function (resultData) {
                    $(".loader_body").hide();
                    if (resultData.code === 200) {
                        let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        //$("#notification_bar").show();
                        $("#createSrNotification").html(custom_msg);
                        clearAdditionalForm();
                        switchSuccess();
                        form_tracker.id = resultData.data;
                        form_tracker.additional = true;
                    } else {
                        $(".loader_body").hide();
                        let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver License info update request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        $("#createSrNotification").html(custom_msg);
                    }
                },
                error: function (resultData) {
                    $(".loader_body").hide();
                    let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver License info update request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                    $("#createSrNotification").html(custom_msg);
                    $(window).scrollTop(0);
                }
            });
        } else{
            $(".loader_body").hide();
        }
    }

    function clearBasicForm() {
        $('#driver_basic_info').parsley().reset();
        $('#driver_basic_info').trigger("reset");
    }

    function clearAdditionalForm(){
        $('#driver-additional-info').parsley().reset();
        $('#driver_additional_info').trigger("reset");
    }

    function clearLicenseForm() {
        $('#driver_license_info').parsley().reset();
        $('#driver_license_info').trigger("reset");
    }

    function switchNextBtn(){
        $("#driver_basic_info_submit_btn").hide();
        $("#next_page").show();
    }
    function showSubmitBtn(){
        $("#driver_basic_info_submit_btn").show();
        $("#next_page").hide();
    }
    function switchLicenseForm(){
        $("#driver-basic-form-card").removeClass("active-form");
        $("#driver-additional-form-card").removeClass("active-form");
        $("#driver-license-form-card").addClass("active-form");
        $("#basic_tab_btn").addClass("active");
        $("#license_tab_btn").addClass("active");
        $("#additional_tab_btn").removeClass("active");
    }
    function switchBasicForm(){
        $("#driver-basic-form-card").addClass("active-form");
        $("#driver-additional-form-card").removeClass("active-form");
        $("#driver-license-form-card").removeClass("active-form");
        $("#basic_tab_btn").addClass("active");
        $("#basic_tab_btn").addClass("active");
        $("#license_tab_btn").removeClass("active");
        $("#additional_tab_btn").removeClass("active");
    }
    function switchAdditionalForm(){
        $("#driver-basic-form-card").removeClass("active-form");
        $("#driver-additional-form-card").addClass("active-form");
        $("#driver-license-form-card").removeClass("active-form");
        $("#basic_tab_btn").addClass("active");
        $("#license_tab_btn").addClass("active");
        $("#additional_tab_btn").addClass("active");
    }
    function switchSuccess(){
        $("#driver-basic-form-card").removeClass("active-form");
        $("#driver-additional-form-card").removeClass("active-form");
        $("#driver-license-form-card").removeClass("active-form");
        $("#basic_tab_btn").addClass("active");
        $("#license_tab_btn").addClass("active");
        $("#additional_tab_btn").addClass("active");
    }

</script>


</body>

</html>


