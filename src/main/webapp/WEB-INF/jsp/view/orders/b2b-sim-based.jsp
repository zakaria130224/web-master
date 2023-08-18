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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<spring:eval expression="@environment.getProperty('app.name')" var="appName"/>
<spring:eval expression="@environment.getProperty('app.domain_url')" var="domain_url"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>VTS - Maintenance</title>

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
    </style>

</head>

<body class="hold-transition sidebar-mini">

<div class="wrapper">
    <!-- Navbar -->
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
                                        <h6>417 Results Found</h6>
                                    </div>


                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="row">
                                            <div class="table-responsive">
                                                <table class="table" id="dataTableMaintenance">
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
                                                    <c:forEach items="${orders}" var="order">
                                                        <tr>
                                                        <td>

                                                        <a data-target="#detailsOrderView" data-toggle="modal" class="MainNavText" id="DetailsOrders"
                                                         href="#detailsOrderView"  data-toggle="modal"  data-id="${order.id}" data-chttickets="${order.chtTicketId}"
                                                           data-status="${order.statusName}" data-bs_code="${order.bsCode}"
                                                           data-vts_sim="${order.vtsSimNo}" data-sim_kit="${order.simKit}" data-pack_name="${order.packName}"
                                                           data-base_price="${order.basePrice}" data-rate_plan_name="${order.ratePlan}"
                                                           data-mrp="${order.unitPrice}" data-alt_num="${order.altContactNum}" data-kcp_name="${order.kcpName}"
                                                           data-kcp_email="${order.kcpEmail}" data-kcp_contact="${order.kcpContactNumber}"
                                                           data-support_partner="${order.supportPartnerName}" data-product_type="${order.productType}"
                                                           data-aud_num="${order.audioListenMsisdn}" data-company_name="${order.companyName}" data-updated_at="${order.updatedAt}">${order.id}</a>
                                                        </td>

                                                        <td>${order.chtTicketId}</td>
                                                        <td>${order.createdAt}</td>
                                                            <td>${order.vtsSimNo}</td>
                                                            <td>${order.packName}</td>
                                                        <td>${order.simKit}</td>
                                                        <td>${order.productType}</td>
                                                            <td>${order.supportPartnerName}</td>
<%--                                                        <td><button type="button" class="btn btn-primary">--%>
<%--                                                            New Order--%>
<%--                                                        </button></td>--%>
                                                            <td>
                                                                <!-- Use conditional classes to change button color -->
                                                                <c:choose>
                                                                    <c:when test="${order.statusName == 'New Order'}">
                                                                        <button type="button" class="btn" style="background-color: #00C8FF; color: #F2FCFF">New Order</button>
                                                                    </c:when>
                                                                    <c:when test="${order.statusName == 'Scheduled'}">
                                                                        <button type="button" class="btn" style="background-color: #2F80ED; color: #F2FCFF">Scheduled</button>
                                                                    </c:when>
                                                                    <c:when test="${order.statusName == 'Sim Active'}">
                                                                        <button type="button" class="btn" style="background-color: #EB5757; color: #F2FCFF">Sim Active</button>
                                                                    </c:when>
                                                                    <c:when test="${order.statusName == 'Installation'}">
                                                                        <button type="button" class="btn" style="background-color: #F2994A; color: #F2FCFF">Installation</button>
                                                                    </c:when>
                                                                    <c:when test="${order.statusName == 'Finalization'}">
                                                                        <button type="button" class="btn" style="background-color: #9B51E0; color: #F2FCFF">Finalization</button>
                                                                    </c:when>
                                                                    <c:when test="${order.statusName == 'Onboarded'}">
                                                                        <button type="button" class="btn" style="background-color: #6FCF97; color: #F2FCFF">Onboarded</button>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <button type="button" class="btn" style="background-color: #00C8FF; color: #F2FCFF">New Order</button>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </td>
                                                            <td>${order.ratePlan}</td>
<%--                                                        <td>${order.address}</td>--%>
                                                        <td><button class="btn btn-download"><i class="fa fa-download"></i> Download</button></td>
                                                        <td><button type="button" class="btn btn-status" style="background-color: #000F3C;color: #F2FCFF" id="changeStatus"
                                                                    data-toggle="modal"  data-id="${order.id}" data-chttickets="${order.chtTicketId}"
                                                                    data-email="${order.customerEmail}" data-status="${order.statusName}" data-customer="${order.customerName}"
                                                        data-kcp_name = "${order.kcpName}" data-kcp_contact = "${order.kcpContactNumber}" data-kcp_email = "${order.kcpEmail}">
                                                            Change Status
                                                        </button></td>
                                                        </tr>
                                                    </c:forEach>

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
    const base_url_third = $("#domain_url").val() + "/";
