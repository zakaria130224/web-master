<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 6/19/2023
  Time: 1:16 AM
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="../../partial/headerlink.jsp"></jsp:include>


<div class="wrapper">
    <jsp:include page="../../partial/top-nav.jsp"></jsp:include>

    <!-- Main Sidebar Container -->
    <jsp:include page="../../partial/sidebar.jsp"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" style="padding: 75px 0px 75px 0px">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-1">
                    <div class="col-sm-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">User Management</a></li>
                            <li class="breadcrumb-item active">Menu</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-outline card-primary">
                            <div class="card-header">
                                <%--                                <h3 class="card-title">Report For Engine Off</h3>--%>

                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                    <button class="btn btn-outline-primary btn-sm float-right m-1"
                                            data-toggle="modal"
                                            data-target="#addModal"> + Add
                                    </button>
                                    <button class="btn btn-primary btn-sm float-right m-1"><i
                                            class="fa fa-file-excel"></i> Button
                                    </button>
                                </div>
                            </div>


                            <span class="material-icons-outlined">map</span>
                            <!-- /.card-header -->
                            <div class="card-body">

                                <table class="table table-hover" id="dataTbl">
                                    <thead class="thead-primary">
                                    <tr>
                                        <%--                                                        <th>#</th>--%>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>IsParent</th>
                                        <th>Priority</th>
                                        <th>IsSidebarMenu</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

    <jsp:include page="../../partial/footer.jsp"></jsp:include>
</div>
<!-- Add Modal forms-->
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="addModal"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <form name="f" action="menu/save" method="POST" modelAttribute="message">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Modal title</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Name <span class="red-dark-2">*</span></label>
                            <input type="text" name="name" class="form-control form-control-sm" placeholder="Enter Name"
                                   required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Menu URL <span class="red-dark-2">*</span></label>
                            <input type="text" name="menuUrl" class="form-control form-control-sm"
                            >
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Icon Class <span class="red-dark-2">*</span></label>
                            <input type="text" name="iconClass" class="form-control form-control-sm"
                                   required>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Description <span class="red-dark-2">*</span></label>
                            <input type="text" name="description" class="form-control form-control-sm">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Priority <span class="red-dark-2">*</span></label>
                            <input type="number" name="priority" class="form-control form-control-sm"
                                   min="0"
                                   value="0"
                                   required>
                        </div>

                        <div class="col-md-2 mt-30">
                            <div class="custom-control custom-checkbox checkbox-primary">
                                <input type="checkbox" class="custom-control-input" id="active" name="active">
                                <label class="custom-control-label" for="active">Status</label>
                            </div>
                        </div>
                        <div class="col-md-2 mt-30">
                            <div class="custom-control custom-checkbox checkbox-primary">
                                <input type="checkbox" class="custom-control-input" id="hasLink" name="hasLink">
                                <label class="custom-control-label" for="hasLink">Has Link?</label>
                            </div>
                        </div>
                        <div class="col-md-2 mt-30">
                            <div class="custom-control custom-checkbox checkbox-primary">
                                <input type="checkbox" class="custom-control-input" id="sidebar" name="sidebarMenu">
                                <label class="custom-control-label" for="sidebar">Is Sidebar?</label>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>Parent Menu <span class="red-dark-2"></span></label>
                            <select class="form-control form-control-sm select2" name="parentId">
                                <option class="form-control form-control-sm" value="0">--None--</option>
                                <c:forEach var="item" items="${menus}">
                                    <c:if test="${item.parent == true}">
                                        <option class="form-control form-control-sm"
                                                value="${item.id}">${item.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-2 mt-30">
                            <div class="custom-control custom-checkbox checkbox-primary">
                                <input type="checkbox" class="custom-control-input" id="apiParent" name="api">
                                <label class="custom-control-label" for="apiParent">Is API?</label>
                            </div>
                        </div>
                        <div class="col-md-2 mt-30">
                            <div class="custom-control custom-checkbox checkbox-primary">
                                <input type="checkbox" class="custom-control-input" id="isParent" name="parent">
                                <label class="custom-control-label" for="isParent">Is Parent?</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </form>
    </div>

</div>

<!-- Update Modal forms-->
<div class="modal fade" id="updateModal" role="dialog" aria-labelledby="updateModal"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" id="updateModalBody">

    </div>

</div>

<!-- /.content-wrapper -->
<jsp:include page="../../partial/footerlink.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assets/custom/js/menu.js"></script>

