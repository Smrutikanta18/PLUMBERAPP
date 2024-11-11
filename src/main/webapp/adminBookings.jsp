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
  /* Container styling */
  .booking-container {
      background-color: #f8fafc;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      font-family: Arial, sans-serif;
  }

  /* Header styling */
  .booking-header {
      font-size: 2rem;
      color: #4a5568;
      font-weight: 700;
      text-align: center;
  }

  /* Table wrapper to handle scrolling */
  .booking-table-wrapper {
      max-height: 500px;
      overflow-y: auto;
      overflow-x: auto;
      border-radius: 8px;
      border: 1px solid #e2e8f0;
      margin-top: 20px;
  }

  /* Table styling */
  .booking-table {
      min-width: 1000px;
      border-collapse: collapse;
      width: 100%;
  }

  /* Header cells */
  .booking-table-header th {
      background-color: #2b6cb0;
      color: #ffffff;
      font-weight: bold;
      padding: 12px;
      text-align: center;
      font-size: 0.95rem;
      border-top: 2px solid #2c5282;
      border-bottom: 2px solid #2c5282;
      position: sticky;
      top: 0;
  }

  /* Table rows */
  .booking-table-row {
      transition: all 0.2s ease-in-out;
  }

  .booking-table-row:hover {
      background-color: #edf2f7;
  }

  .booking-table-row td {
      padding: 10px 12px;
      text-align: center;
      font-size: 0.9rem;
      color: #4a5568;
      border-bottom: 1px solid #e2e8f0;
  }

  /* Actions buttons container */
  .booking-table-actions {
      display: flex;
      justify-content: center;
      gap: 10px;
  }

  /* Button styles */
  .btn-work, .btn-delete {
      font-weight: bold;
      padding: 6px 12px;
      border-radius: 5px;
      transition: background-color 0.3s ease, color 0.3s ease;
  }

  .btn-work {
      color: #38a169;
      background-color: transparent;
      border: 1px solid #38a169;
  }

  .btn-work:hover {
      color: #fff;
      background-color: #38a169;
  }

  .btn-delete {
      color: #e53e3e;
      background-color: transparent;
      border: 1px solid #e53e3e;
  }

  .btn-delete:hover {
      color: #fff;
      background-color: #e53e3e;
  }

  /* Responsive styles */
  @media (max-width: 768px) {
      .booking-header {
          font-size: 1.5rem;
      }

      .booking-table-wrapper {
          max-height: 300px;
      }

      .booking-table-actions {
          flex-direction: column;
          gap: 5px;
      }

      .btn-work,
      .btn-delete {
          width: 100%;
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

             <div class="container booking-container mt-4">
                 <h2 class="booking-header text-center mb-4">Admin Bookings</h2>
                 <div class="table-responsive booking-table-wrapper">
                     <table class="table table-striped table-hover booking-table">
                         <thead class="booking-table-header bg-primary text-white">
                             <tr>
                                 <th>ID</th>
                                 <th>Name</th>
                                 <th>Phone</th>
                                 <th>Service</th>
                                 <th>Request</th>
                                 <th>Date</th>
                                 <th>Actions</th>
                             </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="message" items="${message}">
                                 <tr class="booking-table-row">
                                     <td>${message.id}</td>
                                     <td>${message.name}</td>
                                     <td>${message.phone}</td>
                                     <td>${message.service}</td>
                                     <td>${message.request}</td>
                                     <td>${message.date}</td>
                                     <td class="booking-table-actions">
                                             <a href="deleteBooking?id=${message.id}" class="btn btn-sm btn-outline-danger btn-delete">Delete</a>
                                     </td>
                                 </tr>
                             </c:forEach>
                         </tbody>
                     </table>
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
         function addTeam() {
             const formData = new FormData();

             const image = document.getElementById("image").files[0];
             const name = document.getElementById("name").value;
             const experience = document.getElementById("experience").value;
             const facebook = document.getElementById("facebook").value;
             const instagram = document.getElementById("instagram").value;

             formData.append("image", image);
             formData.append("name", name);
             formData.append("experience", experience);
             formData.append("facebook", facebook);
             formData.append("instagram", instagram);

             const statusMessage = document.getElementById("statusMessagePhone");

             fetch("addTechnician", {
                 method: "POST",
                 body: formData
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