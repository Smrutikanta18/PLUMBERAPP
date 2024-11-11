<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page import="entities.*" %>
<%@ page import="java.util.List" %>

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
   /* Technician Card Styling */
   .technician-card {
       border-radius: 10px;
       box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
       overflow: hidden;
       transition: transform 0.3s ease, box-shadow 0.3s ease;
       background-color: #fff;
       height: 100%;
       display: flex;
       flex-direction: column;
       justify-content: space-between;
   }

   .technician-card:hover {
       transform: translateY(-10px);
       box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
   }

   /* Image Container for Uniform Size */
   .tech-image-container {
       overflow: hidden;
       position: relative;
       height: 200px; /* Fixed height for desktop */
       width: 100%;
   }

   .tech-image {
       width: 100%;
       height: 100%;
       object-fit: cover;
       transition: transform 0.4s ease-in-out;
   }

   .technician-card:hover .tech-image {
       transform: scale(1.1);
   }

   /* Technician Info */
   .tech-info {
       padding: 20px;
       flex: 1;
   }

   .tech-info-bg-light {
       background-color: #f4f4f4;
       padding: 15px;
       text-align: center;
       border-radius: 8px;
   }

   .tech-info-bg-light h5 {
       font-size: 18px;
       color: #333;
   }

   .tech-info-bg-light small {
       font-size: 14px;
       color: #777;
   }

   /* Social Icons Container */
   .tech-info-bg-primary {
       display: flex;
       justify-content: center;
       padding-top: 10px;
   }

   .tech-social {
       width: 40px;
       height: 40px;
       background-color: #007bff;
       color: #fff;
       border-radius: 50%;
       display: flex;
       justify-content: center;
       align-items: center;
       font-size: 16px;
       margin: 0 10px;
       transition: background-color 0.3s ease;
   }

   .tech-social:hover {
       background-color: #0056b3;
   }

   .tech-social i {
       font-size: 18px;
   }

   /* Custom Styling for Add Technician Button */
   .add-technician-btn {
       margin-top: 10px;
       padding: 12px 30px;
       font-size: 16px;
       font-weight: 600;
       text-transform: uppercase;
       letter-spacing: 1px;
       border-radius: 50px;
       background-color: #007bff;
       color: #fff;
       transition: all 0.3s ease;
       box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
       display: inline-flex;
       justify-content: center;
       align-items: center;
   }

   /* Hover and Focus Effects for Add Technician Button */
   .add-technician-btn:hover {
       background-color: #0056b3;
       color: #fff;
       transform: translateY(-2px);
       box-shadow: 0 6px 18px rgba(0, 123, 255, 0.3);
   }

   .add-technician-btn:focus {
       outline: none;
       box-shadow: 0 0 10px rgba(0, 123, 255, 0.5);
   }

   .add-technician-btn i {
       margin-right: 8px;
       font-size: 18px;
   }

   /* Mobile Responsiveness */
   @media (max-width: 768px) {
       /* Adjust heading font size */
       .text-center h1 {
           font-size: 28px;
       }

       /* Reduce height of technician cards on mobile */
       .tech-image-container {
           height: 180px; /* Smaller height for mobile */
       }

       /* Adjust font size in technician info */
       .tech-info-bg-light h5 {
           font-size: 16px;
       }

       .tech-info-bg-light small {
           font-size: 12px;
       }

       /* Stack the columns vertically on smaller screens */
       .col-lg-3, .col-md-6 {
           flex: 0 0 100%; /* Make each card full width */
           max-width: 100%;
           margin-bottom: 20px;
       }

       /* Smaller button size on mobile */
       .add-technician-btn {
           font-size: 14px;
           padding: 10px 20px;
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

            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h1 class="mb-5">Our Expert Technicians</h1>
                    </div>
                    <div class="row g-4">
                        <c:forEach var="technician" items="${technicians}">
                            <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="technician-card">
                                    <div class="tech-image-container">
                                        <img class="img-fluid tech-image" src="img/${technician.image}" alt="${technician.name}">
                                    </div>
                                    <div class="tech-info">
                                        <div class="tech-info-bg-light">
                                            <h5 class="fw-bold mb-0">${technician.name}</h5>
                                            <small>${technician.experience} years of experience</small>
                                        </div>
                                        <div class="tech-info-bg-primary">
                                            <a class="btn tech-social mx-1" href="${technician.faceBook}" target="_blank">
                                                <i class="fab fa-facebook-f"></i>
                                            </a>
                                            <a class="btn tech-social mx-1" href="${technician.instagram}" target="_blank">
                                                <i class="fab fa-instagram"></i>
                                            </a>
                                            <!-- <a class="btn tech-social mx-1" href="deleteTeam?id=${technician.id}&image=${technician.image}" target="_blank">
                                                 <i class="far fa-edit"></i>
                                            </a> -->
                                            <a class="btn tech-social mx-1" href="deleteTeam?id=${technician.id}&image=${technician.image}" target="_blank">
                                                 <i class="far fa-trash-alt"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                     <div class="col-md-6 d-flex justify-content-end align-items-center">
                         <a href="addTechnician.jsp" class="btn btn-primary add-technician-btn">
                             <i class="fas fa-plus"></i> Add Technician
                         </a>
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