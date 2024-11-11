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
    /* Container styling */
    .edit-profile-container {
        display: flex;
        flex-direction:column;
        justify-content: center;
        width: 970px;
        margin-left: 20px;
        margin-top: 20px;
        padding: 20px;
        background-color: black;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        text-align: center;
    }

    .edit-profile-container h2 {
        margin-bottom: 20px;
        color: white;
    }

    /* Form styling */
    .edit-profile-form {
        display: flex;
        flex-direction: column;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 15px;
        text-align: left;
    }

    .form-group label {
        font-weight: bold;
        margin-left:250px;
        color: #555;
        margin-bottom: 5px;
        display: inline-block;
    }

    .form-group input[type="text"],
    .form-group input[type="email"],
    .form-group input[type="tel"],
    .form-group input[type="file"] {
        width: 50%;
        padding: 10px;
        margin-left:250px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        color: #333;
    }

    .form-group input[type="file"] {
        padding: 5px;
    }

    .form-group input::placeholder {
        color: #aaa;
    }

    /* Current image styling */
    .current-image {
        margin-top: 10px;
        text-align: center;
    }

    .current-image img {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        object-fit: cover;
        border: 2px solid #ddd;
    }

    /* Submit button styling */
    .submit-button {
        width: 30%;
        margin-left: 325px;
        padding: 10px;
        background-color: red;
        color: #ffffff;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .submit-button:hover {
        background-color: red;
    }

    /* Responsive adjustments */
    @media (max-width: 576px) {
        .edit-profile-container {
            width: 90%;
            padding: 15px;
            text-align: left;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"]
        .form-group input[type="file"] {
            width: 30%;
            font-size: 14px;
            margin-left:0px;
        }
        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group input[type="file"] {
                width: 250px;
                margin-left:0px;
                font-size: 14px;
        }

        .form-group label {
                margin-left:0px;
        }

        .current-image {
            text-align: center;
        }

        .submit-button {
            font-size: 14px;
            margin-left: 60px;
            width: 50%;
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

            <div class="edit-profile-container">
                    <h2>Edit Your Profile</h2>
                    <form id="contactForm1" action="AdminProfileEditServlet" method="post" enctype="multipart/form-data" class="edit-profile-form">
                        <input type="hidden" id="adminId" name="adminid" value="${id}">
                        <div class="form-group">
                            <label for="firstName">First Name</label>
                            <input type="text" id="firstName" name="firstname" placeholder="${firstname}" value="${firstname}">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastname" placeholder="${lastname}" value="${lastname}">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="${email}" value="${email}">
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="${phone}" value="${phone}">
                        </div>
                        <div class="form-group">
                            <label for="image">Profile Image</label>
                            <input type="file" id="image" name="image" value="${image}">
                            <!-- Show current image if it exists -->
                            <div class="current-image">
                                <img src="img1/${image}" alt="Current Profile Image">
                            </div>
                        </div>
                        <button type="button" onclick="editProfile()" class="submit-button">Save Changes</button>
                        <div id="statusMessagePhone" class="mt-2" style="font-size: 10px;"></div>
                    </form>
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
      function editProfile() {
          const formElement = document.getElementById("contactForm1");
          const formData = new FormData(formElement);

          $.ajax({
              type: "POST",
              url: "updateProfile",
              data: formData,
              contentType: false, // Prevent jQuery from overriding the content type
              processData: false, // Prevent jQuery from processing the data
              success: function(response) {
                  if (response.success) {
                      $("#statusMessagePhone").html("<div style='color: green;'>Update successfully!</div>");
                      $("#contactForm1")[0].reset(); // Reset the form on success
                  } else {
                      $("#statusMessagePhone").html("<div style='color: red;'>Error updating profile.</div>");
                  }
                  clearMessageAfterTimeoutPhone();
              },
              error: function(xhr, status, error) {
                  console.error("AJAX error:", status, error); // Debugging: Log AJAX error
                  $("#statusMessagePhone").html("<div style='color: red;'>An error occurred.</div>");
                  clearMessageAfterTimeoutPhone();
              }
          });
      }

        function clearMessageAfterTimeoutPhone() {
            setTimeout(function() {
                $("#statusMessagePhone").html(""); // Clears the status message
            }, 3000);
        }
    </script>
</body>

</html>