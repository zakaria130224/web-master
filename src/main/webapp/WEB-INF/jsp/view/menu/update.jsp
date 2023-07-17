<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 5/16/2023
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<form name="f" action="menu/update" method="POST" modelAttribute="message">
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
                    <label>Menu URL <span class="red-dark-2">*</span></label>
                    <input type="text" value="${info.menuUrl}" name="menuUrl" class="form-control form-control-sm"
                    >
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label>Icon Class <span class="red-dark-2">*</span></label>
                    <input type="text" value="${info.iconClass}" name="iconClass" class="form-control form-control-sm"
                           required>
                </div>
                <div class="col-md-6 form-group">
                    <label>Description <span class="red-dark-2">*</span></label>
                    <input type="text" value="${info.description}" name="description"
                           class="form-control form-control-sm">
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label>Priority <span class="red-dark-2">*</span></label>
                    <input type="number" name="priority" class="form-control form-control-sm"
                           min="0"
                           value="${info.priority}"
                           required>
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
                <div class="col-md-2 mt-30">
                    <input type="checkbox"
                           id="hasLink"
                           name="hasLink"
                           <c:if test="${info.hasLink == true}">checked </c:if>
                    >
                    <label for="hasLink">Has Link?</label>
                </div>
                <div class="col-md-2 mt-30">
                    <input type="checkbox"
                           id="sidebarMenu"
                           name="sidebarMenu"
                           <c:if test="${info.sidebarMenu == true}">checked </c:if>
                    >
                    <label for="sidebarMenu">Is Sidebar?</label>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-6 form-group">
                    <label>Parent Menu <span class="red-dark-2"></span></label>
                    <select class="form-control form-control-sm select2" name="parentId">
                        <option class="form-control form-control-sm" value="0">--None--</option>
                        <c:forEach var="item" items="${menus}">
                            <c:if test="${item.parent == true && item.id != info.id}">
                                <option class="form-control form-control-sm" value="${item.id}"
                                <c:if test="${info.parentId == item.id}">selected </c:if>
                            </c:if>
                            >${item.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-md-2 mt-30">
                    <input type="checkbox"
                           id="api"
                           name="api"
                           <c:if test="${info.api == true}">checked </c:if>
                    >
                    <label for="api">Is API?</label>
                </div>
                <div class="col-md-2 mt-30">
                    <input type="checkbox"
                           id="parent"
                           name="parent"
                           <c:if test="${info.parent == true}">checked </c:if>
                    >
                    <label for="api">Is Parent?</label>

                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save changes</button>
        </div>
    </div>
</form>