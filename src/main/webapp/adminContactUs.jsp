<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>DarkPan - Bootstrap 5 Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    <style>
    /* Styling for the scrollable container */
    .custom-container {
        max-height: 400px;          /* Maximum height for scrollable area */
        width: 970px;           /* Increased width of the container */
        overflow-y: auto;           /* Enables vertical scrolling */
        padding-right: 15px;        /* Adds space for the scrollbar */
        background-color: dark;  /* Light background for contrast */
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }

    /* Custom styling for the scrollbar */
    .custom-container::-webkit-scrollbar {
        width: 2px;
    }

    .custom-container::-webkit-scrollbar-thumb {
        background-color: #888;
        border-radius: 4px;
    }

    .custom-container::-webkit-scrollbar-thumb:hover {
        background-color: #555;
    }

    /* Inner elements styling */
    .custom-header h6 {
        font-size: 16px;
        font-weight: bold;
    }

    .custom-message {
        border-bottom: 1px solid #ddd;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .custom-img {
        width: 40px;
        height: 40px;
        border: 2px solid #ddd;
    }

    .custom-details h6 {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }

    .custom-subject {
        font-weight: bold;
        color: gray;
    }

    .custom-message-text {
        color: #555;
        font-size: 14px;
    }

    /* Responsive styling */
    @media (max-width: 768px) {
        .custom-container {
            max-width: 100%;       /* Full width on smaller screens */
            padding: 15px;         /* Reduced padding for smaller screens */
        }
        .custom-img {
            width: 35px;
            height: 35px;
        }
        .custom-details h6 {
            font-size: 15px;
        }
        .custom-message {
            padding-top: 8px;
            padding-bottom: 8px;
        }
        .custom-message-text {
            font-size: 13px;
        }
    }

    @media (max-width: 480px) {
        .custom-container {
            padding: 10px;          /* Further reduced padding on very small screens */
        }
        .custom-img {
            width: 30px;
            height: 30px;
        }
        .custom-details h6 {
            font-size: 14px;
        }
        .custom-subject,
        .custom-message-text {
            font-size: 12px;
        }
    }
    </style>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib1/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib1/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css1/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css1/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-fluid position-relative d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="adminIndex" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary">Plumberz</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img1/<%= session.getAttribute("image") %>" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0"><%= session.getAttribute("firstname") %> <%= session.getAttribute("lastname") %></h6>
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="adminIndex" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-user"></i>  Profile</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="adminProfile.jsp" class="dropdown-item">Profile</a>
                            <a href="adminChangePass.jsp" class="dropdown-item">Change Password</a>
                        </div>
                    </div>
                    <a href="showAllContactUs" class="nav-item nav-link"><i class="fa fa-phone me-2"></i>Messages</a>
                    <a href="adminBookings" class="nav-item nav-link">Bookings</a>
                    <a href="bannerImages" class="nav-item nav-link">Banner</a>
                    <a href="adminTeam" class="nav-item nav-link">team</a>
                    <a href="work" class="nav-item nav-link">work</a>
                    <a href="data" class="nav-item nav-link">Data</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Login</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="adminLogin.jsp" class="dropdown-item">Sign In</a>
                            <a href="admin_logout" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-secondary navbar-dark sticky-top px-4 py-0">
                <a href="adminIndex" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-user-edit"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="img1/<%= session.getAttribute("image") %>" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex"><%= session.getAttribute("firstname") %> <%= session.getAttribute("lastname") %></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-secondary border-0 rounded-0 rounded-bottom m-0">
                            <a href="adminProfile.jsp" class="dropdown-item">My Profile</a>
                            <a href="admin_logout" class="dropdown-item">Log Out</a>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->

            <!-- Widgets Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12 col-md-6 col-xl-4">
                        <div class="custom-container rounded p-4">
                            <div class="custom-header d-flex align-items-center justify-content-between mb-2">
                                <h6 class="mb-0">Messages</h6>
                            </div>
                            <c:forEach var="contact" items="${contactUses}">
                                <div class="custom-message d-flex align-items-center border-bottom py-3">
                                    <img class="custom-img rounded-circle flex-shrink-0" src="img1/userProfile.png" alt="" style="width: 40px; height: 40px;">
                                    <div class="custom-content w-100 ms-3">
                                        <div class="custom-details d-flex w-100 justify-content-between">
                                            <h6 class="mb-0" style="color:white">${contact.name}</h6>
                                            <small><fmt:formatDate value="${contact.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></small>
                                        </div>
                                        <span class="custom-subject" style="color: red">(${contact.phone})</span>
                                        <br>
                                        <span class="custom-subject">${contact.subject}</span>
                                        <br>
                                        <span class="custom-message-text">${contact.message}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-secondary rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Plumberz</a>, All Right Reserved.
                        </div>
                        <div class="col-12 col-sm-6 text-center text-sm-end">
                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a> Smrutikanta Parida</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib1/chart/chart.min.js"></script>
    <script src="lib1/easing/easing.min.js"></script>
    <script src="lib1/waypoints/waypoints.min.js"></script>
    <script src="lib1/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib1/tempusdominus/js/moment.min.js"></script>
    <script src="lib1/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib1/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js1/main.js"></script>
</body>

</html>