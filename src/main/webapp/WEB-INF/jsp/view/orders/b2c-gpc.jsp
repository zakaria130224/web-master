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
    .btn-b2b-sm{
      border-radius: 6px;
      padding: 12px 20px 12px 20px;
      color: #FFF;
      font-size: 15px;
      font-weight: 600;
    }
    .btn-disabled{
      pointer-events: none;
    }
    .btn-b2b-sm-download{
      background: #FFF;
      color: #000F3C;
      border-color: #000F3C;
    }
    .btn-b2b-sm-base, .btn-b2b-sm-base:hover{
      background: #000F3C;
      color: #FFF;
      border-color: #000F3C;
    }
    .card-head-custom{
      height: auto;
    }
    table.dataTable td {
      white-space: nowrap;
      vertical-align: middle;
    }
    .btn-b2b-sm-base, .btn-b2b-sm-base:hover {
      background: #000F3C;
      color: #FFF;
      border-color: #000F3C;
      height: 40px;
      padding: 7px 20px 7px 20px;
      border-radius: 8px;
    }

    .btn-b2b-sm-base-36, .btn-b2b-sm-base-36:hover {
      background: #000F3C;
      color: #FFF;
      border-color: #000F3C;
      height: 36px;
      padding: 7px 20px 7px 20px;
      border-radius: 8px;
    }

    .select2-container--default.select2-container--disabled .select2-selection--single {
      background-color: #918F92;
      cursor: default;
      height: 40px;
      padding: 8px 10px;
    }

    .select2-container--default.select2-container--focus .select2-selection--multiple, .select2-container--default.select2-container--focus .select2-selection--single {
      border-color: #918F92;
      height: 40px;
    }
    .select2-container--default .select2-selection--single {
      border-radius: 8px;
      height: 40px;
    }
    .bh-40{
      height: 40px;
    }
    .btn-b2b-sm {
      border-radius: 8px;
      padding: 8px 20px 8px 20px;
    }
    #schedule_div, #first_contact_div{
      display: none;
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
          <div class="col-md-6 col-sm-12">
            <h5>Order Management (B2C - GPC)</h5>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Cloud </a></li>
              <li class="breadcrumb-item active">Order Management (B2C - GPC)</li>
            </ol>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="float-right">
              <button data-toggle="modal" class="btn b2b-btn-submit-blue mr-2" onclick="openCreateOrderModal()"> Add New Order</button>
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

                  <div class="row">
                    <div class="col">
                      <div class="float-left">
                        <h3 class="b2b-font-20-500 black-10 float-left pt-2">Order and Installation List</h3>
                      </div>
                    </div>
                    <div class="col">
                      <div class="float-right mr-5">
                        <div class="btn-group">
                          <button type="button" class="btn btn-b2b-sm btn-b2b-sm-base btn-sm change-status dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="padding-left:30px; padding-right: 30px">
                            Export
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Export in PDF</a>
                            <a class="dropdown-item" href="#">Export in Excel</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <hr>

                <div class="row">

                  <div class="col-sm-12 col-md-12 col-lg-12">
                    <!-- select -->
                    <div class="form-group float-left mr-2 mb-2">
                      <select class="form-control select2" id="order_type" disabled>
                        <option value="gpc_">B2C GPC</option>
                      </select>
                    </div>
                    <div class="form-group float-left mr-2 mb-2">
                      <div class="input-group">
                        <button type="button" class="btn btn-default pull-right btn-rounded bh-40" id="date_range" style="border-radius: 8px">
                          <span>Date Range</span>
                          <i class="fa fa-calendar"></i>
                        </button>
                      </div>
                    </div>
                    <div class="form-group float-left mr-2 mb-2">
                      <select class="form-control select2" id="search_status_input">

                      </select>
                    </div>
                    <div class="form-group float-left mr-2 mb-2">
                      <select class="form-control select2" id="search_vendor_input">

                      </select>
                    </div>

                    <div class="form-group float-left mr-2 mb-2">
                      <select class="form-control select2" id="search_product_input">

                      </select>
                    </div>

                    <div class="form-group float-left mr-2 mb-2">
                      <button class="btn btn-b2b-sm-base" onclick="getCustomOrderData()" style="border-radius: 8px">Search</button>
                    </div>
                    <div class="form-group float-left mr-2 mb-2">
                      <button class="btn btn-b2b-sm-base" onclick="getOrderData()" style="border-radius: 8px">Reset</button>
                    </div>
                  </div>

                  <%--<div class="col-md-4 col-lg-4 col-sm-12 float-right">
                    <!-- Actual search box -->
                    <div class="form-group has-search">
                      <span class="fa fa-search form-control-feedback"></span>
                      <input type="text" class="form-control" placeholder="Search">
                    </div>
                  </div>--%>


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
                          <th>Type</th>
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
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="myModalLabel3">Order Entry</h4>
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
                    <label for="product_name">Product Name</label>
                    <input type="hidden" id="ratePlan">
                    <select class="form-control" id="product_name" required>
                      <option>Please select product</option>

                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_type">Product Type</label>
                    <select class="form-control" id="product_type" disabled>
                      <option>Please select</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="vendor_name">Vendor Name</label>
                    <select class="form-control" id="vendor_name" disabled>
                      <option>Please select</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12" id="vts_sim_block">
                  <div class="form-group">
                    <label for="vts_sim">VTS Sim</label>
                    <input type="text" class="form-control" id="vts_sim" placeholder="Select">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="customer_contact_number">Contact Number <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="customer_contact_number" placeholder="Select" required>
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

  <div class="modal left fade" id="showOrderDetails" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="myModalLabel4">Order Entry</h4>
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
          <form class="form-horizontal b2b-custom-form" id="details_order_form">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_updated_date">Last Status Change Date</label>
                    <input type="text" class="form-control" id="d_updated_date" placeholder="Select" disabled>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_cloud_id">Cloud ID</label>
                    <input type="text" class="form-control" id="d_cloud_id" placeholder="Select" disabled>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_trxid">TRXID </label>
                    <input type="text" class="form-control" id="d_trxid" placeholder="Select" disabled>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_customer_name">Customer Name </label>
                    <input type="text" class="form-control" id="d_customer_name" placeholder="Select" disabled>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_address">Address </label>
                    <input type="text" class="form-control" id="d_address" disabled>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_pack">Pack/Service</label>
                    <input type="text" class="form-control" id="d_pack" disabled>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_product_name">Product Name</label>
                    <input type="text" class="form-control" id="d_product_name" disabled>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_product_type">Product Type</label>
                    <input type="text" class="form-control" id="d_product_type" disabled>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_vendor_name">Vendor Name</label>
                    <input type="text" class="form-control" id="d_vendor_name" disabled>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_rate_plan">Rate Plan </label>
                    <input type="text" class="form-control" id="d_rate_plan" placeholder="Select" disabled>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="d_customer_contact">Customer Contact </label>
                    <input type="text" class="form-control" id="d_customer_contact" placeholder="Select" disabled>
                  </div>
                </div>

              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal left fade" id="changeStatus" tabindex="" role="dialog" aria-labelledby="changeStatus" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="myModalLabel2">Update Status</h4>
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
          <form class="form-horizontal b2b-custom-form" id="update_order_form">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="current_status">Current Status </label>
                    <input type="hidden" id="row_id">
                    <select class="form-control" id="current_status" disabled>

                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="updated_status">Update Status <span class="text-danger"> *</span></label>
                    <select class="form-control" id="updated_status" required>
                    </select>
                  </div>
                </div>

                <div class="col-md-12" id="schedule_div">
                  <div class="form-group">
                    <label for="device_name">Device Name <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="device_name">
                  </div>

                  <div class="form-group">
                    <label for="imei_number">Imei <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="imei_number">
                  </div>
                </div>

                <div class="col-md-12" id="first_contact_div">
                  <div class="form-group">
                    <label for="scheduled_time">Scheduled Date <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="scheduled_time">
                  </div>
                </div>



                <div class="col-md-12">
                  <div class="form-group">
                    <label for="note">Add Note (Optional)</label>
                    <textarea type="text" class="form-control" id="note" placeholder="Select"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary b2b-submit-btn-base" onclick="updateStatus()">Update</button>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/datetime-picker/css/bootstrap-datetimepicker.min.css">
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/datetime-picker/js/bootstrap-datetimepicker.min.js"></script>

