<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 5/24/2023
  Time: 12:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" data-enable-remember="true" data-auto-collapse-size="4048" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-none d-sm-inline-block">
      <strong><a href="dashboard.html" class="nav-link">Dashboard</a></strong>
    </li>
  </ul>

  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
    <!-- Messages Dropdown Menu -->
    <li class="nav-item dropdown">
      <div class="user-panel d-flex">
        <div class="info">
          <a href="#" class="d-block">Sean</a>
        </div>
        <div class="image">
          <img src="${pageContext.request.contextPath}/assets/dist/img/admin.png" class="img-circle elevation-2" alt="User Image" />
        </div>
      </div>
    </li>
    <!-- Notifications Dropdown Menu -->
    <li class="nav-item dropdown">
      <a class="nav-link" data-toggle="dropdown" href="#">
        <i class="far fa-bell"></i>
      </a>
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <span class="dropdown-item dropdown-header">15 Notifications</span>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-envelope mr-2"></i> 4 new messages
          <span class="float-right text-muted text-sm">3 mins</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-users mr-2"></i> 8 friend requests
          <span class="float-right text-muted text-sm">12 hours</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item">
          <i class="fas fa-file mr-2"></i> 3 new reports
          <span class="float-right text-muted text-sm">2 days</span>
        </a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
      </div>
    </li>
  </ul>
</nav>

<%--<nav class="ecommerce-navbar navbar-expand navbar-light bg-white justify-content-between">
  <div class="container-small d-flex flex-between-center" data-navbar="data-navbar">
    <div class="dropdown">
      <button class="btn text-900 ps-0 pe-5 text-nowrap dropdown-toggle dropdown-caret-none" data-category-btn="data-category-btn" data-bs-toggle="dropdown"><span class="fas fa-bars me-2"></span>Category</button>
      <div class="dropdown-menu border py-0 category-dropdown-menu">
        <div class="card border-0 scrollbar" style="max-height: 657px;">
          <div class="card-body p-6 pb-3">
            <div class="row gx-7 gy-5 mb-5">
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="pocket" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Business</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">B2B BD</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">ShipStation</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">SurveyMonkey </a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Dropbox Business</a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="home" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Education</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Khan Accadepmy</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Remind</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">edX</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">ClassDojo</a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="globe" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Entertainment</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Tubi</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Clubhouse</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Pluto TV</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Goodreads</a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="monitor" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Fun &amp; Jokes</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">9gag</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Memedroid</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Easy xkcd</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">iFunny </a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="truck" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Information</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Airbnb </a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Wolfram Alpha</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Wikipanion</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Wordbook Dictionary</a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="codesandbox" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">News</h6>
                </div>
                <div class="ms-n2">
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">inkl</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Google News</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Flipboard</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Ground News</a>
                </div>
              </div>
              <div class="col-12 col-sm-6 col-md-4">
                <div class="d-flex align-items-center mb-3"><span class="text-primary me-2" data-feather="watch" style="stroke-width:3;"></span>
                  <h6 class="text-1000 mb-0 text-nowrap">Social</h6>
                </div>
                <div class="ms-n2"><a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Snapchat</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Pinterest</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">WeChat</a>
                  <a class="text-black d-block mb-1 text-decoration-none hover-bg-100 px-2 py-1 rounded-2" href="#!">Amra Chat</a>
                </div>
              </div>
            </div>
            <div class="text-center border-top pt-3"><a class="fw-bold" href="#!">See all Categories<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a></div>
          </div>
        </div>
      </div>
    </div>
    <ul class="navbar-nav justify-content-end align-items-center">
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link ps-0 <c:choose><c:when test="${menu=='Home'}">active</c:when></c:choose>" aria-current="page" href="${pageContext.request.contextPath}/home">Home</a></li>
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link <c:choose><c:when test="${menu=='Discover'}">active</c:when></c:choose>" href="${pageContext.request.contextPath}/discover">Discover</a></li>
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link <c:choose><c:when test="${menu=='FreeApp'}">active</c:when></c:choose>" href="${pageContext.request.contextPath}/free-app">Free Apps</a></li>
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link <c:choose><c:when test="${menu=='TopRated'}">active</c:when></c:choose>" href="${pageContext.request.contextPath}/top-rated">Top rated</a></li>
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link <c:choose><c:when test="${menu=='most-used'}">active</c:when></c:choose>" href="${pageContext.request.contextPath}/most-used">Most Used</a></li>
      <li class="nav-item" data-nav-item="data-nav-item"><a class="nav-link <c:choose><c:when test="${menu=='offers'}">active</c:when></c:choose>" aria-current="page" href="${pageContext.request.contextPath}/offers">Offers</a></li>
    </ul>
  </div>
</nav>--%>





