<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 5/22/2023
  Time: 5:22 AM
  To change this template use File | Settings | File Templates.
--%>

<%--<c:out value="${orders}" />--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>Orders - B2B Sim Based</title>

  <jsp:include page="../../partial_new/header-link.jsp"></jsp:include>

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
      height: 50px;
    }
  </style>

</head>

<body class="hold-transition sidebar-mini">

<div class="wrapper">
  <!-- Navbar -->
  <jsp:include page="./../../partial_new/loader.jsp"></jsp:include>
  <jsp:include page="../../partial_new/nevbar.jsp"></jsp:include>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->

  <jsp:include page="../../partial_new/aside.jsp"></jsp:include>

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
                    <%--                                        <h6>417 Results Found</h6>--%>
                  </div>


                  <div class="col-md-12 mt-2 mb-2">
                    <div class="row">
                      <div class="table-responsive">
                        <table class="table" id="dataTable">
                          <thead class="b2b-custom-boder">
                          <th>Cloud ID</th>
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

  <!-- Details View -->
  <div class="modal left fade" id="detailsOrderView" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="detailOrder">Order Details</h4>
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
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="status_date">Last Status Change Date</label>
                    <input type="hidden" class="form-control" name="status_date" id="status_date"  placeholder="Select">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="cloud_id">Cloud ID</label>
                    <input type="text" name="cloud_id" id= "cloud_id" class="form-control" placeholder="Cloud id">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="ticket_id">Ticket ID</label>
                    <input type="text" name="ticket_id" id= "ticket_id" class="form-control" placeholder="Ticket id">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="bs_code">BS Code</label>
                    <input type="text" name="bs_code" id= "bs_code" class="form-control" placeholder="BS Code">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="company_name">Company Name</label>
                    <input type="text" name="company_name" id= "company_name" class="form-control" placeholder="Company Name">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="vts_sim">VTS Mobile Number</label>
                    <input type="number" name="vts_sim" id= "vts_sim" class="form-control" placeholder="VTS SIM">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="sim_kit">SIM Kit</label>
                    <input type="text" name="sim_kit" id= "sim_kit" class="form-control" placeholder="SIM Kit">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="pack_name">Pack Name</label>
                    <input type="text" name="pack_name" id= "pack_name" class="form-control" placeholder="Pack Name">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="base_price">Base Price (excluding VAT,SD,SC)</label>
                    <input type="text" name="base_price" id= "base_price" class="form-control" placeholder="Base price">
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="mrp">MRP</label>
                    <input type="text" name="mrp" id= "mrp" class="form-control" placeholder="MRP">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="alt_cont_num">Alternative Contact No.</label>
                    <input type="text" name="alt_cont_num" id= "alt_cont_num" class="form-control" placeholder="Alt. Contact Number">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="kcp_name">KCP Name</label>
                    <input type="text" name="kcp_name" id= "kcp_name" class="form-control" placeholder="KCP Name">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="kcp_contact">KCP Contact Number</label>
                    <input type="text" name="kcp_contact" id= "kcp_contact" class="form-control" placeholder="KCP Contact">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="kcp_email">KCP Email</label>
                    <input type="text" name="kcp_email" id= "kcp_email" class="form-control" placeholder="KCP Email">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="support_partner">Support Partner Name</label>
                    <input type="text" name="support_partner" id= "support_partner" class="form-control" placeholder="Support Partner">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="product_type">Product Type</label>
                    <input type="text" name="product_type" id= "product_type" class="form-control" placeholder="Product Type">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="aud_auth_number">Audio Listen in Authorized Number</label>
                    <input type="text" name="aud_auth_number" id= "aud_auth_number" class="form-control" placeholder="Audio Listen in Authorized Number">
                  </div>
                </div>

              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-custom-dark-blue float-left mr-2">Close</button>
          <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-danger float-left mr-2">Delete</button>--%>
          <%--                    <button type="submit" class="btn btn-custom-dark-blue" id="orderSuccess">Add New Order</button>--%>
        </div>
      </div>
    </div>
  </div>


  <!-- End Details View Modal -->

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
          <form class="form-horizontal b2b-custom-form" id="dataForm" enctype="multipart/form-data" action="/save-data" method="post">
            <div class="card-body p-0">
              <div class="row">

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="chtticket">CHT Ticket Number</label>
                    <input type="text" class="form-control" name="chtticket" id="chtticket"  placeholder="">
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label>Upload File(.xlxs)</label>
                    <input type="file" class="form-control" id="upload_file" placeholder="Uploaded file have to be less than 10MB">
                  </div>
                </div>

              </div>
            </div>
            <%--                        <button type="submit">Save</button>--%>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-custom-dark-blue float-left mr-2">Close</button>
          <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-danger float-left mr-2">Delete</button>--%>
          <button type="submit" class="btn btn-custom-dark-blue" id="saveBtn">Add New Order</button>
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
          <form class="form-horizontal b2b-custom-form" id="updateForm">
            <input type="hidden" id="editOrderId" name="id">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">

                  <div class="form-group">
                    <label for="editStatus">Update Status</label>
                    <select name="editStatus" id="editStatus" class="form-control">
                      <option value="New Order">New Order</option>
                      <option value="Scheduled">Scheduled</option>
                      <option value="Sim Active">Sim Active</option>
                      <option value="Installation">Installation</option>
                      <option value="Finalization">Finalization</option>
                      <option value="Onboarded">Onboarded</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="editCht">Cht Ticket</label>
                    <input type="text" class="form-control" name="editCht" id="editCht" placeholder="" readonly>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="add_note">Add Note</label>
                    <textarea type="text" class="form-control" name="add_note" id="add_note" placeholder="Add Note"></textarea>
                  </div>
                </div>
                <%--                                <div class="col-md-12">--%>
                <%--                                    <div class="form-group">--%>
                <%--                                        <label for="user_otp">User OTP</label>--%>
                <%--                                        <input type="password" class="form-control" name="user_otp" id="user_otp" placeholder="Type">--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
          <button type="submit" class="btn btn-custom-grey" id="successmodal">Update</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Onboard Modal -->
  <div class="modal left fade" id="changeStatusOnboardModal" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="myModalLabel8">Change Status</h4>
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
          <form class="form-horizontal b2b-custom-form" id="updateOnboardForm">
            <input type="hidden" id="editOrderIds" name="id">
            <input type="hidden" id="kcpmail" name="kcpmail">
            <input type="hidden" id="kcpphone" name="kcpphone">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">

                  <div class="form-group">
                    <label for="editStatus">Update Status</label>
                    <select name="editStatus" id="editStatuss" class="form-control">
                      <option value="New Order">New Order</option>
                      <option value="Scheduled">Scheduled</option>
                      <option value="Sim Active">Sim Active</option>
                      <option value="Installation">Installation</option>
                      <option value="Finalization">Finalization</option>
                      <option value="Onboarded">Onboarded</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="editCht">Cht Ticket</label>
                    <input type="text" class="form-control" name="editCht" id="editChts" placeholder="" readonly>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="add_note">Add Note</label>
                    <textarea type="text" class="form-control" name="add_note" id="add_notes" placeholder="Add Note"></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="user_otp">User OTP</label>
                    <input type="password" class="form-control" name="user_otp" id="user_otp"  pattern="123456" placeholder="OTP">
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
          <button type="submit" class="btn btn-custom-grey" id="successOnboardmodal">Update</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Onboard Modal -->

  <!-- Imei and user add modal -->
  <div class="modal left fade" id="changeFinalStatusModal" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title float-left" id="myModalLabel5">Change Status</h4>
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
          <form class="form-horizontal b2b-custom-form" id="updateFinalStatusForm">
            <input type="hidden" id="excelOrderId" name="excel_order_id">
            <input type="hidden" id="kcpName" name="kcpName">
            <input type="hidden" id="kcpEmail" name="kcpEmail">
            <input type="hidden" id="kcpContact" name="kcpContact">
            <div class="card-body p-0">
              <div class="row">
                <div class="col-md-12">

                  <div class="form-group">
                    <label for="editStatus">Update Status</label>
                    <select name="updateFinalStatus" id="updateFinalStatus" class="form-control">
                      <option value="New Order">New Order</option>
                      <option value="Scheduled">Scheduled</option>
                      <option value="Sim Active">Sim Active</option>
                      <option value="Installation">Installation</option>
                      <option value="Finalization">Finalization</option>
                      <option value="Onboarded">Onboarded</option>
                    </select>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="chtvalue">Cht Ticket</label>
                    <input type="text" class="form-control" name="chtvalue" id="chtvalue" placeholder="" readonly>
                  </div>
                </div>

                <div class="col-md-12">
                  <div class="form-group">
                    <label for="add_note">Add Note</label>
                    <textarea type="text" class="form-control" name="add_final_note" id="add_final_note" placeholder="Add Note"></textarea>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-group">
                    <label for="imei">IMEI</label>
                    <input type="text" class="form-control" name="imei" id="imei" placeholder="Add IMEI" required>
                  </div>
                </div>
                <%--                                <div class="col-md-12">--%>
                <%--                                    <div class="form-group">--%>
                <%--                                        <label for="user_otp_final">User OTP</label>--%>
                <%--                                        <input type="password" class="form-control" name="user_otp_final" id="user_otp_final" placeholder="Type">--%>
                <%--                                    </div>--%>
                <%--                                </div>--%>
              </div>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
          <button type="submit" class="btn btn-custom-grey" id="successfinalmodal">Update</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Imei and user add modal -->

  <!-- Button trigger modal -->


  <!-- Modal -->
  <div class="modal fade" id="statusSuccessModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <%--                <div class="modal-header">--%>
        <%--                    <h5 class="modal-title" id="exampleModalLongTitle"></h5>--%>
        <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
        <%--                        <span aria-hidden="true">&times;</span>--%>
        <%--                    </button>--%>
        <%--                </div>--%>
        <div class="modal-body text-center" style="font-size: 18px">
          Status updated <br>
          Successfully<br>
          <button type="button" class="btn btn-secondary" style="width: 247px" data-dismiss="modal" id="closeSuccessModalButton">Close</button>
        </div>
        <%--                <div class="modal-footer ">--%>
        <%--&lt;%&ndash;                    <button type="button" class="btn btn-secondary" style="width: 247px" data-dismiss="modal">Close</button>&ndash;%&gt;--%>
        <%--                </div>--%>
      </div>
    </div>
  </div>

  <!-- Order Success Modal -->
  <div class="modal fade" id="orderSuccessModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <%--                <div class="modal-header">--%>
        <%--                    <h5 class="modal-title" id="exampleModalLongTitle"></h5>--%>
        <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
        <%--                        <span aria-hidden="true">&times;</span>--%>
        <%--                    </button>--%>
        <%--                </div>--%>
        <div class="modal-body text-center" >
          <p style="font-size: 20px;">New Order Added Successfully.</p>
          <%--                   <p style="font-size: 14px;">"Kite N Co" is emailed.</p>--%>
          <%--                    <p style="font-size: 14px;">40 rows of devices are added</p>--%>

          <button type="button" class="btn btn-secondary" style="width: 247px" data-dismiss="modal"  id="closeModalButton">Close</button>
        </div>
        <%--                <div class="modal-footer ">--%>
        <%--&lt;%&ndash;                    <button type="button" class="btn btn-secondary" style="width: 247px" data-dismiss="modal">Close</button>&ndash;%&gt;--%>
        <%--                </div>--%>
      </div>
    </div>
  </div>

  <jsp:include page="../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->



