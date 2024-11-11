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
    .password-reset-container {
        margin: 0 auto;
        max-width: 350px;
        max-height: 580px;
        background-color: black;
        padding: 30px;
        border-radius: 15px;
        transition: all 0.3s ease-in-out;
    }

    .password-reset-header h2 {
        font-size: 2.2rem;
        font-weight: 600;
        color: white;
        margin-bottom: 20px;
        letter-spacing: 1px;
        text-transform: uppercase;
        position: relative;
    }

    .password-reset-header h2::after {
        content: "";
        display: block;
        width: 60px;
        height: 3px;
        background-color: red;
        margin: 10px auto 0;
    }

    /* Button Styles */
    .password-reset-btn {
        background-color: red;
        border: none;
        font-size: 1.1rem;
        padding: 10px 30px;
        border-radius: 25px;
        transition: all 0.3s ease;
        display: inline-block;
    }

    .password-reset-btn:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    /* Form Styles */
    .password-reset-group label {
        font-size: 1rem;
        color: grey;
        font-weight: 500;
        margin-bottom: 5px;
    }

    .password-reset-control {
        border-radius: 8px;
        padding: 10px 15px;
        font-size: 1rem;
        border: 1px solid #ddd;
        transition: border 0.3s ease, box-shadow 0.3s ease;
    }

    .password-reset-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
    }

    .password-reset-actions {
        margin-top: 20px;
    }

    /* Alert Styles */
    .alert {
        font-size: 0.95rem;
        border-radius: 8px;
        margin-bottom: 20px;
    }

    /* Error Message Styles */
    .password-reset-error-message {
        color: #d9534f;
        display: none;
        font-size: 0.875rem;
        margin-top: 10px;
    }

    /* Mobile Styles */
    @media (max-width: 576px) {
        .password-reset-container {
            padding: 20px;
        }

        .password-reset-header h2 {
            font-size: 1.8rem;
        }

        .password-reset-btn {
            font-size: 1rem;
            padding: 8px 25px;
        }

        .password-reset-back-btn a {
            font-size: 1rem;
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

            <div class="container">
                <div class="password-reset-container">
                    <div class="password-reset-header">
                        <h2>Change Password</h2>
                    </div>
                    <form id="changePasswordForm">
                        <div class="password-reset-group">
                            <label for="userEmail">Your Email</label>
                            <input type="email" class="password-reset-control" id="userEmail" name="email" required>
                        </div>
                        <div class="password-reset-group">
                            <label for="currentPassword">Current Password</label>
                            <input type="password" class="password-reset-control" id="currentPassword" name="password" required>
                        </div>
                        <div class="password-reset-group">
                            <label for="newPassword">New Password</label>
                            <input type="password" class="password-reset-control" id="newPassword" name="newPassword" required>
                        </div>
                        <div class="password-reset-group">
                            <label for="confirmNewPassword">Confirm New Password</label>
                            <input type="password" class="password-reset-control" id="confirmNewPassword" name="confirmNewPassword" required>
                            <div id="errorMessage" class="password-reset-error-message" style="display: none; color: red;">Passwords do not match!</div>
                            <div id="statusMessagePhone" class="mt-2" style="font-size: 10px;"></div>
                        </div>
                        <div class="password-reset-actions text-center">
                            <button type="button" onclick="editPassword()" class="password-reset-btn">Change</button>
                        </div>
                    </form>
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
function editPassword() {
    const email = document.getElementById("userEmail").value;
    const currentPassword = document.getElementById("currentPassword").value;
    const newPassword = document.getElementById("newPassword").value;
    const confirmNewPassword = document.getElementById("confirmNewPassword").value;
    const errorMessage = document.getElementById("errorMessage");
    const statusMessage = document.getElementById("statusMessagePhone");

    // Validate that the new passwords match
    if (newPassword !== confirmNewPassword) {
        errorMessage.style.display = "block";
        return;
    } else {
        errorMessage.style.display = "none";
    }

    // Create an object to store form data
    const formData = new URLSearchParams();
    formData.append("email", email);
    formData.append("password", currentPassword);
    formData.append("newPassword", newPassword);

    // Send the AJAX request
    fetch("adminChangePass", {
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

        // Show the message and then hide it after 3 seconds
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