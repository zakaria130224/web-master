<%--
  Created by IntelliJ IDEA.
  User: ALEX-PC
  Date: 5/24/2023
  Time: 12:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row g-3 mb-9">
  <div class="col-12">
    <div class="whooping-banner w-100 rounded-3 overflow-hidden">
      <%--<div class="bg-holder z-index--1 product-bg" style="background-image:url(${pageContext.request.contextPath}/assets/img/e-commerce/whooping_banner_product.png);background-position: bottom right;">
      </div>--%>
      <!--/.bg-holder-->

      <div class="bg-holder z-index--1 shape-bg" style="background-image:url(${pageContext.request.contextPath}/assets/img/e-commerce/whooping_banner_shape_2.png);background-position: bottom left;">
      </div>
      <!--/.bg-holder-->

      <div class="banner-text light">
        <h2 class="text-warning-300 fw-bolder fs-lg-5 fs-xxl-6">IOT Products <span class="gradient-text">60% </span>Off</h2>
        <h3 class="fw-bolder fs-lg-3 fs-xxl-5 text-white light">on everyday items</h3>
      </div><a class="btn btn-lg btn-primary rounded-pill banner-button" href="#!">Shop Now</a>
    </div>
  </div>
  <div class="col-12 col-xl-6">
    <div class="gift-items-banner w-100 rounded-3 overflow-hidden">
      <div class="bg-holder z-index--1 banner-bg" style="background-image:url(${pageContext.request.contextPath}/assets/img/e-commerce/gift-items-banner-bg.png);">
      </div>
      <!--/.bg-holder-->

      <div class="banner-text text-md-center light">
        <h2 class="text-white fw-bolder fs-xl-4">Get <span class="gradient-text">10% Off </span><br class="d-md-none"> on gift items</h2><a class="btn btn-lg btn-primary rounded-pill banner-button" href="#!">Buy Now</a>
      </div>
    </div>
  </div>
  <div class="col-12 col-xl-6">
    <div class="best-in-market-banner d-flex h-100 px-4 px-sm-7 py-5 px-md-11 rounded-3 overflow-hidden">
      <div class="bg-holder z-index--1 banner-bg" style="background-image:url(${pageContext.request.contextPath}/assets/img/e-commerce/best-in-market-bg.png);">
      </div>
      <!--/.bg-holder-->

      <div class="row align-items-center w-100">
        <div class="col-8">
          <div class="banner-text light">
            <h2 class="text-white fw-bolder fs-sm-4 mb-5 m-lg-10"><br><span class="fs-1 fs-sm-2"></span></h2><a class="btn btn-lg btn-warning rounded-pill banner-button" href="#!">Buy Now</a>
          </div>
        </div>
        <div class="col-4"><img class="w-75" src="${pageContext.request.contextPath}/assets/img/e-commerce/5.png" alt=""></div>
      </div>
    </div>
  </div>
</div>