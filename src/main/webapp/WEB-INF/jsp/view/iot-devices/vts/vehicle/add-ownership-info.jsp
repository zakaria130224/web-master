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
                        <h5>View User Details</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Devices </a></li>
                            <li class="breadcrumb-item active">VTS</li>
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
                            <a class="active-form" href="${pageContext.request.contextPath}/vts/add-vehicle-type">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left"><i class="fa fa-check"></i></div>
                                    <div class="tab-custom-text">Vehicle Type</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-vehicle-info">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left"><i class="fa fa-check"></i></div>
                                    <div class="tab-custom-text">Additional Info</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-vehicle-purchase-info">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left"><i class="fa fa-check"></i></div>
                                    <div class="tab-custom-text">Purchase Info</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-ownership-info">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number active float-left">4</div>
                                    <div class="tab-custom-text">Ownership Type</div>
                                </div>
                            </a>
                            <a class="" href="${pageContext.request.contextPath}/vts/add-linked-device">
                                <div class="card-body card-body-form-tab">
                                    <div class="tab-custom-number float-left">5</div>
                                    <div class="tab-custom-text">Linked Vehicles</div>
                                </div>
                            </a>

                        </div>
                    </div>

                    <div class="col-md-9 col-lg-9 col-sm-12">
                        <div class="card b2b-custom-card">
                            <div class="card-body">
                                <div class="card-head-custom">
                                    <div class="float-left">
                                        <h3 class="b2b-font-20-500 black-10 float-left">Ownership Type</h3>
                                    </div>
                                </div>

                                <hr>

                                <form class="form-horizontal b2b-custom-form">
                                    <div class="form-group">
                                        <label>Owner</label>
                                        <select class="form-control">
                                            <option>Select owner</option>
                                        </select>
                                    </div>
                                </form>

                                <div class="row">
                                    <div class="col-md-12 text-right">
                                        <button class="btn b2b-btn-submit-blue">Add Entry</button>
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

<script>
    $( document ).ready(function() {
        $(".select2").select2();
        $("#dataTable").dataTable({
            paging: true,
            lengthChange: false,
            searching: false,
            ordering: true,
            info: true,
            autoWidth: false,
            responsive: true,
        });

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

</body>

</html>


