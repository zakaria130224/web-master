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
        <li class="breadcrumb-item"><a href="#">User Management ${title}</a></li>
        <li class="breadcrumb-item active" aria-current="page">User</li>
      </ol>
    </nav>


    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <jsp:include page="../../partial/msg.jsp"></jsp:include>
          </div>
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title p-2">Users</h3>
                <button class="btn btn-primary float-right mr-2" data-toggle="modal"
                        data-target="#addUser"><i class="fa fa-plus-square"></i> Add New User</button>
              </div>
              <div class="card-body">

                <div class="row">
                  <div class="col-xl-12">
                    <section class="hk-sec-wrapper">
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

  <jsp:include page="../../partial/footer.jsp"></jsp:include>
</div>

<!-- Add Modal forms-->
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

<!-- Update Modal forms-->
<div class="modal fade" id="updateUser" role="dialog" aria-labelledby="updateUser"
     aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" id="userUpdateMdl">

  </div>

</div>

<!-- /.content-wrapper -->
<jsp:include page="../../partial/footerlink.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assets/custom/js/user/user.js"></script>





