<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/16/2023
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<form name="f" action="responsibility/update" method="POST" modelAttribute="message">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <input type="hidden" value="${info.id}" name="id">
            <div class="row">
                <div class="col-md-6 form-group">
                    <label>Name <span class="red-dark-2">*</span></label>
                    <input type="text" value="${info.name}" name="name" class="form-control form-control-sm"
                           placeholder="Enter Name"
                           required>
                </div>
                <div class="col-md-6 form-group">
                    <label>Description <span class="red-dark-2">*</span></label>
                    <input type="text" value="${info.description}" name="description"
                           class="form-control form-control-sm">
                </div>
                <div class="col-md-2 mt-30">
                    <input
                            type="checkbox"
                            id="active"
                            name="active"
                            <c:if test="${info.active == true}">checked </c:if>

                    />
                    <label for="active">Status</label>
                    <%--                    </div>--%>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12 form-group">
                    <label>Menu <span class="red-dark-2"></span></label>
                    <select class="form-control form-control-sm select2" id="menus" name="menus"
                            multiple="multiple">
                        <option class="form-control form-control-sm">--None--</option>
                        <c:forEach var="item" items="${menus}">
                            <option class="form-control form-control-sm" value="${item.id}"
                                    <c:forEach var="map" items="${info.menuMapList}">
                                        <c:if test="${map.menuId==item.id}">selected </c:if>
                                    </c:forEach>
                            >${item.name}</option>
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