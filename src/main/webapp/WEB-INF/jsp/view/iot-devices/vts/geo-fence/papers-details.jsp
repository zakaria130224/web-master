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
        .text-base-green{
            color: #47BE7D;
        }
        .text-base-yellow{
            color: #E9B500;
        }
        .text-base-red{
            color: #D9214E;
        }
        .text-base-gray{
            color: #DEDEDE;
        }
        .papers-block{
            background: #F2F8FD;
            border: 1px solid #F2F8FD;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 15px;
        }
        .papers-block h3{
            font-size: 32px;
            font-weight: 500;
            color: #181C32;
        }
        .papers-block p{
            font-size: 14px;
            font-weight: 400;
        }
        .papers-block a{
            font-size: 12px;
            font-weight: 700;
            color: #3699FF;
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
                        <h5>Papers</h5>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">VTS </a></li>
                            <li class="breadcrumb-item"><a href="#">Papers </a></li>
                            <li class="breadcrumb-item active">Papers Details</li>
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
                                        <h3 class="b2b-font-20-500 black-10 float-left">Vehicle 1</h3>
                                    </div>
                                </div>

                                <hr>

                                <div class="row">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Registration</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Insurance</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Fitness</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Tax Token</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Route Permit</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-6">
                                        <div class="p-3 papers-block">
                                            <h3>Others</h3>
                                            <p class="mb-5">
                                                <span class="right badge badge-success font-12">valid</span>
                                                <span class="" style="color: #A1A6AB"> Expiry Date</span>
                                                <span style="color: #353535"> 9 July 2023</span>
                                            </p>
                                            <div class="link-group">
                                                <a href="" class="mr-3"><i class="fa fa-bars"></i> Details</a>
                                                <a href="" class="mr-3"><i class="fa fa-pencil"></i> Edit</a>
                                                <a href="" class="mr-3"><i class="fa fa-trash"></i> Delete</a>
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


</body>

</html>
