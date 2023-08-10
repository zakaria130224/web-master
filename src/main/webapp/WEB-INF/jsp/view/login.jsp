<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Login</title>
    <%--    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png"/>--%>
    <link rel="icon" type="image/png" sizes="32x32" href="favicon.ico"/>
    <%--    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png"/>--%>

    <!-- Google Font: Source Sans Pro -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/all.min.css"/>
    <!-- icheck bootstrap -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/icheck-bootstrap.css"/>
    <!-- Theme style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/adminlte.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/pages/index.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/dist/css/pages/login.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/b2b/plugins/font-awesome-4/css/font-awesome.min.css">
</head>
<body class="hold-transition login-page">
<!-- /.login-logo -->
<div class="container-fluid" style="background-color: white">
    <div class="row full-height">
        <div class="d-none d-lg-flex col-lg-6 left-div p-5">
            <div class="carousel">
                <div
                        id="carouselExampleInterval"
                        class="carousel slide"
                        data-bs-ride="carousel"
                >
                    <div class="carousel-indicators">
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="0"
                                class="active-active"
                                aria-current="true"
                                aria-label="Slide 1"
                        ></button>
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="1"
                                aria-label="Slide 2"
                        ></button>
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="2"
                                aria-label="Slide 3"
                        ></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block img img-fluid"
                                    alt="text"
                            />
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block w-100"
                                    alt="text"
                            />
                        </div>
                        <div class="carousel-item">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block w-100"
                                    alt="text"
                            />
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-text font-telenor-regular">
                <h2>Monitor Everything</h2>
            </div>
            <div class="carousel-copy">
                <p class="font-telenor-regular">
                    Manage all your IoT devices from one single place &amp; get the
                    alarms right on time!
                </p>
            </div>
            <div class="carousel-navigation">
                <!-- Insert carousel navigation here -->
            </div>
        </div>
        <div class="col-lg-6 right-div p-5">
            <jsp:include page="../partial/msg.jsp"></jsp:include>
            <form action="${pageContext.request.contextPath}/login"
                  modelAttribute="usermodel" method="POST">
                <div class="p-2">
                    <img
                            src="${pageContext.request.contextPath}/assets/b2b/dist/img/logo.svg"
                            alt="Logo"
                            class="logo"
                            style="
                margin: 0 auto;
                width: 90%;
                display: flex;
                justify-content: center;
                align-items: center;
              "
                    />
                    <div class="text-left mt-4">
                        <h3 class="font-telenor-regular"><b>Log In</b></h3>
                        <p>
                            <span style="color: #a7a8bb">New Here?</span>
                            <a href="#" class="font-telenor-regular" style="color: #0078cf"
                            >Create Account</a
                            >
                        </p>
                    </div>
                    <label
                            for="phone-email"
                            class="input-label mt-4 font-telenor-regular"
                            style="color: #656367; font-weight: normal"
                    >Phone Number/Email:</label
                    >
                    <input
                            type="text"
                            id="phone-email"
                            class="input-field"
                            name="username"
                            placeholder="01722439999"
                    />
                    <label
                            for="id_password"
                            class="input-label mt-2 font-telenor-regular"
                            style="color: #656367; font-weight: normal"
                    >Password:</label
                    >
                    <input
                            type="password"
                            id="id_password"
                            class="input-field"
                            placeholder="**********"
                            name="password"
                    /><i
                        class="fa fa-eye"
                        id="togglePassword"
                        style="margin-left: -30px; cursor: pointer"
                ></i>
                    <div class="forgot-password font-telenor-regular">
                        <a href="#"><b>Forgot Password?</b></a>
                    </div>
                    <div class="form-check">
                        <label class="form-check-label checkbox-label terms-checkbox">
                            <input
                                    type="checkbox"
                                    class="form-check-input"
                                    name="stay_logged_in"
                                    id="check_box_id"
                                    value="checkedValue"
                                    checked
                            />
                            <span class="mt-1 ml-2 font-telenor-regular"
                            > I agree to the Terms & Conditions</span
                            >
                        </label>
                    </div>
                    <!-- <div class="checkbox-label">
                    <input type="checkbox" id="terms-checkbox" />
                    <label for="terms-checkbox">I agree to the terms and policy</label>
                  </div> -->
                    <!-- <a href="dashboard.html" > -->
                    <button
                            class="cta d-block font-telenor-regular"
                            type="submit"
                            style="width: 100%; color: white"
                    >
                        Sign In
                        <!-- </button> -->
                    </button>
                </div>
            </form>
        </div>
        <div class="d-flex d-lg-none col-lg-6 left-div p-5">
            <div class="carousel">
                <div
                        id="carouselExampleInterval"
                        class="carousel slide"
                        data-bs-ride="carousel"
                >
                    <div class="carousel-indicators">
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="0"
                                class="active-active"
                                aria-current="true"
                                aria-label="Slide 1"
                        ></button>
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="1"
                                aria-label="Slide 2"
                        ></button>
                        <button
                                type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to="2"
                                aria-label="Slide 3"
                        ></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active" data-bs-interval="10000">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block img img-fluid"
                                    alt="text"
                            />
                        </div>
                        <div class="carousel-item" data-bs-interval="2000">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block w-100"
                                    alt="text"
                            />
                        </div>
                        <div class="carousel-item">
                            <img
                                    src="${pageContext.request.contextPath}/assets/b2b/dist/img/login_img_left.svg"
                                    class="d-block w-100"
                                    alt="text"
                            />
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-text font-telenor-regular">
                <h2>Monitor Everything</h2>
            </div>
            <div class="carousel-copy">
                <p class="font-telenor-regular">
                    Manage all your IoT devices from one single place &amp; get the
                    alarms right on time!
                </p>
            </div>
            <div class="carousel-navigation">
                <!-- Insert carousel navigation here -->
            </div>
        </div>
    </div>
</div>

<!-- /.login-box -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/jquery/jquery.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/assets/b2b/plugins/bootstrap.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/assets/b2b/dist/js/adminlte.js"></script>

<script>
    const togglePassword = document.querySelector("#togglePassword");
    const password = document.querySelector("#id_password");

    togglePassword.addEventListener("click", function (e) {
        // toggle the type attribute
        const type =
            password.getAttribute("type") === "password" ? "text" : "password";
        password.setAttribute("type", type);
        // toggle the eye slash icon
        this.classList.toggle("fa-eye-slash");
    });
</script>
</body>
</html>
