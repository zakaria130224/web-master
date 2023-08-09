<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="msgFrmAjax">

</div>
<c:if test="${not empty success}">
    <div class="alert alert-success alert-wth-icon alert-dismissible fade show" role="alert">
        <span class="alert-icon-wrap"><i class="zmdi zmdi-check-circle"></i></span> ${success}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
</c:if>

<c:if test="${not empty error}">
    <div class="alert alert-danger alert-wth-icon alert-dismissible fade show" role="alert">
        <span class="alert-icon-wrap"><i class="zmdi zmdi-close-circle"></i></span> ${error}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
</c:if>

<c:if test="${not empty warning}">
    <div class="alert alert-warning alert-wth-icon alert-dismissible fade show" role="alert">
        <span class="alert-icon-wrap"><i class="zmdi zmdi-close-circle"></i></span> ${warning}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">×</span>
        </button>
    </div>
</c:if>