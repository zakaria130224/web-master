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
            <h5>Inventory Management</h5>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Cloud </a></li>
              <li class="breadcrumb-item active">Manage</li>
            </ol>
          </div>
          <div class="col-md-6 col-sm-12">
            <div class="float-right">
              <button data-toggle="modal" class="btn b2b-btn-submit-blue mr-2" onclick="openCreateOrderModal()"> Add New Entry</button>
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
                        <h3 class="b2b-font-20-500 black-10 float-left pt-2">Inventory Management</h3>
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
                          <th>Item Code</th>
                          <th>Channel</th>
                          <th>Subscription</th>
                          <th>Product Price</th>
                          <th>Quantity</th>
                          <th>Entry date</th>
                          <th>Modify date</th>
                          <th>Remarks</th>
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
          <h4 class="modal-title float-left" id="myModalLabel3">Add New Inventory</h4>
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
                    <label for="item_code">Item Code <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="item_code" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="channel_name">Channel</label>
                    <select class="form-control" id="channel_name" required>
                      <option>Please select channel</option>
                      <option value="1/B2B">B2B</option>
                      <option value="2/B2C">B2C</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="category_name">Category Name</label>
                    <select class="form-control" id="category_name" required>
                      <option>Please select category</option>
                      <option value="1/B2B">SIM Bases</option>
                      <option value="2/B2C">SIM Less</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="subscription">Subscription(BDT/Monthly) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="subscription" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Product Price(BDT) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="product_price" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Quantity <span class="text-danger"> *</span></label>
                    <input type="number" class="form-control" id="quantity" placeholder="Please write here" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Description <span class="text-danger"> *</span></label>
                    <textarea type="text" class="form-control" id="description" placeholder="Please write here"></textarea>
                  </div>
                </div>

              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>
          <button type="submit" class="btn btn-primary b2b-submit-btn-base" onclick="createNewOrder()">Add Inventory</button>
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
                    <label for="item_code">Item Code <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="d_item_code" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="channel_name">Channel</label>
                    <select class="form-control" id="d_channel_name" required>
                      <option>Please select channel</option>
                      <option value="1/B2B">B2B</option>
                      <option value="2/B2C">B2C</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="category_name">Category Name</label>
                    <select class="form-control" id="d_category_name" required>
                      <option>Please select category</option>
                      <option value="1/B2B">SIM Bases</option>
                      <option value="2/B2C">SIM Less</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="subscription">Subscription(BDT/Monthly) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="d_subscription" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Product Price(BDT) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="d_product_price" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Quantity <span class="text-danger"> *</span></label>
                    <input type="number" class="form-control" id="d_quantity" placeholder="Please write here" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Description <span class="text-danger"> *</span></label>
                    <textarea type="text" class="form-control" id="d_description" placeholder="Please write here"></textarea>
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
          <h4 class="modal-title float-left" id="myModalLabel2">Edit Inventory</h4>
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
                    <label for="item_code">Item Code <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="e_item_code" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="channel_name">Channel</label>
                    <select class="form-control" id="e_channel_name" required>
                      <option>Please select channel</option>
                      <option value="1/B2B">B2B</option>
                      <option value="2/B2C">B2C</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="category_name">Category Name</label>
                    <select class="form-control" id="e_category_name" required>
                      <option>Please select category</option>
                      <option value="1/B2B">SIM Bases</option>
                      <option value="2/B2C">SIM Less</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="subscription">Subscription(BDT/Monthly) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="e_subscription" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Product Price(BDT) <span class="text-danger"> *</span></label>
                    <input type="text" class="form-control" id="e_product_price" placeholder="Select" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Quantity <span class="text-danger"> *</span></label>
                    <input type="number" class="form-control" id="e_quantity" placeholder="Please write here" required>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_price">Description <span class="text-danger"> *</span></label>
                    <textarea type="text" class="form-control" id="e_description" placeholder="Please write here"></textarea>
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