<script>
  var base_url = $("#domain_url").val() + "/";
  let dataTable;
  let productData = [];
  let userCustomSearchModel = "";
  function searchDataTable(){

  }
  $( document ).ready(function() {
    $("#scheduled_time").datetimepicker({
      icons: {
        time: 'fa fa-clock-o',
        date: 'fa fa-calendar',
        up: 'fa fa-chevron-up',
        down: 'fa fa-chevron-down',
        previous: 'fa fa-chevron-left',
        next: 'fa fa-chevron-right',
        today: 'fa fa-crosshairs',
        clear: 'fa fa-trash-o',
        close: 'fa fa-times'
      },
      format: "YYYY-MM-DD HH:MM:SS"
    });
    $(".select2").select2();
    //Date range as a button
    $('#date_range').daterangepicker(
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
              $('#date_range span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
            }
    );

    $('#date_range').on('apply.daterangepicker', function(ev, picker) {
      $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    });

    $('#date_range').on('cancel.daterangepicker', function(ev, picker) {
      $(this).val('');
    });

    getOrderData();
    getProductListSearch();
    getVendorListSearch();
    getStatusListSearch()
  });

  function getProductListSearch() {
    $('#product_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/product-list",
      success: function (data) {
        $('#search_product_input').append('<option value="">Product</option>')
        data.data.forEach(element => {
          $('#search_product_input').append('<option value="' + element.id +'">' + element.productName + '</option>');
        });
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  function getVendorListSearch() {
    $('#product_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/vendor-list",
      success: function (data) {
        $('#search_vendor_input').append('<option value="">Vendor</option>')
        data.data.forEach(element => {
          $('#search_vendor_input').append('<option value="' + element.id +'">' + element.name + '</option>');
        });
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  function getStatusListSearch() {
    $('#product_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/order-status-list",
      success: function (data) {
        $('#search_status_input').append('<option value="">Status</option>')
        data.data.forEach(element => {
          $('#search_status_input').append('<option value="' + element.id +'">' + element.order_name + '</option>');
        });
      },
      error: function (error) {
        console.log(error);
      }
    });
  }


  $('#product_name').on('change', function() {
    let productId = $('#product_name').val().split("/")[0];
    let productSimStatus = $('#product_name').val().split("/")[2];

    if (productId != 'Please select product'){
      $('#vendor_name').html('');
      $('#product_type').html('');

      getVendorListUpdate($('#product_name').val().split("/")[1])

      if(productSimStatus === "true"){
        $('#product_type').append('<option value="1">SIM Based</option>');
        $('#vts_sim_block').show();
        $('#vts_sim').attr("required", true);

      } else{
        $('#product_type').append('<option value="2">SIM Less</option>');
        $('#vts_sim_block').hide();
        $('#vts_sim').attr("required", false);
      }
    }
  });

  function getVendorListUpdate(value) {
    console.log("getVendorDetails::"+ value);
    $('#vendor_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/vendor-list",
      success: function (data) {
        $('#vendor_name').append('<option>Please Select</option>')
        data.data.forEach(element => {
          console.log((value === element.id));
          $('#vendor_name').append('<option value="' + element.id + '/' + element.name + "/" + element.email+'" ' + ((value == element.id) ? 'selected' : 'none') + '>' + element.name + '</option>');
        });
        $(".loader_body").hide();
      },
      error: function (error) {
        console.log(error);
        $(".loader_body").hide();
      }
    });
  }



  function openCreateOrderModal(){
    getProductList();
    $("#newOrderEntry").modal("show");
  }

  function getCustomOrderData() {
    $(".loader_body").show();
    initOrderTable("gpc_sim" , "orderType")
    dataTable.destroy();
    let customSearch = {

      product_id: $("#search_product_input option:selected").val() == "" ? "" : $("#search_product_input option:selected").val(),
      vendor_id: $("#search_vendor_input option:selected").val() == "" ? "" : $("#search_vendor_input option:selected").val(),
      status_name_id: $("#search_status_input option:selected").val() == "" ? "" : $("#search_status_input option:selected").val(),
      created_at: $("#date_range").val(),
      order_type: {
        operator: "like",
        value: $("#order_type").val()
      }
    };
    //let customSearch = null;
    userCustomSearchModel = JSON.stringify(customSearch)
    console.log("srCustomSearchModel::"+userCustomSearchModel);
    initOrderTable(userCustomSearchModel);
  }

  function getOrderData() {
    $(".loader_body").show();
    $('#search_product_input').val("").trigger('change');
    $('#search_vendor_input').val("").trigger('change');
    $('#search_status_input').val("").trigger('change');
    initOrderTable("gpc_sim" , "orderType")
    dataTable.destroy();
    let customSearch = {
      order_type: {
        operator: "like",
        value: $("#order_type").val()
      }
    };
    //let customSearch = null;
    userCustomSearchModel = JSON.stringify(customSearch)
    console.log("srCustomSearchModel::"+userCustomSearchModel);
    initOrderTable(userCustomSearchModel);
  }

  function initOrderTable(searchQuery) {
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
      //responsive: true,
      order: [[0, 'desc']],
      ajax: {
        url: base_url + "api/web/orders/b2c-gpc/listDT",
        data: function (d) {
          d.customQuery = searchQuery;
        }
      },
      select:true,
      columns: [
        {data: 'id'},
        {data: 'cloudId'},
        {data: 'vtsSimNo'},
        {data: 'simKit'},
        {data: 'productType'},
        {data: 'orderType'},
        {data: 'productName',},
        {data: 'statusName',
          autowidth: true,
          render: function (data, type, full, row) {
            if (data == "New Order") {
              return '<button class="btn btn-b2b-sm btn-info btn-sm btn-disabled">New Order</button>';
            } else if(data == "Scheduled"){
              return '<button class="btn btn-b2b-sm btn-dark btn-sm btn-disabled">Scheduled</button>';
            } else if(data == "Sim Activation"){
              return '<button class="btn btn-b2b-sm btn-danger btn-sm btn-disabled">Sim Active</button>';
            } else if(data == "Installation"){
              return '<button class="btn btn-b2b-sm btn-warning btn-sm btn-disabled">Installation</button>';
            } else if(data == "Finalization"){
              return '<button class="btn btn-b2b-sm btn-primary btn-sm btn-disabled">Finalization</button>';
            }else if(data == "Onboarded"){
              return '<button class="btn btn-b2b-sm btn-dark btn-sm btn-disabled" disabled>Onboarded</button>';
            }else if(data == "First Contact"){
              return '<button class="btn btn-b2b-sm btn-warning btn-sm btn-disabled">First Contact</button>';
            }else if(data == "Cancelled"){
              return '<button class="btn btn-b2b-sm btn-danger btn-sm btn-disabled" disabled>Cancelled</button>';
            } else if(data == "Pack Activation"){
              return '<button class="btn btn-b2b-sm btn-success btn-sm btn-disabled">Pack Activation</button>';
            } else{
              return '';
            }
          }},

        {data: 'packName'},
        {data: 'ratePlan'},
        {
          data: 'id',
          render: function (data, type, full, row){
            return '<button class="btn btn-b2b-sm btn-b2b-sm-download btn-sm">Download Excel</button>';
          }
        },
        {
          data: 'statusName',
          render: function (data, type, full, row){
            if(data === "Cancelled" || data === "Onboarded"){
              return '<button class="btn btn-b2b-sm btn-sm btn-b2b-sm-base change-status" disabled>Change Status</button>';
            } else{
              return '<button class="btn btn-b2b-sm btn-sm btn-b2b-sm-base change-status" >Change Status</button>';
            }

          }
        }
      ]
    });
    $(".loader_body").hide();
  }

  $('#dataTable tbody').on( 'click', 'tr', function (evt) {
    console.log(dataTable.row( this ).data());
    let tableRowData = dataTable.row( this ).data();
    $("#showOrderDetails").modal("show");
    if ( $(evt.target).is("dataTable tbody tr td:nth-last-child(2)") ) {
      return;
    }
    $('#details_order_form').trigger("reset");

    $('#d_updated_date').val(tableRowData.updatedAt);
    $('#d_cloud_id').val(tableRowData.cloudId);
    $('#d_trxid').val(tableRowData.id);
    $('#d_customer_name').val(tableRowData.customerName);
    $('#d_address').val(tableRowData.address);
    $('#d_pack').val(tableRowData.packName);
    $('#d_product_name').val(tableRowData.productName);
    $('#d_product_type').val(tableRowData.productType);
    $('#d_vendor_name').val(tableRowData.vendorName);
    $('#d_rate_plan').val(tableRowData.ratePlan);
    $('#d_customer_contact').val(tableRowData.customerContactNumber);
  } );

  function createNewOrder(){
    $("#createSrNotification").html("");
    $(".loader_body").show();

    if($("#create_order_form").parsley().validate()){

      let orderInfo = {
        customerName: $("#customer_name").val(),
        customerContactNumber: $("#customer_contact_number").val(),
        productId: parseInt($("#product_name").val().split("/")[0]),
        address: $( "#address" ).val(),
        vtsSimNo: $( "#vts_sim" ).val(),
        statusNameId: 1,
        vendorEmail: $( "#vendor_name" ).val().split("/")[1],
        vendorId: parseInt($( "#vendor_name" ).val().split("/")[0]),
        vendorName: $( "#vendor_name" ).val().split("/")[1],
        ratePlan: $( "#vendor_name" ).val().split("/")[2],
        orderType: "GPC"
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
            modalClose();
            getOrderData();
            $('#create_order_form')[0].reset();
          } else {
            $(".loader_body").hide();
            let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
            $("#createSrNotification").html(custom_msg);
            $('#create_order_form')[0].reset();
            modalClose()
          }
        },
        error: function (resultData) {
          $(".loader_body").hide();
          let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
          $("#createSrNotification").html(custom_msg);
          modalClose()
          $('#create_order_form')[0].reset();
        }
      });
    } else{
      $(".loader_body").hide();
    }
  }

  function modalClose(){
    $("#newOrderEntry").modal('hide');
  }

  $('#dataTable tbody').on( 'click', 'button.change-status', function (e) {
    //$("#update_order_form").clear();
    e.stopPropagation()
    $('#create_order_form')[0].reset();
    let data = dataTable.row( $(this).parents('#dataTable tbody tr') ).data();
    $("#current_status").val(data.status).change();
    $("#row_id").val(data.id);
    $("#changeStatus").modal("show");
    console.log(data.statusName + "-" +data.statusNameId + "-" +data.orderType);
    getStatusB2c(data.statusName, data.statusNameId, data.orderType);

  } );

  function initiateRelatedFieldData(){
    let updatedStatus = $("#updated_status option:selected").val().split("/")[1];
    switch (updatedStatus){
      case "Scheduled" :
        $("#first_contact_div").show();
        $("#scheduled_time").attr("required", true);
        $("#schedule_div").hide();
        $("#device_name").attr("required", false);
        $("#imei_number").attr("required", false);
        break

      case "Installation" :
        $("#schedule_div").show();
        $("#device_name").attr("required", true);
        $("#imei_number").attr("required", true);
        $("#first_contact_div").hide();
        $("#scheduled_time").attr("required", false);
        break

      default:
        $("#schedule_div").hide();
        $("#device_name").attr("required", false);
        $("#imei_number").attr("required", false);
        $("#first_contact_div").hide();
        $("#scheduled_time").attr("required", false);
    }
  }

  $('#dataTable tbody').on( 'click', 'button.btn-b2b-sm-download', function () {
    let data = dataTable.row( $(this).parents('tr') ).data();
    alert( data[0] +"'Download: "+ data[ 5 ] );
  } );


  function updateStatus(){
    $(".loader_body").show();

    if($("#update_order_form").parsley().validate()){

      let orderStatusData = {
        statusName: $('#updated_status').val().split("/")[1],
        statusNameId: parseInt($('#updated_status').val().split("/")[0]),
        deviceName: $('#device_name').val(),
        imei: $('#imei_number').val(),
        scheduledNote: $('#add_note').val()
      }
      let id = $("#row_id").val();
      let scheduled_time = $('#scheduled_time').val();


      $.ajax({
        type: 'POST',
        url: base_url + "api/web/orders/b2c-gpc/update-status",
        data: {orderStatusData: JSON.stringify(orderStatusData), id: parseInt(id), scheduled_time: scheduled_time},
        success: function (resultData) {
          $(".loader_body").hide();
          if (resultData.code === 200) {
            let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
            //$("#notification_bar").show();
            $("#createSrNotification").html(custom_msg);
            $("#changeStatus").modal("hide");
            getOrderData();
            $('#update_order_form')[0].reset();
          } else {
            $(".loader_body").hide();
            let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> "+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
            $("#createSrNotification").html(custom_msg);
            $("#changeStatus").modal("hide");
            $('#update_order_form')[0].reset();
          }
        },
        error: function (resultData) {
          $(".loader_body").hide();
          let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
          $("#createSrNotification").html(custom_msg);
          $("#changeStatus").modal("hide");
          $('#update_order_form')[0].reset();
        }
      });
    } else{
      $(".loader_body").hide();
    }

  }

  function getProductList() {
    $('#product_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/product-list",
      success: function (data) {
        $('#product_name').append('<option>Please Select</option>')
        data.data.forEach(element => {
          $('#product_name').append('<option value="' + element.id + "/" + element.vendorId +"/" + element.hasSim +'">' + element.productName + '</option>');
        });
        productData = data.data;
        getVendorDetails($('#product_name').val().split("/")[1])
      },
      error: function (error) {
        console.log(error);
      }
    });
  }


  function getVendorDetails(value) {
    console.log("getVendorDetails::" + value);
    $('#d_vendor_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/vendor-list",
      success: function (data) {
        $('#d_vendor_name').append('<option>Please Select</option>')
        data.data.forEach(element => {
          $('#d_vendor_name').append('<option value="' + element.id + '/' + element.name + '" ' + ((value === element.id) ? 'selected' : '') + '>' + element.name + '</option>');
        });
        $(".loader_body").hide();
      },
      error: function (error) {
        console.log(error);
        $(".loader_body").hide();
      }
    });
  }

  function getStatusB2c(statusName, statusNameId, orderType) {
    $(".loader_body").show();
    $('#current_status').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/order-status-list",
      success: function (data) {
        if(orderType === "gpc_sim"){
          console.log("gpc_sim");
          data.data.forEach(element => {
            $('#current_status').append('<option value="' + element.gpc_sim + '">' + element.order_name + '</option>');
          });
        } else if(orderType === "gpc_simless"){
          console.log("gpc_simless");
          data.data.forEach(element => {
            $('#current_status').append('<option value="' + element.gpc_simless + '">' + element.order_name + '</option>');
          });
        }

        $('#current_status option:contains(' + statusName + ')').each(function () {
          if ($(this).text() === statusName) {
            $(this).attr('selected', 'selected');
            getStatusNext(statusName, orderType)
            return false;
          }
          return true;
        });
        productData = data.data;
        //initiateRelatedFieldData();
      },
      error: function (error) {
        console.log(error);
      }
    })
  }

  function getStatusNext(statusName, orderType) {
    $('#updated_status').html("");
    $(".loader_body").hide();
    $.ajax({
      type: 'post',
      data: {id: $('#current_status').val(), columnName: orderType},
      url: base_url + "api/web/utility/next-order-status",
      success: function (data) {
        data.data.forEach(element => {
          $('#updated_status').append('<option value="' + element.gpc_sim + "/" + element.order_name + '">' + element.order_name + '</option>');
        });
        $('#updated_status').append('<option value="100/Cancelled">Cancelled</option>')
        initiateRelatedFieldData();
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  $("#updated_status").on("change", function (){
    initiateRelatedFieldData();
  })

</script>

</body>

</html>


