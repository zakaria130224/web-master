<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Dashboard</title>
    <link rel="icon" type="image/png" sizes="32x32" href="favicon.ico"/>
    <link rel="manifest" href="site.webmanifest"/>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback"/>
    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/v2/plugins/fontawesome-free/css/all.min.css"/>
    <!-- DataTables -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/v2/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/v2/plugins/datatables-responsive/css/responsive.bootstrap4.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/v2/plugins/datatables-buttons/css/buttons.bootstrap4.min.css"/>
    <%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>--%>
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/v2/dist/plugins/fontawesome-free.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/v2/dist/css/adminlte.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/v2/dist/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/v2/dist/css/pages/dashboard.css"/>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<input type="hidden" id="domain_url" name="domain_url" value="${pageContext.request.contextPath}">

<body class="sidebar-mini sidebar-no-expand sidebar-open ">