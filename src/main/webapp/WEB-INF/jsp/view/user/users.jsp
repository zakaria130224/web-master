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
                            <li class="breadcrumb-item"><a href="#">User </a></li>
                            <li class="breadcrumb-item active">User List</li>
                        </ol>
                    </div>
                    <div class="col-md-6">
                        <div class="float-right">
                            <button data-toggle="modal" class="btn b2b-btn-submit-blue mr-2" data-target="#addUser"> Add New User</button>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left pt-2">Order and Installation List</h3>
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
                                            <div class="col-sm">
                                                <div class="table-wrap">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover table-bordered table-striped w-100 display pb-30 " id="userTbl">
                                                            <thead class="thead-primary">
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Login Name</th>
                                                                <th>Email</th>
                                                                <th>Phone</th>
                                                                <th>Status</th>
                                                                <th>Action</th>
                                                            </tr>
                                                            </thead>
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

                </div>

            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>



    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="addUser"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <form name="f" method="POST" modelAttribute="message">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div id="modalMsg">

                        </div>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Name <span class="red-dark-2">*</span></label>
                                <input type="text" id="name" name="name" class="form-control form-control-sm"
                                       placeholder="Enter Name"
                                       required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Login Name <span class="red-dark-2">*</span></label>
                                <input type="text" id="loginName" name="loginName" class="form-control form-control-sm"
                                       placeholder="Enter Login Name"
                                       required>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Email <span class="red-dark-2">*</span></label>
                                <input type="email" id="email" name="email" class="form-control form-control-sm"
                                       placeholder="Enter Email"
                                       required>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Phone <span class="red-dark-2">*</span></label>
                                <input type="tel" name="phone" id="phone" class="form-control form-control-sm"
                                       placeholder="8801XXXXXXXXX"
                                       pattern="^(880)?1\d{9}$"
                                       required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2 mt-5">
                                <input
                                        type="checkbox"
                                        id="active"
                                        name="active"

                                />
                                <label for="active">Status</label>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Responsibility <span class="red-dark-2"></span></label>
                                <select class="form-control form-control-sm select2" name="responsibility"
                                        id="responsibility">
                                    <option class="form-control form-control-sm"></option>
                                    <c:forEach var="item" items="${responsibility}">
                                        <option class="form-control form-control-sm"
                                                value="${item.id}">${item.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-2 mt-30">
                                <input
                                        type="checkbox"
                                        id="primary"
                                        name="primary"

                                />
                                <label for="primary">Is Primary?</label>
                            </div>
                            <div class="col-md-2 mt-30">
                                <button type="button" class="btn btn-gradient-primary btn-sm" id="addRes">
                                    +
                                </button>
                            </div>
                        </div>
                        <hr>
                        <div class="table-responsive">
                            <table class="table table-hover w-100 display pb-30 " id="responsibilityTbl">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Is Primary</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addUser()">Save changes</button>
                    </div>
                </div>
            </form>
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
<script src="${pageContext.request.contextPath}/assets/custom/js/user/user.js"></script>
</body>

</html>