<script>
  var base_url = $("#domain_url").val() + "/";
  let dataTable;
  let productData = [];
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


  $('#product_name').on('change', function() {
    let productId = $('#product_name').val();
    if (productId != 'Please select product'){
      $('#vendor_name').html('');
      $('#product_type').html('');
      let vendors = [];
      let product = [];
      productData.forEach(function (el, i, arr) {
        //console.log(el);
        if (el.id == productId) {
          //console.log("selected::: "+ JSON.stringify(el.vendors));
          vendors = JSON.stringify(el.vendors);
          product = el;
        }
      });
      console.log(productData)
      console.log(vendors)
      console.log(product)

      JSON.parse(vendors).forEach(function (el, i, arr) {
        $('#vendor_name').append('<option value="' + el.id + '/' + el.email + '">' + el.name + '</option>');
      });

      $('#ratePlan').val(product.monthly_charge);

      if(product.has_sim === true){
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



  function openCreateOrderModal(){
    getProductList();
    $("#newOrderEntry").modal("show");
  }

  function getOrderData() {
    $(".loader_body").show();

    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/product/listDT",
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
      //responsive: true,
      data: data,
      order: [[0, 'desc']],
      select:true,
      columns: [
        {data: 'itemCode'},
        {data: 'channel'},
        {data: 'monthlyCharge'},
        {data: 'totalCharge'},
        {data: 'quantity'},
        {data: 'createdAt'},
        {data: 'updatedAt'},
        {data: 'deviceCategory'},
        {
          data: 'id',
          render: function (data, type, full, row){
            return '<button class="btn btn-b2b-sm btn-b2b-sm-base btn-sm change-status">Edit</button>';
          }
        }
      ]
    });

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
        productId: $("#product_name").val(),
        address: $( "#address" ).val(),
        vtsSimNo: $( "#vts_sim" ).val(),
        statusNameId: 1,
        vendorEmail: $( "#vendor_name" ).val().split("/")[1],
        vendorId: $( "#vendor_name" ).val().split("/")[0],
        vendorName: $( "#vendor_name" ).text(),
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
    getStatusAll(data.statusName, data.statusNameId);
  } );

  $('#dataTable tbody').on( 'click', 'button.btn-b2b-sm-download', function () {
    let data = dataTable.row( $(this).parents('tr') ).data();
    alert( data[0] +"'Download: "+ data[ 5 ] );
  } );


  function updateStatus(){
    $(".loader_body").show();

    if($("#update_order_form").parsley().validate()){

      let orderStatusData = {
        statusName: $('#updated_status').val().split("/")[1],
        statusNameId: $('#updated_status').val().split("/")[0],
      }
      let id = $("#row_id").val();


      $.ajax({
        type: 'POST',
        url: base_url + "api/web/orders/b2c-gpc/update-status",
        data: {orderStatusData: JSON.stringify(orderStatusData), id: parseInt(id)},
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
          $('#product_name').append('<option value="' + element.id + '">' + element.product_name + '</option>');
        });
        productData = data.data;
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

  function getStatusAll(statusName, statusNameId) {
    $(".loader_body").show();
    $('#product_name').html("");
    $.ajax({
      type: 'get',
      url: base_url + "api/web/utility/order-status-list",
      success: function (data) {
        data.data.forEach(element => {
          $('#current_status').append('<option value="' + element.gpc_sim + '">' + element.order_name + '</option>');
        });

        $('#current_status option:contains(' + statusName + ')').each(function () {
          if ($(this).text() === statusName) {
            $(this).attr('selected', 'selected');
            getStatusNext(statusName)
            return false;
          }
          return true;
        });
        productData = data.data;
      },
      error: function (error) {
        console.log(error);
      }
    });
  }


  function getStatusNext(statusName) {
    $('#updated_status').html("");
    $(".loader_body").hide();
    $.ajax({
      type: 'post',
      data: {id: $('#current_status').val()},
      url: base_url + "api/web/utility/next-order-status",
      success: function (data) {
        data.data.forEach(element => {
          $('#updated_status').append('<option value="' + element.gpc_sim +"/"+ element.order_name+'">' + element.order_name + '</option>');
        });
        $('#updated_status').append('<option value="100">Cancelled</option>')
      },
      error: function (error) {
        console.log(error);
      }
    });
  }

</script>

</body>

</html>


