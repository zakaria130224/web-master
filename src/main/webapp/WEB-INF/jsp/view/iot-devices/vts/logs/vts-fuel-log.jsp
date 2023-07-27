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

                    <div class="col-sm-6 text-right">
                        <button  class="btn btn-sm btn-custom-blue">Add New Entry</button>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left">Fuel Log</h3>
                                    </div>
                                    <div class="float-right">
                                        <a href="#" class="btn btn-sm btn-custom-blue">Explore in PDF</a>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-12 col-md-8 col-lg-8">
                                        <!-- select -->
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>All Resources</option>
                                            </select>
                                        </div>

                                        <div class="form-group float-left mr-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-default pull-right btn-rounded" id="daterange-btn">
                                                        <span>
                                                          Date Range
                                                        </span>
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Option</option>
                                            </select>
                                        </div>
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Option</option>
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
                                                    <th>Vehicle</th>
                                                    <th>Driver</th>
                                                    <th>Odometer Reading</th>
                                                    <th>Start Time</th>
                                                    <th>End Time</th>
                                                    <th>Time</th>
                                                    <th>Distance</th>
                                                    <th>Alert</th>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">Light Demo</p>
                                                                    <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Motijheel</td>
                                                        <td>Badda</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>10:12 am, 2 Apr 2023</td>
                                                        <td>1h 30m</td>
                                                        <td>6.8 Km</td>
                                                        <td>6</td>
                                                    </tr>
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
