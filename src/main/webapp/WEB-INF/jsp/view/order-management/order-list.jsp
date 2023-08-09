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
    <title>VTS - Maintenance</title>

    <jsp:include page="./../../partial_new/header-link.jsp"></jsp:include>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/modal-style.css">

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

        .btn-download {

            border: none;
            color: black;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 14px;
            border-radius: 8px;
            border: 1px solid black;
        }

        .btn-custom-dark-blue{
            height: 36px;
            border: 1px solid black;
            border-radius: 8px;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: 700;
            padding-right: 20px;
            padding-left: 20px;
            background: #000F3C;
        }

        .btn-custom-grey{
            height: 36px;
            border: 1px solid grey;
            border-radius: 8px;
            color: #FFFFFF;
            font-size: 12px;
            font-weight: 700;
            padding-right: 20px;
            padding-left: 20px;
            background: grey;
        }
    </style>

</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <jsp:include page="./../../partial_new/nevbar.jsp"></jsp:include>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->

    <jsp:include page="./../../partial_new/aside.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-1">
                    <div class="col-sm-6">
                        <h5>Order Management</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Cloud </a></li>
                            <li class="breadcrumb-item active">Order Management</li>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left">Order and Installation Management</h3>
                                    </div>
                                    <div class="float-right">
                                        <button type="submit" class="btn btn-sm btn-custom-dark-blue mr-2" data-toggle="modal" data-target="#newOrderEntry"><i class="fa fa-plus-circle"></i> Add New Entry</button>
                                        <button type="submit" class="btn btn-sm btn-custom-dark-blue"><i class="fa fa-download"></i> Export</button>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-12 col-md-8 col-lg-8">
                                        <!-- select -->
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>All Order</option>
                                            </select>
                                        </div>

                                        <div class="form-group float-left mr-2">
                                            <div class="input-group">
                                                <button type="button" class="btn btn-default pull-right btn-rounded" id="daterange-btn">
                                                        <span>
                                                          Today
                                                        </span>
                                                    <i class="fa fa-calendar"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Order Status</option>
                                            </select>
                                        </div>
                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Vendor</option>
                                            </select>
                                        </div>

                                        <div class="form-group float-left mr-2">
                                            <select class="form-control select2">
                                                <option>Product</option>
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

                                    <div class="row mt-4 mx-3">
                                        <h6>417 Results Found</h6>
                                    </div>


                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="row">
                                            <div class="table-responsive">
                                                <table class="table" id="dataTableMaintenance">
                                                    <thead class="b2b-custom-boder">
                                                    <th>Ticket No</th>
                                                    <th>Date</th>
                                                    <th>VTS SIM</th>
                                                    <th>Pack/<br>Service</th>
                                                    <th>SIM Kit</th>
                                                    <th>Product</th>
                                                    <th>Vendor</th>
                                                    <th>Status</th>
                                                    <th>Rate Plan</th>
                                                    <th>Order Excel</th>
                                                    <th>Actions</th>

                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>
<%--                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>--%>
<%--                                                            <div class="b2b-list-block">--%>
<%--                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>--%>
<%--                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">CSD4345354345t</p>--%>
<%--                                                            </div>--%>
                                                            82093402999
                                                        </td>
                                                        <td>3rd May, 2023</td>
                                                        <td>017155812091</td>
                                                        <td>Basic</td>
                                                        <td>129210919919123</td>
                                                        <td>IoT VTS Wired</td>
                                                        <td>Kite N Co</td>
                                                        <td><button type="button" class="btn btn-primary">
                                                            New Order
                                                        </button></td>
                                                        <td>IoT VTS Wired</td>
                                                        <td><button class="btn btn-download"><i class="fa fa-download"></i> Download</button></td>
                                                        <td><button type="button" class="btn" style="background-color: #000F3C;color: #F2FCFF" id="changeStatus">
                                                            Change Status
                                                        </button></td>
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

    <div class="modal left fade" id="newOrderEntry" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="myModalLabel1">Add New Order</h4>
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
                <div class="modal-body">
                    <form class="form-horizontal b2b-custom-form">
                        <div class="card-body p-0">
                            <div class="row">
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="vehicle_type">Select Vehicle</label>--%>
<%--                                        <input type="text" class="form-control" id="vehicle_type_d" placeholder="Select">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="expense_type">Type</label>--%>
<%--                                        <input type="text" class="form-control" id="expense_type_d" placeholder="Select">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="ticket_number">Ticket Number</label>
                                        <input type="text" class="form-control" name="ticket_number" id="ticket_number"  placeholder="Select">
                                    </div>
                                </div>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="quantity">Expense Unit Price (BDT)</label>--%>
