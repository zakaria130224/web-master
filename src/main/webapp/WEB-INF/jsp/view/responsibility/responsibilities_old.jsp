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
    <nav class="hk-breadcrumb" aria-label="breadcrumb">
      <ol class="breadcrumb breadcrumb-light bg-transparent">
        <li class="breadcrumb-item"><a href="#">${title}</a></li>
        <li class="breadcrumb-item active" aria-current="page">Responsibility</li>
      </ol>
    </nav>


    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title p-2">Responsibility</h3>
                <button class="btn btn-primary float-right mr-2" data-toggle="modal"
                        data-target="#addModal">
                  <i class="fa fa-plus-square"></i> Add
                </button>
              </div>
              <div class="card-body">

                <div class="row">
                  <div class="col-xl-12">
                    <section class="hk-sec-wrapper">
                      <div class="row">
                        <div class="col-sm">
                          <div class="table-wrap">
                            <div class="table-responsive">
                              <table class="table table-hover table-bordered table-striped w-100 display pb-30 " id="dataTbl">
                                <thead class="thead-primary">
                                <tr>
                                  <%--                                                        <th>#</th>--%>
                                  <th>Name</th>
                                  <th>Description</th>
                                  <th>Status</th>
                                  <th>Action</th>
                                </tr>
                                </thead>
                              </table>
                            </div>
                          </div>
                        </div>
                      </div>
                    </section>

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

  <!-- Add Modal forms-->
  <div class="modal fade" id="addModal" role="dialog" aria-labelledby="addModal"
       aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <form name="f" action="responsibility/save" method="POST" modelAttribute="message">
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
                <label>Description <span class="red-dark-2">*</span></label>
                <input type="text" name="description" class="form-control form-control-sm">
              </div>
              <div class="col-md-2 mt-30">
                <input
                        type="checkbox"
                        id="active"
                        name="active"

                />
                <label for="active">Status</label>
                <%--                    </div>--%>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-md-6 form-group">
                <label>Menu <span class="red-dark-2"></span></label>
                <select class="form-control form-control-sm select2" id="menus" name="menus"
                        multiple="multiple">
                  <option class="form-control form-control-sm"></option>
                  <c:forEach var="item" items="${menus}">
                    <option class="form-control form-control-sm"
                            value="${item.id}">${item.name}</option>
                  </c:forEach>
                </select>
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

  <jsp:include page="../../partial/footer.jsp"></jsp:include>
</div>
<!-- /.content-wrapper -->
<jsp:include page="../../partial/footerlink.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assets/custom/js/responsibility.js"></script>