<!-- Modal -->

<!-- ./wrapper -->

<jsp:include page="../../partial_new/script.jsp" />
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/daterangepicker-master/daterangepicker.css">

<script>
  const base_url = $("#domain_url").val() + "/";
  let dataTable;
  let productData = [];
  //document ready function starts
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

    getOrderSimData();

  });
  //document ready function closed

  //order data get
    function getOrderSimData() {
      $(".loader_body").show();
    //   console.log(base_url);
      $.ajax({
        type: 'get',
        url: base_url + "api/web/orders/b2b-sim-based/listB2bSimDT",
        success: function (data) {
          $(".loader_body").hide();
          initOrderTable(data.data);
        },
        error: function (error) {
          $(".loader_body").hide();
        }
      });
    }
  //order data closed

  //init table
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
      order: [[0, 'desc']],
      select:true,
      columns: [
        {data: 'id'},
        {data: 'cloudId'},
        {data: 'vtsSimNo'},
        {data: 'simKit'},
        {data: 'productType'},
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
              return '<button class="btn btn-b2b-sm btn-success btn-sm btn-disabled">Onboarded</button>';
            }else if(data == "Cancelled"){
              return '<button class="btn btn-b2b-sm btn-success btn-sm btn-disabled">Cancelled</button>';
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
          data: 'id',
          render: function (data, type, full, row){
            return '<button class="btn btn-b2b-sm btn-b2b-sm-base btn-sm change-status">Change Status</button>';
          }
        }
      ]
    });

  }

  $('#dataTable tbody').on( 'click', 'button.change-status', function (e) {
    //$("#update_order_form").clear();
    // $('#changeStatusModal')[0].reset();
    // let data = dataTable.row( $(this).parents('#dataTable tbody tr') ).data();
    // $("#current_status").val(data.status).change();
    // $("#row_id").val(data.id);
    $("#changeStatusModal").modal("show");
  //  getStatusAll(data.statusName, data.statusNameId);
  } );

  function openCreateOrderModal(){
   // getProductList();
    $("#newOrderEntry").modal("show");

  }

  $('#dataTable tbody').on( 'click', 'tr', function () {
    console.log(dataTable.row( this ).data());

  } );


</script>

</body>

</html>

