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
  </style>

</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">



  <!-- Navbar -->
  <jsp:include page="./../../partial_new/loader.jsp"></jsp:include>
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
            <h5>Order Management (B2C - GPC)</h5>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Cloud </a></li>
              <li class="breadcrumb-item active">Order Management (B2C - GPC)</li>
            </ol>
          </div>
          <div class="col-md-6">
            <div class="float-right">
              <button data-toggle="modal" data-target="#newOrderEntry" class="btn b2b-btn-submit-blue mr-2"> Add New Order</button>
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

            <div id="createSrNotification"></div>

            <div class="card">
              <div class="card-body">
                <div class="card-head-custom">
                  <div class="float-left">
                    <h3 class="b2b-font-20-500 black-10 float-left">Order and Installation List</h3>
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
                          <th>TRXID</th>
                          <th>Cloud ID</th>
                          <th>VTS Sim</th>
                          <th>SIM KIT</th>
                          <th>Pack/Service</th>
                          <th>Vendor</th>
                          <th>Status</th>
                          <th>Product</th>
                          <th>Rate Plan</th>
                          <th>Order Excel</th>
                          <th>Action</th>
                          </thead>
                          <tbody>

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
          <h4 class="modal-title float-left" id="myModalLabel2">Order Entry</h4>
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
          <form class="form-horizontal b2b-custom-form" id="create_order_form">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="customer_name">Customer name <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="customer_name" placeholder="Select" required>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="address">Address <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="address" placeholder="Select" required>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_type">Product Type <span class="text-danger"> *</span></label>
                    <select class="form-control" id="product_type" required>
                      <option value="1">SIM Less</option>
                      <option value="2">SIM Based</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="vts_sim">VTS Sim</label>
                    <input type="text" class="form-control" id="vts_sim" placeholder="Select">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="kcp_contact_num">Contact Number <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="kcp_contact_num" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_name">Product Name</label>
                    <input type="text" class="form-control" id="product_name" placeholder="Select">
                  </div>
                </div>

              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>
          <button type="submit" class="btn btn-primary b2b-submit-btn-base" onclick="createNewOrder()">Add Entry</button>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="./../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
  <!-- Control sidebar content goes here -->
</aside>
<!-- /.control-sidebar -->


<!-- Modal -->

<!-- ./wrapper -->

<jsp:include page="./../../partial_new/script.jsp" />
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">


<noscript>
  $( document ).ready(function() {
    $(".loader_body").hide();
  });
</noscript>

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

    getOrderData();


  });

  function getOrderData() {
    $(".loader_body").show();

    $.ajax({
      type: 'get',
      url: base_url + "api/web/orders/b2c-gpc/listDT",
      success: function (data) {
        $(".loader_body").hide();
        initOrderTable(data.data);
      },
      error: function (error) {
        $(".loader_body").hide();
      }
    });
  }

  function initOrderTable(data) {
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
        {data: 'id'},
        {data: 'chtTicket'},
        {data: 'vts_sim'},
        {data: 'sim_kit'},
        {data: 'product_type'},
        {
          data: 'product_type',
          render: function (data, type, full, row) {
            return "Kite & CO";
          }
        },

        {data: 'status',
          autowidth: true,
          render: function (data, type, full, row) {
            if (data == 1) {
              return '<button class="btn btn-info btn-sm">New Order</button>';
            } else if(data == 2){
              return '<button class="btn btn-dark btn-sm">Scheduled</button>';
            } else if(data == 3){
              return '<button class="btn btn-danger btn-sm">Sim Active</button>';
            } else if(data == 4){
              return '<button class="btn btn-warning btn-sm">Installation</button>';
            } else if(data == 5){
              return '<button class="btn btn-primary btn-sm">Finalization</button>';
            }else{
              return '<button class="btn btn-success btn-sm">Onboarded</button>';
            }
          }},

        {data: 'pack_name'},
        {data: 'rate_plan_name'},
        {
          data: 'id',
          render: function (data, type, full, row){
            return '<button class="btn btn-default btn-sm">Download Excel</button>';
          }
        },
        {
          data: 'id',
          render: function (data, type, full, row){
            return '<button class="btn btn-dark btn-sm">Change Status</button>';
          }
        }
      ]
    });

  }

  $('#dataTable tbody').on( 'click', 'tr', function () {
    console.log(dataTable.row( this ).data());

  } );

  function createNewOrder(){
    $(".loader_body").show();

    if($("#create_order_form").parsley().validate()){

      let orderInfo = {
        customer_name: $("#customer_name").val(),
        kcp_contact_num: $("#kcp_contact_num").val(),
        address: $( "#address" ).val(),
      }


      $.ajax({
        type: 'POST',
        url: base_url + "api/web/orders/b2c-gpc/save",
        data: {orderInfo: JSON.stringify(orderInfo)},
        success: function (resultData) {
          $(".loader_body").hide();
          if (resultData.code === 200) {
            let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
            //$("#notification_bar").show();
            $("#createSrNotification").html(custom_msg);
            modalClose()
          } else {
            $(".loader_body").hide();
            let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
            $("#createSrNotification").html(custom_msg);
            modalClose()
          }
        },
        error: function (resultData) {
          $(".loader_body").hide();
          let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
          $("#createSrNotification").html(custom_msg);
          modalClose()
        }
      });
    } else{
      $(".loader_body").hide();
    }
  }

  function modalClose(){
    $("#newOrderEntry").modal('hide');
  }


</script>

</body>

</html>


