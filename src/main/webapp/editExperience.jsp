<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.sql.*, java.util.ArrayList" %>

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
    /* Custom styles for a beautiful, mobile-responsive form */
    .data-container {
        margin-top: 50px;
    }

    .data-header {
        font-size: 2rem;
        color: white;
    }

    .data-row {
        display: flex;
        justify-content: center;
        padding: 20px;
    }

    .data-column {
        flex: 1 1 100%;
        max-width: 600px;
    }

    .data-card {
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        background-color: #fff;
    }

    .data-card-body {
        padding: 20px;
    }

    .data-form-group img {
        max-width: 100px;
        max-height: 100px;
        border-radius: 8px;
    }

    .data-form-group {
        margin-bottom: 15px;
    }

    .data-form-control, .data-form-control-file {
        width: 100%;
        padding: 10px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }

    .data-alert {
        padding: 15px;
        margin-bottom: 20px;
        border-radius: 4px;
    }

    .data-alert-success {
        background-color: #d4edda;
        color: #155724;
    }

    .data-alert-danger {
        background-color: #f8d7da;
        color: #721c24;
    }

    .data-btn {
        margin-top: 15px;
        width: 100%;
        padding: 10px;
        font-size: 1rem;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .data-btn-success {
        background-color: red;
        color: #fff;
    }

    .data-btn-close {
        background: transparent;
        border: none;
        font-size: 1.2rem;
        cursor: pointer;
        color: #000;
    }

    /* Responsive adjustments */
    @media (max-width: 576px) {
        .data-form-group {
            margin-bottom: 20px;
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

            <div class="data-container">
                <h1 class="data-header text-center mb-4">Experience Data</h1>

                <div class="data-row">
                    <div class="data-column">
                        <div class="data-card p-4">
                            <div class="data-card-body">

                                <!-- Fetching and displaying data -->
                                <%
                                    String DB_URL = "jdbc:mysql://localhost:3306/plumber";
                                    String DB_USER = "root";
                                    String DB_PASSWORD = "system";

                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                                        String sql = "SELECT * FROM data WHERE id = 1"; // Fetch data by ID 1
                                        PreparedStatement ps = con.prepareStatement(sql);
                                        ResultSet rs = ps.executeQuery();

                                        if (rs.next()) {
                                %>

                                <!-- Display experience data -->
                                <form action="updateExperienceData" method="post">
                                <input type="hidden" class="data-form-control" name="id" value="<%= rs.getInt("id") %>">

                                <div class="data-form-group">
                                    <label>Experience (in years) :</label>
                                    <input type="number" class="data-form-control" id="experience" name="experience" value="<%= rs.getString("experience") %>" required>
                                </div>
                                <div class="data-form-group">
                                    <label>Technicians :</label>
                                    <input type="number" class="data-form-control" id="technicians" name="customers" value="<%= rs.getString("technicians") %>" required>
                                </div>
                                <div class="data-form-group">
                                    <label>Clients :</label>
                                    <input type="number" class="data-form-control" id="clients" name="menus" value="<%= rs.getString("clients") %>" required>
                                </div>
                                <div class="data-form-group">
                                    <label>Projects :</label>
                                    <input type="number" class="data-form-control" id="projects" name="staffs" value="<%= rs.getString("projects") %>" required>
                                </div>
                                <div id="statusMessagePhone" class="mt-2" style="font-size: 10px;"></div>

                                <button type="button" onclick="addExperience()" class="data-btn data-btn-success">Update Data</button>
                                </form>

                                <%
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                            </div>
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
      <script>
          function addExperience() {
              // Retrieve values from form inputs
              const experience = document.getElementById("experience").value;
              const technicians = document.getElementById("technicians").value;
              const clients = document.getElementById("clients").value;
              const projects = document.getElementById("projects").value;

              // Create an object to store form data
              const formData = new URLSearchParams();
              formData.append("experience", experience);
              formData.append("technicians", technicians);
              formData.append("clients", clients);
              formData.append("projects", projects);

              // Reference to the status message element
              const statusMessage = document.getElementById("statusMessagePhone");

              // Send the AJAX request
              fetch("updateExperienceData", {
                  method: "POST",
                  headers: {
                      "Content-Type": "application/x-www-form-urlencoded"
                  },
                  body: formData.toString()
              })
              .then(response => response.json())
              .then(data => {
                  if (data.success) {
                      statusMessage.textContent = data.message;
                      statusMessage.style.color = "green";
                  } else {
                      statusMessage.textContent = data.message;
                      statusMessage.style.color = "red";
                  }

                  statusMessage.style.display = "block";
                  setTimeout(() => {
                      statusMessage.style.display = "none";
                  }, 3000);
              })
              .catch(error => {
                  console.error("Error:", error);
                  statusMessage.textContent = "An error occurred. Please try again.";
                  statusMessage.style.color = "red";
                  statusMessage.style.display = "block";
                  setTimeout(() => {
                      statusMessage.style.display = "none";
                  }, 3000);
              });
          }
      </script>

</body>

</html>