$(document).ready(function() {
// When the update button is clicked, send data to the server
        $("#successmodal").click(function() {
// Get values from modal inputs
        var orderId = $("#editOrderId").val();
        var updatedStatus = $("#editStatus").val();
        var updatedCht = $("#editCht").val();
        var addNote = $("#add_note").val();
       // var userOtp = $("#user_otp").val();

// Create data object to send to the server
        var data = {
        orderId: orderId,
        updatedStatus: updatedStatus,
        updatedCht: updatedCht,
        addNote: addNote
        //userOtp: userOtp
        };

        // Send data to the server using AJAX
        $.ajax({
        url: base_url_third + "orders/update-data", // Replace with your server URL
        type: "POST",
        data: data,
        success: function(response) {
       // alert("Data updated successfully!");
        // Close the modal or update UI as needed
            $('#statusSuccessModal').modal('show');
        },
        error: function(xhr) {
        alert("Error updating data: " + xhr.responseText);
        }
        });
        });
        });
</script>

<script>
    const base_url_4 = $("#domain_url").val() + "/";
    $(document).ready(function() {
// When the update button is clicked, send data to the server
        $("#successOnboardmodal").click(function() {
// Get values from modal inputs
            var orderId = $("#editOrderIds").val();
            var updatedStatus = $("#editStatuss").val();
            var updatedCht = $("#editChts").val();
            var addNote = $("#add_notes").val();
             var kcpmail = $("#kcpmail").val();
             var kcpphone = $("#kcpphone").val();
            var user_otp = $("#user_otp").val();
            if(user_otp == '123456') {
                console.log(kcpphone);

// Create data object to send to the server
                var data = {
                    orderId: orderId,
                    updatedStatus: updatedStatus,
                    updatedCht: updatedCht,
                    addNote: addNote,
                    kcpMail: kcpmail,
                    kcpPhone: kcpphone
                };

                // Send data to the server using AJAX
                $.ajax({
                    url: base_url_4 + "orders/update-data-onboard", // Replace with your server URL
                    type: "POST",
                    data: data,
                    success: function (response) {
                     //   alert("Data updated successfully!");
                        // Close the modal or update UI as needed
                        $('#statusSuccessModal').modal('show');
                    },
                    error: function (xhr) {
                        alert("Error updating data: " + xhr.responseText);
                    }
                });
            }
            else {
                alert("OTP Error");
            }
        });
    });
</script>

<script>
    const base_url_second = $("#domain_url").val() + "/";

        $("#successfinalmodal").click(function() {

            var excelOrderId =  $("#excelOrderId").val();
            var updateFinalStatus = $("#updateFinalStatus").val();
            var updatedCht =  $("#chtvalue").val();
            var kcpName =  $("#kcp_name").val();
            var kcpEmail =  $("#kcp_email").val();
            var kcpContact = $("#kcp_contact").val();
            var imei = $("#imei").val();
            console.log(excelOrderId);

            $("#updateFinalStatus").val(updateFinalStatus);
            // $("#kcpName").val(kcpName);
            // $("#kcpContact").val(kcpContact);
            // $("#kcpEmail").val(kcpEmail);
            // $("#imei").val(imei);
            // $("#chtvalue").val(updatedCht);



            // Send the form data to the server
            $.ajax({
                url: base_url_second + "orders/update-imei-status",
                type: "POST",
                data: {
                    excelOrderId: excelOrderId,
                    updateFinalStatus: updateFinalStatus,
                    kcpName: kcpName,
                    kcpContact: "880"+ kcpContact,
                    kcpEmail: kcpEmail,
                    imei: imei,
                    updatedCht: updatedCht
                },

                success: function(response) {
                    // Handle success
                  //  console.log(data);
                //    alert("Order and user updated successfully");
                    $('#statusSuccessModal').modal('show');
                    // Refresh or update UI as needed
                },
                error: function(xhr, status, error) {
                    // Handle error
                    console.log('test');
                    alert("An error occurred");
                }
            });
        });
</script>


