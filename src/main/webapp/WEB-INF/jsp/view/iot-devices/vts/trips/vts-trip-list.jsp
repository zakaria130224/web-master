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
    <title>Dashboard</title>

    <jsp:include page="./../../../../partial_new/header-link.jsp"></jsp:include>
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


                <%--row block 1--%>
                <div class="row">
                    <div class="col-md-8 col-lg-8 col-sm-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="b2b-font-20-500 black-10">Distance Travelled (KM) Vs Estimated Fuel Used (L)</h3>
                                <h6 style="color: #656367; font-weight: 400" class="mt-1 mb-2">Last Updated on 11:59 PM, 01 July 2023</h6>

                                <hr>

                                <div class="row">

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>All Vehicles</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <!-- select -->
                                        <div class="form-group">
                                            <select class="form-control bg-dropdown select2">
                                                <option>Last 7 Days</option>
                                                <option>Last 30 Days</option>
                                                <option>Last 6 Month</option>
                                                <option>Last 1 Year</option>
                                            </select>
                                        </div>
                                    </div>


                                    <div class="col-md-12 mt-2 mb-2">
                                        <div class="row">
                                            <div class="col-md-3 text-color-gray">
                                                <h6><span class="small-indicator color-blue"></span> Distance Travelled</h6>
                                            </div>
                                            <div class="col-md-3 text-color-gray">
                                                <h6><span class="small-indicator color-hue"></span> Estimated Fuel Used</h6>
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
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header h-75p b2b-modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Titel of the model</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <img src="${pageContext.request.contextPath}/assets/b2b/dist/icon/x-circle.png">
                </button>
            </div>
            <div class="modal-body">
                <p>9 Results Found</p>
                <div class="table-responsive">
                    <table class="table" id="dataTable">
                        <thead class="b2b-custom-boder">
                        <th class="w-50">Vehicle</th>
                        <th>Driver</th>
                        <th>Alarms</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <div class="w-100">
                                    <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                    <div class="b2b-list-block">
                                        <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                        <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="user-panel d-flex">
                                    <div class="image float-left">
                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                             class="img-circle" alt="User Image"/>
                                    </div>
                                    <div class="info">
                                        <p class="black-30 font-size-16 m-0">John Doe</p>
                                        <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                        <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                    </div>
                                </div>
                            </td>
                            <td><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="w-100">
                                    <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                    <div class="b2b-list-block">
                                        <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                        <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="user-panel d-flex">
                                    <div class="image float-left">
                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                             class="img-circle" alt="User Image"/>
                                    </div>
                                    <div class="info">
                                        <p class="black-30 font-size-16 m-0">John Doe</p>
                                        <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                        <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                    </div>
                                </div>
                            </td>
                            <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="w-100">
                                    <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                    <div class="b2b-list-block">
                                        <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                        <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="user-panel d-flex">
                                    <div class="image float-left">
                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                             class="img-circle" alt="User Image"/>
                                    </div>
                                    <div class="info">
                                        <p class="black-30 font-size-16 m-0">John Doe</p>
                                        <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                        <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                    </div>
                                </div>
                            </td>
                            <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                        </tr>
                        <tr>
                            <td>
                                <div class="w-100">
                                    <div class="float-left mr-2" style="border-radius: 8px; height: 40px; width: 40px; background: #E1F0FF"></div>
                                    <div class="b2b-list-block">
                                        <h5 class="card-title black-30 font-16 b2b-font-weight-600">Light Demo</h5>
                                        <p class="card-text black-50 font-12 b2b-font-weight-700">72.33 Fuel Consumed</p>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="user-panel d-flex">
                                    <div class="image float-left">
                                        <img src="${pageContext.request.contextPath}/assets/b2b/dist/img/admin.png"
                                             class="img-circle" alt="User Image"/>
                                    </div>
                                    <div class="info">
                                        <p class="black-30 font-size-16 m-0">John Doe</p>
                                        <p class="black-50 font-size-14 m-0">+8801944439069</p>
                                        <%--<span>${logedUser.loginName}<i class="zmdi zmdi-chevron-down"></i></span>--%>
                                    </div>
                                </div>
                            </td>
                            <td class="b2b-vertical-middle"><Span class="font-size-16 b2b-font-weight-500">1</Span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer h-75p">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- ./wrapper -->

<jsp:include page="./../../../../partial_new/script.jsp" />

<script>
    $( document ).ready(function() {
        $(".select2").select2();
        $("#dataTable").dataTable({

        });
    });
</script>

</body>

</html>