<%--                                        <input type="text" class="form-control" id="quantity_d" placeholder="Type">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="cost">Total Price (BDT)</label>--%>
<%--                                        <input type="text" class="form-control" id="cost_d" placeholder="Type">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Upload File(.xlxs)</label>
                                        <input type="file" class="form-control" id="upload_file" placeholder="Uploaded file have to be less than 10MB">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="user_password">User Password</label>
                                        <input type="password" name="user_password" id= "user_password" class="form-control" placeholder="Password">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-custom-dark-blue float-left mr-2">Close</button>
<%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-danger float-left mr-2">Delete</button>--%>
                    <button type="submit" class="btn btn-custom-dark-blue">Add New Order</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal left fade" id="changeStatusModal" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="myModalLabel2">Change Status</h4>
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
                <div class="modal-body">
                    <form class="form-horizontal b2b-custom-form">
                        <div class="card-body p-0">
                            <div class="row">
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="vehicle_type">Select Vehicle</label>--%>
<%--                                        <input type="text" class="form-control" id="vehicle_type" placeholder="Select">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="expense_type">Type</label>--%>
<%--                                        <input type="text" class="form-control" id="expense_type" placeholder="Select">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="update_status">Update Status</label>
                                        <select name="update_status" id="update_status" class="form-control">
                                            <option value="new_order">New Order</option>
                                            <option value="in_progress">In Progress</option>
                                        </select>
                                    </div>
                                </div>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="quantity">Expense Unit Price (BDT)</label>--%>
<%--                                        <input type="text" class="form-control" id="quantity" placeholder="Type">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-6">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="cost">Total Price (BDT)</label>--%>
<%--                                        <input type="text" class="form-control" id="cost" placeholder="Type">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="add_note">Add Note</label>
                                        <textarea type="text" class="form-control" name="add_note" id="add_note" placeholder="Add Note"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="user_otp">User OTP</label>
                                        <input type="password" class="form-control" name="user_otp" id="user_otp" placeholder="Type">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
<%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
                    <button type="submit" class="btn btn-custom-grey">Update</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="./../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->



<!-- Modal -->

<!-- ./wrapper -->

<jsp:include page="./../../partial_new/script.jsp" />
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">

<script>
    $( document ).ready(function() {
        $(".select2").select2();
        const dataTableMaintenance = $("#dataTableMaintenance").dataTable({
            paging: true,
            lengthChange: false,
            searching: false,
            ordering: true,
            info: true,
            autoWidth: false,
            responsive: true,
            select:true
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

        /*$( "#dataTablePaper tbody" ).on('click tr', function() {
            const rowData = dataTablePaper.api().row( this ).data();
            alert("Click received on: " + rowData);
            console.log(rowData.row());
        });*/

        dataTableMaintenance.on('click', 'tbody tr', (e) => {
            let classList = e.currentTarget.classList;

            if (classList.contains('selected')) {
                classList.remove('selected');
            }
            else {
                dataTableMaintenance.api().rows('.selected').nodes().each((row) => row.classList.remove('selected'));
                classList.add('selected');
            }
            console.log(dataTableMaintenance.api().rows( { selected: true } ).data())
            $("#addOrderEntry").modal("show");
        } );
    });

</script>

<script>
    $(document).ready(function() {
        $('#changeStatus').click(function(e) {
            // alert(1);
           // $('#vehicleDetails').modal('hide');
            $("#changeStatusModal").modal("show");
        });
    });
</script>

</body>

</html>

