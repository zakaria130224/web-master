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
    <title>Order Management</title>

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
            border-radius: 8px;
            padding: 3px 10px;
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
                    <div class="col-md-6 col-sm-12">
                        <h5>Order Management (B2C - GP Shop)</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Cloud </a></li>
                            <li class="breadcrumb-item active">Order Management (B2C - GP Shop)</li>
                        </ol>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="float-right">
                            <button data-toggle="modal" class="btn b2b-btn-submit-blue mr-2" data-target="#newOrderEntry"> Add New Order</button>
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
                                                <option value="gpshop_">B2C GP Shop</option>
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
                                            <button class="btn btn-b2b-sm-base" onclick="getOrderSimData()" style="border-radius: 8px">Reset</button>
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
                                                    <th>Cloud ID</th>
                                                    <th>GP Shop Transaction No</th>
                                                    <th>GP Shop Transaction Date</th>
                                                    <th>Customer Name</th>
                                                    <th>Contact Number</th>
                                                    <th>Status</th>
                                                    <th>Product Type</th>
                                                    <th>Product Name</th>
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
                                        <label for="status_date">Gp Shop Transaction Date</label>
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
                                        <label for="transaction_id">Transaction ID</label>
                                        <input type="text" name="transaction_id" id= "transaction_id" class="form-control" placeholder="transaction_id">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="transaction_date">Transaction Date</label>
                                        <input type="text" name="transaction_date" id= "transaction_date" class="form-control" placeholder="transaction_date">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="customer_name">Customer Name</label>
                                        <input type="text" name="customer_name" id= "customer_name" class="form-control" placeholder="customer name">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="customer_contact">Customer Contact Number</label>
                                        <input type="text" name="customer_contact" id= "customer_contact" class="form-control" placeholder="Customer Contact">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="customer_email">Customer Email</label>
                                        <input type="text" name="customer_email" id= "customer_email" class="form-control" placeholder="Customer Email">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="product_name">Product Name</label>
                                        <input type="text" name="product_name" id= "product_name" class="form-control" placeholder="product name">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="product_type">Product Type</label>
                                        <input type="text" name="product_type" id= "product_type" class="form-control" placeholder="Product Type">
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
                    <form class="form-horizontal b2b-custom-form" id="dataForm" >
                        <div class="card-body p-0">
                            <div class="row">

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <a href="${pageContext.request.contextPath}/assets/custom/b2c_gpshop.xlsx" id="templateLink"></a>
                                        <button style="float: right" type="button" class="btn btn-custom-dark-blue" id="downloadTemplate">Download Template</button>
                                    </div>
                                </div>


                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Upload File(.xlxs)</label>
                                        <input type="file" class="form-control" id="upload_file" placeholder="Uploaded file have to be less than 10MB" required>
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
                    <button type="submit" class="btn btn-custom-dark-blue" id="saveBtn" onclick="createNewOrder()">Add New Order</button>
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
                                        <input type="hidden" id="row_id">
                                        <input type="hidden" id="kcp_p_name">
                                        <input type="hidden" id="kcp_p_email">
                                        <input type="hidden" id="kcp_p_contact">
                                        <input type="hidden" id="previous_state">
                                        <label for="current_status">Current Status </label>

                                        <select class="form-control" id="current_status" disabled>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-12">

                                    <div class="form-group">
                                        <label for="editStatus">Update Status<span class="text-danger"> *</span></label>
                                        <select name="editStatus" id="editStatus" class="form-control" required>

                                        </select>
                                    </div>
                                </div>



                                <div class="col-md-12" id="imei_block">
                                    <div class="form-group">
                                        <label for="imei_input">IMEI</label>
                                        <input type="text" class="form-control" id="imei_input" placeholder="Select">
                                    </div>
                                </div>
                                <div class="col-md-12" id="tracker_device_name">
                                    <div class="form-group">
                                        <label for="tracker_device_name">Device Name</label>
                                        <input type="text" class="form-control" id="device_name" placeholder="Select">
                                    </div>
                                </div>

                                <div class="col-md-12" id = "schedule_time">
                                    <div class="form-group">
                                        <label for="schedule">Schedule</label>
                                        <input type="datetime-local" class="form-control" name="schedule" id="schedule" placeholder="Add Schedule">
                                    </div>
                                </div>

                                <div class="col-md-12" id="area_div">
                                    <div class="form-group">
                                        <label for="area">Area<span class="text-danger"> *</span></label>
                                        <select name="area" id="area" class="form-control" required>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="add_note">Add Note</label>
                                        <textarea type="text" class="form-control" name="add_note" id="add_note" placeholder="Add Note"></textarea>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <%--                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>--%>
                    <button type="submit" class="btn btn-primary b2b-submit-btn-base" onclick="updateStatus()" id="successmodal">Update</button>
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
                                        <label for="add_note">Add Note</label>
                                        <textarea type="text" class="form-control" name="add_notes" id="add_notes" placeholder="Add Note"></textarea>
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

                <div class="modal-body text-center" style="font-size: 18px">
                    Status updated <br>
                    Successfully<br>
                    <button type="button" class="btn btn-secondary" style="width: 247px" data-dismiss="modal" id="closeSuccessModalButton">Close</button>
                </div>

            </div>
        </div>
    </div>

    <!-- Order Success Modal -->
    <div class="modal fade" id="orderSuccessModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

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
    let userCustomSearchModel = "";
    function searchDataTable(){

    }
    //document ready function starts
    $( document ).ready(function() {
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

        $('#downloadTemplate').click(function() {
            // Simulate a click on the hidden link to trigger the download
            $('#templateLink')[0].click();
        });


        getOrderSimData();
        getProductListSearch();
        getVendorListSearch();
        getStatusListSearch()

    });
    //document ready function closed

    function getProductListSearch() {
        //   $('#product_name').html("");
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
        //  $('#product_name').html("");
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
        //    $('#product_name').html("");
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



    function getCustomOrderData() {
        $(".loader_body").show();
        initOrderTable("gpshop_sim" , "orderType")
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

    function getOrderSimData() {
        $(".loader_body").show();
        $('#search_product_input').val("").trigger('change');
        $('#search_vendor_input').val("").trigger('change');
        $('#search_status_input').val("").trigger('change');
        initOrderTable("gpshop_sim" , "orderType")
        dataTable.destroy();
        let customSearch = {
            order_type: {
                operator: "like",
                value: $("#order_type").val()
            }
        };

        userCustomSearchModel = JSON.stringify(customSearch);
        console.log("srCustomSearchModel::"+userCustomSearchModel);
        initOrderTable(userCustomSearchModel);
    }

    //init table
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
          //  responsive: true,
            //data: data,
            order: [[0, 'desc']],
            ajax: {
                url: base_url + "api/web/orders/b2b-sim-based/listB2cGpShopDT",
                data: function (d) {
                    d.customQuery = searchQuery;
                }
            },
            select:true,
            columns: [
                {data: 'id'},
                {data: 'gpshopTransactionId'},
                {data: 'gpshopRequisitionDt',
                    render: function(data) {
                        var createdAtDate = new Date(data);
                        var formattedDate = createdAtDate.getFullYear() + '-' +
                            ('0' + (createdAtDate.getMonth() + 1)).slice(-2) + '-' +
                            ('0' + createdAtDate.getDate()).slice(-2) + ' ' +
                            ('0' + createdAtDate.getHours()).slice(-2) + ':' +
                            ('0' + createdAtDate.getMinutes()).slice(-2) + ':' +
                            ('0' + createdAtDate.getSeconds()).slice(-2);
                        return formattedDate;
                    }
                },
                {data: 'customerName'},
                {data: 'customerContactNumber'},
                {data: 'statusName',
                    autowidth: true,
                    render: function (data, type, full, row) {
                        if (data == "New Order") {
                            return '<button class="btn btn-b2b-sm btn-info btn-sm btn-disabled">New Order</button>';
                        } else if(data == "First Contact"){
                            return '<button class="btn btn-b2b-sm btn-primary btn-sm btn-disabled">First Contact</button>';
                        } else if(data == "Scheduled"){
                            return '<button class="btn btn-b2b-sm btn-dark btn-sm btn-disabled">Scheduled</button>';
                        } else if(data == "Sim Activation"){
                            return '<button class="btn btn-b2b-sm btn-danger btn-sm btn-disabled">Sim Active</button>';
                        } else if(data == "Installation"){
                            return '<button class="btn btn-b2b-sm btn-warning btn-sm btn-disabled">Installation</button>';
                        }else if(data == "Pack Activation"){
                            return '<button class="btn btn-b2b-sm btn-dark btn-sm btn-disabled">Pack Activation</button>';
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
                {data: 'productType'},
                {data: 'productName'},

                {
                    data: 'id',
                    render: function (data, type, full, row){
                        return '<button class="btn btn-b2b-sm btn-b2b-sm-download btn-sm exclude-click">Download Excel</button>';
                    }
                },

                {
                    data: 'statusName',
                    render: function (data, type, full, row){
                        if(data === "Cancelled" || data === "Onboarded"){
                            return '<button class="btn btn-b2b-sm btn-b2b-sm-base btn-sm change-status exclude-click" disabled>Change Status</button>';
                        } else{
                            return '<button class="btn btn-b2b-sm btn-b2b-sm-base btn-sm change-status exclude-click" >Change Status</button>';
                        }

                    }
                }
            ]
        });
        $(".loader_body").hide();
    }
    // table ends


    function updateStatus(){
        $(".loader_body").show();

        var previous_state = $('#previous_state').val();

        let datetimeLocalValue = $('#schedule').val();

        let inputDate = new Date(datetimeLocalValue);
        //  let formattedDate = inputDate.toISOString().slice(0, 19).replace('T', ' ');
        let formattedDate =
            inputDate.getFullYear() + '-' +
            ('0' + (inputDate.getMonth() + 1)).slice(-2) + '-' +
            ('0' + inputDate.getDate()).slice(-2) + ' ' +
            ('0' + inputDate.getHours()).slice(-2) + ':' +
            ('0' + inputDate.getMinutes()).slice(-2) + ':' +
            ('0' + inputDate.getSeconds()).slice(-2);

        console.log(formattedDate);
        let updatedStatus = $("#editStatus option:selected").val().split("/")[1];

        if(previous_state == "New Order" && updatedStatus == "First Contact"){
            var schedule_val = $('#schedule').val();
            var service_area = $('#area').val().split("/")[1];
            var service_sla = $('#area').val().split("/")[0];
        }
        else{
            var schedule_val = "2023-08-30";
            var service_area = "";
            var service_sla = 0;
        }

        if(updatedStatus == "Installation"){
            var device_name = $('#device_name').val();
        }
        else{
            var device_name = "";
        }

        if($("#updateForm").parsley().validate()){
            let orderStatusData = {
                statusName: $('#editStatus').val().split("/")[1],
                statusNameId: $('#editStatus').val().split("/")[2],
                kcpName: $('#kcp_p_name').val(),
                kcpEmail: $('#kcp_p_email').val(),
                kcpContactNumber: $('#kcp_p_contact').val(),
                previousState: $('#previous_state').val(),
                imei: $('#imei_input').val(),
                //   scheduledDt: schedule_val,
                scheduledNote:$('#add_note').val(),
                firstContactNote:$('#add_note').val(),
                simActivationNote:$('#add_note').val(),
                installationNote :$('#add_note').val(),
                finalizationNote :$('#add_note').val(),
                onboardedNote :$('#add_note').val(),
                cancelledNote :$('#add_note').val(),
                deviceName : device_name,
                serviceArea : service_area,
                serviceSla : service_sla

            }
            let id = $("#row_id").val();


            $.ajax({
                type: 'POST',
                url: base_url + "api/web/orders/b2b-sim-based/update-status-gpshop",
                data: {orderStatusData: JSON.stringify(orderStatusData), id: parseInt(id), scheduled_time: formattedDate},
                success: function (resultData) {
                    console.log(resultData);
                    $(".loader_body").hide();
                    if (resultData.code === 200) {
                        let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>"+resultData.message+"<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        //$("#notification_bar").show();
                        $("#createSrNotification").html(custom_msg);
                        $("#changeStatusModal").modal("hide");
                        getOrderSimData();
                        $('#updateForm')[0].reset();
                    } else {
                        $(".loader_body").hide();
                        let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Order Update request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        $("#createSrNotification").html(custom_msg);
                        $("#changeStatusModal").modal("hide");
                        $('#updateForm')[0].reset();
                    }
                },
                error: function (resultData) {
                    console.log(resultData);
                    $(".loader_body").hide();
                    let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Driver creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                    $("#createSrNotification").html(custom_msg);
                    $("#changeStatus").modal("hide");
                    $('#update_order_form')[0].reset();
                }
            });
        } else{
            $(".loader_body").hide();
        }

    }

    function initiateRelatedFieldData(){
        let updatedStatus = $("#editStatus option:selected").val().split("/")[1];
        switch (updatedStatus){
            case "Cancelled" :
                $('#imei_block').hide();
                $('#imei_input').attr("required", false);
                $('#tracker_device_name').hide();
                $('#tracker_device_name').attr("required", false);
                $('#schedule_time').hide();
                $('#schedule_time').attr("required", false);
                $('#area_div').hide();
                $('#area_div').attr("required", false);
                break

            // case "Installation" :
            //     $("#schedule_div").show();
            //     $("#device_name").attr("required", true);
            //     $("#imei_number").attr("required", true);
            //     $("#first_contact_div").hide();
            //     $("#scheduled_time").attr("required", false);
            //     break

            default:
                $('#imei_block').hide();
                $('#imei_input').attr("required", false);
                $('#tracker_device_name').hide();
                $('#tracker_device_name').attr("required", false);
                $('#schedule_time').hide();
                $('#schedule_time').attr("required", false);
                $('#area_div').hide();
                $('#area_div').attr("required", false);
        }
    }

    $("#editStatus").on("change", function (){
        initiateRelatedFieldData();
    })



    function modalClose(){
        $("#newOrderEntry").modal('hide');
    }

    // order form submit
    function createNewOrder() {
        var contextPath = '<%= request.getContextPath() %>';
        // console.log(contextPath);
        $("#createSrNotification").html("");
        $(".loader_body").show();

        if($("#dataForm").parsley().validate()){
            var formData = new FormData();
        //    formData.append("chtticket", $("#chtticket").val());
            formData.append("excelFile", $("#upload_file")[0].files[0]);

            $.ajax({
                url: base_url + "orders/save-data-gpshop",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                    //  alert(response);
                    // $('#orderSuccessModal').modal('show');
                    $(".loader_body").hide();
                    if (response) {
                        console.log(response);
                        let custom_msg = "<div class='alert alert-success success-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span>Order has been Created Successfully!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        //$("#notification_bar").show();
                        $("#createSrNotification").html(custom_msg);
                        modalClose();
                        getOrderSimData();
                        $('#dataForm')[0].reset();
                    } else {
                        $(".loader_body").hide();
                        let custom_msg = "<div class='alert alert-danger alert-wth-icon alert-dismissible fade show' role='alert'><span class='alert-icon-wrap'></span> Order creation request has been failed!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'><span class='alert-icon-wrap'><i class='fa fa-times-circle'></i></span></span></button></div>";
                        $("#createSrNotification").html(custom_msg);
                        $('#dataForm')[0].reset();
                        modalClose()
                    }
                },
                error: function(xhr) {
                    alert("Error saving data: " + xhr.responseText);
                }
            });
        } else{
            $(".loader_body").hide();
        }
    }
    // order form end

    // change status button click
    $('#dataTable tbody').on( 'click', 'button.change-status', function (e) {
        //$("#update_order_form").clear();
        $('#updateForm')[0].reset();
        let data = dataTable.row( $(this).parents('#dataTable tbody tr') ).data();
        $("#editCht").val(data.chtTicketId).change();
        var curr_status = data.statusName;
        console.log(curr_status);
        $("#row_id").val(data.id);
        $("#kcp_p_name").val(data.kcpName);
        $("#kcp_p_email").val(data.kcpEmail);
        $("#kcp_p_contact").val(data.kcpContactNumber);
        $("#previous_state").val(data.statusName);
        getAreaList();

        $("#changeStatusModal").modal("show");
        if( curr_status == "Sim Activation") {
            $('#imei_block').show();
            $('#imei_input').attr("required", true);
            $('#tracker_device_name').show();
            $('#tracker_device_name').attr("required", true);
            $('#schedule_time').hide();
            $('#schedule_time').attr("required", false);
            $('#area_div').hide();
            $('#area_div').attr("required", false);
        }
        else if(curr_status == "New Order"){
            $('#schedule_time').show();
            $('#schedule_time').attr("required", true);
            $('#area_div').show();
            $('#area_div').attr("required", true);
            $('#imei_block').hide();
            $('#imei_input').attr("required", false);
            $('#tracker_device_name').hide();
            $('#tracker_device_name').attr("required", false);
        }

        else{
            $('#imei_block').hide();
            $('#imei_input').attr("required", false);
            $('#tracker_device_name').hide();
            $('#tracker_device_name').attr("required", false);
            $('#schedule_time').hide();
            $('#schedule_time').attr("required", false);
            $('#area_div').hide();
            $('#area_div').attr("required", false);
        }
        getStatusAll(data.statusName, data.statusNameId, data.orderType);
    });
    // change status button click end

    function openCreateOrderModal(){
        // getProductList();
        $("#newOrderEntry").modal("show");

    }

    $('#dataTable tbody').on( 'click', 'tr', function (e) {
        console.log(dataTable.row( this ).data());
        if (!$(e.target).hasClass('exclude-click')) {
            var rowData = dataTable.row(this).data();
            if (rowData) {
                var orderId = rowData.id;
                loadOrderDetails(orderId, rowData);
            }
        }

    });

    function loadOrderDetails(orderId, detailedData) {
        $('#status_date').val(detailedData.gpshopRequisitionDt);
        $('#cloud_id').val(detailedData.id);
        $('#transaction_id').val(detailedData.gpshopTransactionId);
        $('#transaction_date').val(detailedData.gpshopRequisitionDt);
        $('#customer_name').val(detailedData.customerName);
        $('#customer_contact').val(detailedData.customerContactNumber);
        $('#customer_email').val(detailedData.customerEmail);
        $('#product_name').val(detailedData.productName);
        $('#product_type').val(detailedData.productType);

        // Populate other fields using detailedData

        $('#detailsOrderView').modal('show');
    }


    function getStatusAll(statusName, statusNameId, orderType) {
        $(".loader_body").show();
        $('#current_status').html("");
        $.ajax({
            type: 'get',
            url: base_url + "api/web/utility/order-status-list",
            success: function (data) {
                if(orderType === "gpshop_sim"){
                    console.log("gpshop_sim");
                    data.data.forEach(element => {
                        $('#current_status').append('<option value="' + element.gpshop_sim + '">' + element.order_name + '</option>');
                    });
                } else if(orderType === "gpshop_simless"){
                    console.log("gpshop_simless");
                    data.data.forEach(element => {
                        $('#current_status').append('<option value="' + element.gpshop_simless + '">' + element.order_name + '</option>');
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
            },
            error: function (error) {
                console.log(error);
            }
        });
    }


    function getStatusNext(statusName, orderType) {
        $('#editStatus').html("");
        $(".loader_body").hide();
        $.ajax({
            type: 'post',
            data: {id: $('#current_status').val(), columnName: orderType},
            url: base_url + "api/web/utility/next-order-status",
            success: function (data) {
                if (orderType == "gpshop_sim") {

                data.data.forEach(element => {
                    $('#editStatus').append('<option value="' + element.gpshop_sim + "/" + element.order_name + "/" + element.id + '">' + element.order_name + '</option>');
                });
                $('#editStatus').append('<option value="100/Cancelled">Cancelled</option>')
                }
                else if(orderType === "gpshop_simless"){
                    data.data.forEach(element => {
                        $('#editStatus').append('<option value="' + element.gpshop_simless + "/" + element.order_name + "/" + element.id + '">' + element.order_name + '</option>');
                    });
                    $('#editStatus').append('<option value="100/Cancelled">Cancelled</option>')
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }

    function getAreaList() {
        $('#area').html("");
        $(".loader_body").hide();
        $.ajax({
            type: 'post',
            data: {type: "service_area"},
            url: base_url + "api/web/orders/b2b-sim-based/area-detail",
            success: function (data) {
                console.log(data);
                data.data.data.forEach(element => {
                    $('#area').append('<option value="' + element.val + "/" + element.name + '">' + element.name + '</option>');
                });

            },
            error: function (error) {
                console.log(error);
            }
        });
    }

</script>

</body>

</html>

