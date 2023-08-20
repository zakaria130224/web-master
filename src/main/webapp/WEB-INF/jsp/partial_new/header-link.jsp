<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<spring:eval expression="@environment.getProperty('app.name')" var="appName"/>
<spring:eval expression="@environment.getProperty('app.domain_url')" var="domain_url"/>
<!-- ===============================================-->
<!--    Favicons-->
<!-- ===============================================-->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/b2b/dist/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="${pageContext.request.contextPath}/assets/b2b/dist/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/assets/b2b/dist/favicon-16x16.png" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/font-telenor.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/adminlte.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/font-awesome/css/font-awesome.min.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/select2/css/select2.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/parsley/parsley.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/datatable/datatables.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/datatable-custom.css" />

<input type="hidden" id="domain_url" value="${pageContext.request.contextPath}">



