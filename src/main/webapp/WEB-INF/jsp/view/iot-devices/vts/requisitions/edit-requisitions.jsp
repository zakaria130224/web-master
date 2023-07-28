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
    .b2b-custom-form .form-control {
      display: block;
      width: 100%;
      height: 48px;
      padding: 0.375rem 0.75rem;
      font-size: 16px;
      font-weight: 400;
      line-height: 1.5;
      color: #918F92;
      background-color: #F5F8FA;
      background-clip: padding-box;
      border: 1px solid #F5F8FA;
      border-radius: 0.25rem;
      box-shadow: inset 0 0 0 transparent;
      transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    }
    .b2b-submit-btn-base {
      background: #0078CF;
      border-color: #0078CF;
      border-radius: 8px;
      padding: 12px 32px;
      font-size: 16px;
      font-weight: 700;
      color: #FFFFFF;
    }
    .b2b-custom-form label{
      font-size: 16px;
      font-weight: 500;
      color: #39363C;
    }
    .b2b-custom-card{
      border-radius: 12px;
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
        <div class="row py-2 mb-1 " style="background-color: white; border-radius: 8px; margin: 1px">
          <div class="col-sm-3 col-md-2 col-lg-1">
            <div class="tabs_bar">
              <span class="mt-5">General</span>
            </div>
          </div>
          <div class="col-sm-3 col-md-2 col-lg-1">
            <div class="tabs_bar">
              <span class="mt-5">VTS</span>
            </div>
          </div>
          <div class="col-sm-3 col-md-2 col-lg-1">
            <div class="tabs_bar">
              <span class="mt-5">OBD</span>
            </div>
          </div>
          <div class="col-sm-3 col-md-2 col-lg-1">
            <div class="tabs_bar">
              <span class="mt-5">Product2</span>
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
            <div class="card b2b-custom-card">
              <div class="card-body">
                <div class="card-head-custom">
                  <div class="float-left">
                    <h3 class="b2b-font-20-500 black-10 float-left">Create Requisition</h3>
                  </div>
                  <div class="float-right">
                    <button type="submit" class="btn btn-sm btn-custom-white mr-2"><i class="fa fa-plus-circle"></i> Add A New Requisition</button>
                    <button type="submit" class="btn btn-sm btn-custom-blue"><i class="fa fa-download"></i> Export</button>
                  </div>
                </div>

                <hr>

                <form class="form-horizontal b2b-custom-form">
                  <div class="card-body">
                    <div class="form-group row">
                      <label for="full_name" class="col-sm-4 col-md-3 col-form-label">Full Name</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="full_name" name="full_name" placeholder="Write your name here" value="John Doe">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="mobile_name" class="col-sm-4 col-md-3 col-form-label">Mobile Number</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="mobile_name" placeholder="+880" value="+8801944439069">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="from_location" class="col-sm-4 col-md-3 col-form-label">From Location <span class="text-red">*</span></label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="from_location" placeholder="Set your location" value="Banani">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="to_location" class="col-sm-4 col-md-3 col-form-label">To Location <span class="text-red">*</span></label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="to_location" placeholder="Set your location" value="GPHOUSE">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="from_time" class="col-sm-4 col-md-3 col-form-label">From Date & Time <span class="text-red">*</span></label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="from_time" placeholder="03-04-2023 3:15 pm" value="03-04-2023 3:15 pm">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="to_time" class="col-sm-4 col-md-3 col-form-label">To Date & Time</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="to_time" placeholder="03-04-2023 3:15 pm" value="03-04-2023 3:15 pm">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="vehicle_type" class="col-sm-4 col-md-3 col-form-label">Vehicle Type <span class="text-red">*</span></label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="vehicle_type" placeholder="Select Option" value="SUV">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="persons" class="col-sm-4 col-md-3 col-form-label">Persons</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="number" class="form-control" id="persons" placeholder="Select Option" value="3">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="purpose" class="col-sm-4 col-md-3 col-form-label">Purpose</label>
                      <div class="col-sm-8 col-md-9">
                        <textarea type="text" class="form-control" id="purpose" placeholder="Write here">Wanted to go GPHOUSE for solving some issues.</textarea>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="goods_type" class="col-sm-4 col-md-3 col-form-label">Goods Type</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="number" class="form-control" id="goods_type" placeholder="i.e : Cash, Oil, Electronics etc." value="Electronics.">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="goods_weight" class="col-sm-4 col-md-3 col-form-label">Goods Weight</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="number" class="form-control" id="goods_weight" placeholder="i.e : 40Kg, 12000BD, 40 Litre etc." value="40 Litre">
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="attached_file" class="col-sm-4 col-md-3 col-form-label">Attach File</label>
                      <div class="col-sm-8 col-md-9">
                        <input type="text" class="form-control" id="attached_file" value="John-Doe.docx">
                      </div>
                    </div>

                    <hr class="w-100">
                    <div class="form-group row">
                      <div class="col-sm-12 col-md-12">
                        * Marked Fields Are Mendatory
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="attached_file" class="col-sm-4 col-md-3 col-form-label"></label>
                      <div class="col-sm-8 col-md-9 text-right">
                        <button type="submit" class="btn btn-info b2b-submit-btn-base">Update</button>
                      </div>
                    </div>
                  </div>
                </form>

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
<script>
  $( document ).ready(function() {

  });
</script>

</body>

</html>

