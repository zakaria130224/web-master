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

    <jsp:include page="./../../../../partial_new/header-link.jsp"></jsp:include>

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
                        <h5>Vehicle Maintenance Log</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Devices </a></li>
                            <li class="breadcrumb-item active">VTS</li>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left">Maintenance Log</h3>
                                    </div>
                                    <div class="float-right">
                                        <button type="submit" class="btn btn-sm btn-custom-white mr-2" data-toggle="modal" data-target="#newMaintenanceEntry"><i class="fa fa-plus-circle"></i> Add New Maintenance Entry</button>
                                        <button type="submit" class="btn btn-sm btn-custom-blue"><i class="fa fa-download"></i> Export</button>
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
                                                <table class="table" id="dataTableMaintenance">
                                                    <thead class="b2b-custom-boder">
                                                    <th>Vehicle Name</th>
                                                    <th>Driver</th>
                                                    <th>Type</th>
                                                    <th>Parts Type</th>
                                                    <th>Quantity</th>
                                                    <th>Date</th>
                                                    <th>Cost</th>
                                                    <th>Next Due</th>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                                            <div class="b2b-list-block">
                                                                <h5 class="card-title black-30 font-16 b2b-font-weight-500">Light Demo</h5>
                                                                <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="w-100">
                                                                <div class="float-left mr-2" style="border-radius: 50px; height: 40px; width: 40px;">
                                                                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                                                         class="img-circle" alt="User Image"/>
                                                                </div>
                                                                <div class="b2b-list-block">
                                                                    <p class="black-30 font-16 b2b-font-weight-500 mb-0">John Doe</p>
                                                                    <p class="card-text black-60 font-12 b2b-font-weight-700">+8801744439069</p>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>AC Gas Charge</td>
                                                        <td>XYZ</td>
                                                        <td>10</td>
                                                        <td>May 6, 2023</td>
                                                        <td>BDT 1000.00</td>
                                                        <td>After 1000.0 km</td>
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

    <div class="modal left fade" id="maintenanceDetails" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="myModalLabel1">Maintenance Details</h4>
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
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="vehicle_type_d">Select Vehicle</label>
                                        <input type="text" class="form-control" id="vehicle_type_d" placeholder="Select" value="Vehicle 2">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="maintenance_type_d">Maintenance Type</label>
                                        <input type="text" class="form-control" id="maintenance_type_d" placeholder="Select" value="AC Filter Change">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="parts_type_d">Parts Type</label>
                                        <input type="text" class="form-control" id="parts_type_d" placeholder="Select" value="AC">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="quantity_d">Quantity</label>
                                        <input type="text" class="form-control" id="quantity_d" placeholder="Type" value="1">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cost_d">Cost</label>
                                        <input type="text" class="form-control" id="cost_d" placeholder="Type" value="1000">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Reminder</label>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="custom-control custom-radio">
                                                    <input class="custom-control-input" type="radio" id="customRadio1_d" name="reminder" checked>
                                                    <label for="customRadio1" class="custom-control-label">Next Date</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="custom-control custom-radio">
                                                    <input class="custom-control-input" type="radio" id="customRadio2_d" name="reminder" checked>
                                                    <label for="customRadio2" class="custom-control-label">Millage</label>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="next_date">Next date of maintenance</label>
                                        <input type="text" class="form-control" id="next_date_d" placeholder="Select" value="22 July, 2023">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="discription_d">Description</label>
                                        <input type="text" class="form-control" id="discription_d" placeholder="Type">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left mr-2">close</button>
                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-danger float-left mr-2">Delete</button>
                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal left fade" id="newMaintenanceEntry" tabindex="" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title float-left" id="myModalLabel2">New Maintenance Entry</h4>
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
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="vehicle_type">Select Vehicle</label>
                                        <input type="text" class="form-control" id="vehicle_type" placeholder="Select">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="maintenance_type">Maintenance Type</label>
                                        <input type="text" class="form-control" id="maintenance_type" placeholder="Select">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="parts_type">Parts Type</label>
                                        <input type="text" class="form-control" id="parts_type" placeholder="Select">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="quantity">Quantity</label>
                                        <input type="text" class="form-control" id="quantity" placeholder="Type">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cost">Cost</label>
                                        <input type="text" class="form-control" id="cost" placeholder="Type">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Reminder</label>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="custom-control custom-radio">
                                                    <input class="custom-control-input" type="radio" id="customRadio1" name="reminder">
                                                    <label for="customRadio1" class="custom-control-label">Next Date</label>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="custom-control custom-radio">
                                                    <input class="custom-control-input" type="radio" id="customRadio2" name="reminder" checked>
                                                    <label for="customRadio2" class="custom-control-label">Millage</label>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="next_date">Next date of maintenance</label>
                                        <input type="text" class="form-control" id="next_date" placeholder="Select">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="discription">Description</label>
                                        <input type="text" class="form-control" id="discription" placeholder="Type">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn b2b-submit-btn-base btn-outline-primary float-left">close</button>
                    <button type="submit" class="btn btn-primary b2b-submit-btn-base">Add Entry</button>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="./../../../../partial_new/footer.jsp" />

</div>
<!-- /.content-wrapper -->



<!-- Modal -->

<!-- ./wrapper -->

<jsp:include page="./../../../../partial_new/script.jsp" />
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
            $("#maintenanceDetails").modal("show");
        } );
    });

</script>

</body>

</html>

