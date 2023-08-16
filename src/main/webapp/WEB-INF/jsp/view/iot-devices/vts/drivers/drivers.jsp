<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 5/22/2023
  Time: 5:22 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <h5>Vehicle List</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Devices </a></li>
                            <li class="breadcrumb-item active">Driver List</li>
                        </ol>
                    </div>
                    <div class="col-md-6">
                        <div class="float-right">
                            <a href="${pageContext.request.contextPath}/vts/add-driver-info"class="btn b2b-btn-submit-blue mr-2"><i class="fa fa-plus-circle"></i> Add New Entry</a>
                        </div>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left">Driver List</h3>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-12 col-md-8 col-lg-8">
                                        <!-- select -->
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Select Resources</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-lg-4 col-sm-12 float-right">
                                        <!-- Actual search box -->
                                        <div class="form-group has-search">
                                            <span class="fa fa-search form-control-feedback"></span>
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                    </div>


                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="row">
                                            <div class="table-responsive">
                                                <table class="table" id="dataTable">
                                                    <thead class="b2b-custom-boder">
                                                    <th>Name</th>
                                                    <th>Phone Number</th>
                                                    <th>License Number</th>
                                                    <th>Joined Date</th>
                                                    <th>Status</th>
                                                    </thead>
                                                    <tbody>
                                                    <%--<tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Emma Smith</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">emmasmith@gmail.com</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>01715875858</td>
                                                        <td>CS76786H9898321</td>
                                                        <td>3rd July 2023</td>

                                                        <td><span class="right badge badge-green">Active</span></td>
                                                        <td>
                                                            <button class="btn b2b-btn-submit-blue-small">Actions <i class="fa fa-plus-circle"></i></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Emma Smith</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">emmasmith@gmail.com</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>01715875858</td>
                                                        <td>CS76786H9898321</td>
                                                        <td>3rd July 2023</td>

                                                        <td><span class="right badge badge-green">Active</span></td>
                                                        <td>
                                                            <button class="btn b2b-btn-submit-blue-small">Actions <i class="fa fa-plus-circle"></i></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Emma Smith</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">emmasmith@gmail.com</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>01715875858</td>
                                                        <td>CS76786H9898321</td>
                                                        <td>3rd July 2023</td>

                                                        <td><span class="right badge badge-green">Active</span></td>
                                                        <td>
                                                            <button class="btn b2b-btn-submit-blue-small">Actions <i class="fa fa-plus-circle"></i></button>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Emma Smith</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">emmasmith@gmail.com</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>01715875858</td>
                                                        <td>CS76786H9898321</td>
                                                        <td>3rd July 2023</td>

                                                        <td><span class="right badge badge-green">Active</span></td>
                                                        <td>
                                                            <button class="btn b2b-btn-submit-blue-small">Actions <i class="fa fa-plus-circle"></i></button>
                                                        </td>
                                                    </tr>--%>

                                                    </tbody>
                                                </table>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">

<script>
    const base_url = $("#domain_url").val() + "/";
    let dataTable;
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

        getDriversData();


    });

    function getDriversData() {
        $(".loader_body").show();

        $.ajax({
            type: 'get',
            url: base_url + "api/web/VTS/driver/listDT",
            success: function (data) {
                $(".loader_body").hide();
                initUserTable(data.data);
            },
            error: function (error) {
                $(".loader_body").hide();
            }
        });
    }

    function initUserTable(data) {
        "use strict";
        if ($.fn.dataTable.isDataTable('#dataTable')) {
            $('#dataTable').DataTable().clear();
            $('#dataTable').DataTable().destroy();
        }
        dataTable = $('#dataTable').DataTable({
            paging: true,
            lengthChange: false,
            searching: false,
            ordering: true,
            info: true,
            autoWidth: false,
            responsive: true,
            data: data,
            order: [[3, 'desc']],
            select:true,
            columns: [
                {data: 'name'},
                {data: 'mobile_number'},
                {data: 'license_no'},
                {data: 'join_date',
                    autowidth: true,
                    render: function (data, type, full, row) {
                        let date_str = new Date(data);
                        return type === 'sort' ? data:date_str.toLocaleString();
                    }
                },
                {data: 'active',
                    autowidth: true,
                    render: function (data, type, full, row) {
                        if (data == true) {
                            return '<span class="right badge badge-info">In Service</span>';
                        } else if(data == false){
                            return '<span class="right badge badge-warning">Out of Service</span>';
                        }else{
                            return '<span class="right badge badge-danger">N/A</span>';
                        }
                    }},
            ]
        });

    }

    /*dataTable.on('click', 'tbody tr', (e) => {
        let classList = e.currentTarget.classList;

        if (classList.contains('selected')) {
            classList.remove('selected');
        }
        else {
            dataTable.api().rows('.selected').nodes().each((row) => row.classList.remove('selected'));
            classList.add('selected');
            console.log("data::"+ dataTable.rows({selected:  true}).data())
            console.log("data::"+ dataTable.rows({selected:  true}).data()[0])

           // dataTable.rows({selected:  true}).data().name

            JSON.parse(dataTable.rows({selected:  true}).data()).name;
        }

        console.log("Data row selected");
    } );*/

    $('#dataTable tbody').on( 'click', 'tr', function () {
        console.log(dataTable.row( this ).data());

    } );



</script>

</body>

</html>