<script>
    $(document).ready(function() {
        // Ensure that the DOM is fully loaded before attaching the event listener
        $(document).on("click", "#DetailsOrders", function() {
            // Prevent the default behavior of the link (navigating to a new page)
            event.preventDefault();

            // Capture data attributes
            var id = $(this).data("id");
            var status = $(this).data("status");
            var chttickets = $(this).data("chttickets");
            var bs_code = $(this).data("bs_code");
            var company_name = $(this).data("company_name");
            var vts_sim = $(this).data("vts_sim");
            var sim_kit = $(this).data("sim_kit");
            var pack_name = $(this).data("pack_name");
            var base_price = $(this).data("base_price");
            var mrp = $(this).data("mrp");
            var alt_num = $(this).data("alt_num");
            var kcp_name = $(this).data("kcp_name");
            var kcp_email = $(this).data("kcp_email");
            var kcp_contact = $(this).data("kcp_contact");
            var supp_partner = $(this).data("support_partner");
            var product_type = $(this).data("product_type");
            var aud_num = $(this).data("aud_num");
            var updated_at = $(this).data("updatedAt");

            // Log the captured values to the console
            console.log("Link clicked! Your task goes here.");
            console.log("ID:", id);
            console.log("Status:", status);
            console.log("Cht Tickets:", chttickets);

            // Perform your desired task here
            // For example, populate the modal with the captured data
            $("#cloud_id").val(id);
            $("#ticket_id").val(chttickets);
            $("#bs_code").val(bs_code);
            $("#company_name").val(company_name);
            $("#vts_sim").val(vts_sim);
            $("#sim_kit").val(sim_kit);
            $("#pack_name").val(pack_name);
            $("#base_price").val(base_price);
            $("#mrp").val(mrp);
            $("#alt_cont_num").val(alt_num);
            $("#kcp_name").val(kcp_name);
            $("#kcp_email").val(kcp_email);
            $("#kcp_contact").val(kcp_contact);
            $("#support_partner").val(supp_partner);
            $("#product_type").val(product_type);
            $("#aud_auth_number").val(aud_num);
            $("#status_date").val(updated_at);
            // ... Other code
        });
    });
</script>





<script>
    const base_url_first = $("#domain_url").val() + "/";
    $(document).ready(function() {
        // When the edit button is clicked, populate the modal with data
        $(".btn-status").click(function() {
            var id = $(this).data("id");
            var status = $(this).data("status");
            var chttickets = $(this).data("chttickets");
            var customer = $(this).data("customer");
            var msisdn = $(this).data("msisdn");
            var kcp_name = $(this).data("kcp_name");
            var kcp_email = $(this).data("kcp_email");
            var kcp_contact = $(this).data("kcp_contact");

            console.log(chttickets);

            if(status == "New Order" || status == "Scheduled" || status == "Sim Active") {
                $("#editOrderId").val(id);
                $("#editCht").val(chttickets);
                $("#editCustomerName").val(customer);
                $("#editMsisdn").val(msisdn);
                $("#editStatus").val(status);
                console.log("Status:", status);
                console.log("Selected Value:", $("#editStatus").val());
                $("#changeStatusModal").modal("show");
            }
            else if(status == 0 || status == null) {
                $("#editOrderId").val(id);
                $("#editCht").val(chttickets);
                $("#editCustomerName").val(customer);
                $("#editMsisdn").val(msisdn);
               // $("#newOrderEntry").modal("show");
                $("#editStatus").val(status);
                console.log("Status:", status);
                console.log("Selected Value:", $("#editStatus").val());
                $("#changeStatusModal").modal("show");
            }
            else if(status == 2) {
                $("#editOrderId").val(id);
                $("#editCht").val(chttickets);
                $("#editCustomerName").val(customer);
                $("#editMsisdn").val(msisdn);
                // $("#newOrderEntry").modal("show");
                $("#editStatus").val(status);
                console.log("Status:", status);
                console.log("Selected Value:", $("#editStatus").val());
                $("#changeStatusModal").modal("show");
            }

            else if(status == "Installation") {
                $("#excelOrderId").val(id);
                $("#chtvalue").val(chttickets);
                $("#kcp_contact").val(kcp_contact);
                $("#kcp_name").val(kcp_name);
                $("#kcp_email").val(kcp_email);
                $("#updateFinalStatus").val(status);
                console.log("Status:", status);
                console.log("Selected Value:", $("#updateFinalStatus").val());

                $("#changeFinalStatusModal").modal("show");
            }

            else if(status == "Finalization") {
                $("#editOrderIds").val(id);
                $("#editChts").val(chttickets);
                $("#editCustomerNames").val(customer);
                $("#kcpmail").val(kcp_email);
                $("#kcpphone").val(kcp_contact);
                $("#editStatuss").val(status);
                console.log("Status:", status);
                console.log("Selected Value:", $("#editStatuss").val());
               // console.log(kcp_contact);
                // $("#newOrderEntry").modal("show");
                $("#changeStatusOnboardModal").modal("show");
            }

        });

        // Handle the update button click
        $("#updateButton").click(function() {
            var id = $("#editOrderId").val();
            var email = $("#editEmail").val();
            var customer = $("#editCustomerName").val();

            // Send AJAX request to update data using id, email, customer values
            $.ajax({
                url: base_url_first+ "orders/update-data",
                type: "POST",
                data: {
                    id: id,
                    email: email,
                    customerName: customer
                },
                success: function(response) {
                    // Handle success
                  //  alert("Data updated successfully");
                    // Close the modal
                  //  $("#editModal").modal("hide");
                    $('#statusSuccessModal').modal('show');
                },
                error: function(xhr) {
                    // Handle error
                    alert("Error updating data");
                }
            });
        });
    });

