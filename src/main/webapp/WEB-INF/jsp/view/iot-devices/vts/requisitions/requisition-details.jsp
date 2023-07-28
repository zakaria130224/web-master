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
      margin-top: 15px;
      padding: 8px 9px;
    }
    .b2b-custom-card .card-header-no-border-bt{
      border-bottom: none;
    }
    .b2b-custom-card-top .nav-link.active{
      padding: 8px 31px;
      border-radius: 8px;
      background: #D9EBF8;
      color: #003053;
      font-size: 14px;
      font-weight: 400;
    }
    .b2b-border-top-details{
      border-bottom: 1px solid #F4F4F4;
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
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Custom Tabs -->
            <div class="card b2b-custom-card b2b-custom-card-top">
              <div class="card-header card-header-no-border-bt d-flex p-0">
                <ul class="nav nav-pills">
                  <li class="nav-item"><a class="nav-link active" href="#tab_1" data-toggle="tab">VTS</a></li>
                  <li class="nav-item"><a class="nav-link" href="#tab_2" data-toggle="tab">GS</a></li>
                  <li class="nav-item"><a class="nav-link" href="#tab_3" data-toggle="tab">OBD</a></li>
                </ul>
              </div><!-- /.card-header -->
            </div>
            <!-- ./card -->
          </div>
          <!-- /.col -->
        </div>
      </div>
    </section>

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
                </div>

                <hr>

                <div class="row">
                  <div class="col-12">
                    <!-- Custom Tabs -->
                    <div class="card">
                      <div class="card-header d-flex p-0" style="background: #F2FCFF">
                        <h3 class="card-title p-3">Requisition Details</h3>

                      </div><!-- /.card-header -->
                      <div class="card-body p-0">
                        <table class="table">
                          <tbody>
                          <tr class="b2b-border-top-details">
                            <td class="w-25">Full Name</td>
                            <td>John Doe</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>Mobile Number</td>
                            <td>+8801944439069</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>From Location *</td>
                            <td>Banani</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>To Location</td>
                            <td>+GPHOUSE</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>From Date & Time *</td>
                            <td>3rd May, 2023 5:00 pm</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>To Date & Time </td>
                            <td>3rd May, 2023 5:00 pm</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>Vehicle Type *</td>
                            <td>SUV</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>Persons</td>
                            <td>3</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>Purpose</td>
                            <td>+Wanted to go GPHOUSE for solving some issues.</td>
                          </tr>
                          <tr class="b2b-border-top-details">
                            <td>Goods Type</td>
                            <td>40 Litre</td>
                          </tr>

                          </tbody>

                        </table>
                      </div><!-- /.card-body -->
                    </div>
                    <!-- ./card -->
                  </div>
                  <!-- /.col -->
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
<script>
  $( document ).ready(function() {

  });
</script>

</body>

</html>