</script>
<script>
    $(document).ready(function() {
        const base_url = $("#domain_url").val() + "/";
        $("#saveBtn").click(function() {
            var contextPath = '<%= request.getContextPath() %>';
            console.log(contextPath);
            var formData = new FormData();
            formData.append("chtticket", $("#chtticket").val());
            formData.append("excelFile", $("#upload_file")[0].files[0]);

            $.ajax({
                url: base_url + "orders/save-data",
                type: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function(response) {
                  //  alert(response);
                    $('#orderSuccessModal').modal('show');
                },
                error: function(xhr) {
                    alert("Error saving data: " + xhr.responseText);
                }
            });
        });
    });
    //
    // $(document).ready(function () {
    //     $("#saveBtn").click(function() {
    //  //       event.preventDefault(); // Prevent the default form submission
    //
    //         var formData = new FormData(this);
    //
    //         $.ajax({
    //             type: "POST",
    //             url: "/save-data",
    //             data: formData,
    //             processData: false,
    //             contentType: false,
    //             success: function (response) {
    //                 alert(response); // Display a success message
    //             },
    //             error: function (xhr, status, error) {
    //                 alert("Error: " + error); // Display an error message
    //             }
    //         });
    //     });
    // });

</script>


<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $("#saveBtn").click(function() {--%>
<%--            var formData = $("#dataForm").serialize();--%>
<%--            $.ajax({--%>
<%--                url: "/save-data",--%>
<%--                type: "POST",--%>
<%--                data: formData,--%>
<%--                success: function(response) {--%>
<%--                    alert(response);--%>
<%--                    $("#myModal").modal("hide");--%>
<%--                },--%>
<%--                error: function(xhr) {--%>
<%--                    alert("Error saving data: " + xhr.responseText);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<script>
    $( document ).ready(function() {
        $(".select2").select2();
        const dataTableMaintenance = $("#dataTableMaintenance").dataTable({
            paging: true,
            lengthChange: false,
            searching: false,
            ordering: false,
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

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('#changeStatus').click(function(e) {--%>
<%--            // alert(1);--%>
<%--           // $('#vehicleDetails').modal('hide');--%>
<%--            $("#changeStatusModal").modal("show");--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('#successmodal').click(function(e) {--%>
<%--            // alert(1);--%>
<%--            // $('#vehicleDetails').modal('hide');--%>
<%--          //  $("#statusSuccessModal").modal("show");--%>
<%--            $("#changeStatusModal").modal("hide");--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>

<script>
    $(document).ready(function() {
        $('#orderSuccess').click(function(e) {
            // alert(1);
            // $('#vehicleDetails').modal('hide');
            $("#orderSuccessModal").modal("show");
            $("#newOrderEntry").modal("hide");
        });
    });

</script>

<script>
    $(document).ready(function() {
        $("#closeModalButton").click(function() {
            // Redirect to the specified page
            location.reload();
        });
    });
</script>

<script>
    $(document).ready(function() {
        $("#closeSuccessModalButton").click(function() {
            // Redirect to the specified page
            location.reload();
        });
    });
</script>

</body>

</html>

