<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="entities.*" %>
<%@ page import="java.sql.*, java.util.ArrayList" %>

<%
User users=(User)request.getSession().getAttribute("users");
if(users != null){
request.setAttribute("users",users);
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Plumberz - Free Plumbing Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <style>
        .password-reset-container {
            margin: 0 auto;
            max-width: 350px;
            max-height: 580px;
            background-color: #6295d9;
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
            color: black;
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

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->

    <!-- Topbar Start -->
    <div class="container-fluid bg-light d-none d-lg-block">
        <div class="row align-items-center top-bar">
            <div class="col-lg-3 col-md-12 text-center text-lg-start">
                <a href="" class="navbar-brand m-0 p-0">
                    <h1 class="text-primary m-0" style="font-size: 30px">PARIDA	ENGINEERING</h1>
                </a>
            </div>
            <div class="col-lg-9 col-md-12 text-end">
                <div class="h-100 d-inline-flex align-items-center me-4">
                    <i class="fa fa-map-marker-alt text-primary me-2"></i>
                    <p class="m-0">210-B, Shahpur Jat, Opp. Asiad Village, New Delhi-110049</p>
                </div>
                <%
                    String DB_URL = "jdbc:mysql://localhost:3306/plumber";
                    String DB_USER = "root";
                    String DB_PASSWORD = "system";

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                        String sql = "SELECT * FROM admin"; // Fetch data by ID 1
                        PreparedStatement ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();

                        if (rs.next()) {
                %>
                <div class="h-100 d-inline-flex align-items-center me-4">
                    <i class="far fa-envelope-open text-primary me-2"></i>
                    <p class="m-0"><%= rs.getString("email")%></p>
                </div>
                <div class="h-100 d-inline-flex align-items-center">
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-1" href=""><i class="fab fa-whatsapp"></i></a>
                    <a class="btn btn-sm-square bg-white text-primary me-0" href=""><i class="fab fa-instagram"></i></a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid nav-bar bg-light">
        <nav class="navbar navbar-expand-lg navbar-light bg-white p-3 py-lg-0 px-lg-4">
            <a href="" class="navbar-brand d-flex align-items-center m-0 p-0 d-lg-none">
                <h1 class="text-primary m-0">Plumberz</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                 <div class="navbar-nav me-auto">
                    <a href="index" class="nav-item nav-link">Home</a>
                    <a href="about" class="nav-item nav-link">About</a>
                    <a href="service" class="nav-item nav-link">Services</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu fade-up m-0">
                            <a href="bookings" class="dropdown-item ">Booking</a>
                            <a href="team" class="dropdown-item">Technicians</a>
                            <a href="testimonial" class="dropdown-item ">Testimonial</a>
                            <a href="404" class="dropdown-item">404 Page</a>
                        </div>
                    </div>
                    <a href="contact" class="nav-item nav-link">Contact</a>
                    <% if(users != null){ %>
                    <a href="profile" class="nav-item nav-link active">Profile</a>
                    <a href="bookings" class="nav-item nav-link">Bookings</a>
                    <a href="userLogout" class="nav-item nav-link">Logout</a>
                    <% }else{ %>
                    <a href="login.jsp" class="nav-item nav-link">SignUp</a>
                    <% } %>
                </div>
                <div class="mt-4 mt-lg-0 me-lg-n4 py-3 px-4 bg-primary d-flex align-items-center">
                    <div class="d-flex flex-shrink-0 align-items-center justify-content-center bg-white" style="width: 45px; height: 45px;">
                        <i class="fa fa-phone-alt text-primary"></i>
                    </div>
                    <div class="ms-3">
                        <p class="mb-1 text-white">Phone</p>
                        <h5 class="m-0 text-secondary"><%= rs.getString("phone")%></h5>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 py-5">
        <div class="container">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Change Password</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb text-uppercase">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Change Password</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->

     <div class="container">
                    <div class="password-reset-container">
                        <div class="password-reset-header">
                            <h2>Change Password</h2>
                        </div>

                        <form id="changePasswordForm">
                            <div class="password-reset-group" >
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
    <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Address</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>210-B, Shahpur Jat, Opp. Asiad Village, New Delhi-110049</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i><%= rs.getString("phone")%></p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i><%= rs.getString("email")%></p>
                    <%
                                                     }
                                                 } catch (Exception e) {
                                                     e.printStackTrace();
                                                 }
                                            %>
                    <div class="d-flex pt-2">
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-whatsapp"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Opening Hours</h4>
                    <h6 class="text-light">Monday - Friday:</h6>
                    <p class="mb-4">09.00 AM - 09.00 PM</p>
                    <h6 class="text-light">Saturday - Sunday:</h6>
                    <p class="mb-0">09.00 AM - 12.00 PM</p>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Services</h4>
                    <a class="btn btn-link" href="">Drain Cleaning</a>
                    <a class="btn btn-link" href="">Sewer Line</a>
                    <a class="btn btn-link" href="">Water Heating</a>
                    <a class="btn btn-link" href="">Toilet Cleaning</a>
                    <a class="btn btn-link" href="">Broken Pipe</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-light mb-4">Newsletter</h4>
                    <p>Reach to us.</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <form id="contactForm1">
                            <div class="position-relative">
                                <input
                                    class="form-control border-0 w-100 py-3 ps-4 pe-5"
                                    type="text"
                                    name="phone"
                                    id="number9"
                                    placeholder="Your Phone"
                                >

                                <button
                                    type="button"
                                    onclick="submitPhone()"
                                    class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2"
                                >
                                    Submit
                                </button>
                            </div>

                            <!-- Updated message area with a unique id -->
                            <div id="statusMessagePhone" class="mt-2" style="font-size: 10px;"></div> <!-- Message area for success/error -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        &copy; <a class="border-bottom" href="#">PARIDA	ENGINEERING</a>, All Right Reserved.
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-0 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <script>
               $(document).ready(function () {
                   $("#messageForm").on("submit", function (e) {
                       e.preventDefault(); // Prevent the form from submitting automatically

                       var phoneInput = $("input[name='phone']");
                       // Check validity using client-side validation
                       if (!phoneInput[0].checkValidity()) {
                           alert("Phone number must be 10 digits and valid.");
                           return; // Stop the form from submitting
                       }

                       var dateValue = $("input[name='date']").val();
                       if (dateValue) {
                           var dateParts = dateValue.split("/");
                           var formattedDate = dateParts[2] + "-" + dateParts[0] + "-" + dateParts[1];
                           $("input[name='date']").val(formattedDate); // Update the date field with formatted date
                       }

                       var formData = $(this).serialize();

                       // Send form data via AJAX
                       $.ajax({
                           type: "POST",
                           url: "submitMessage", // Servlet URL
                           data: formData,
                           success: function (response) {
                               if (response.status === "success") {
                                   alert("Message sent successfully!");
                                   $("#messageForm")[0].reset(); // Reset the form
                               } else if (response.status === "error") {
                                   alert(response.message); // Display the error message
                               }
                           },
                           error: function (xhr, status, error) {
                               // Handle AJAX errors
                               var errorMessage = xhr.responseText ? xhr.responseText : "An error occurred.";
                               alert(errorMessage); // Show error message
                           }
                       });
                   });
               });
           </script>
<script>
    function submitPhone() {
        const phone = document.getElementById("number9").value.trim(); // Use trim() to remove extra spaces

        console.log(phone);

        console.log(phone.length);

        // Check for 10 digits and numbers only
        if (phone.length !== 10 || !/^\d{10}$/.test(phone)) {
            document.getElementById("statusMessagePhone").innerHTML = "<div style='color: red;'>Phone number must be 10 digits.</div>";
            setTimeout(() => document.getElementById("statusMessagePhone").innerHTML = "", 3000);
            return;
        }

        const formData1 = $("#contactForm1").serialize(); // Prepare data to send
        console.log('Phone number:', phone);

        // AJAX request to send data to the servlet
        $.ajax({
            type: "POST",
            url: "phone",  // Ensure this matches the servlet mapping
            data: formData1,
            success: function(response) {
                if (response.status === "success") {
                    $("#statusMessagePhone").html("<div style='color: green;'>Message sent successfully!</div>");
                    $("#contactForm1")[0].reset(); // Reset the form on success
                } else {
                    $("#statusMessagePhone").html("<div style='color: red;'>" + (response.message || "Error submitting message.") + "</div>");
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
    fetch("userChangePass", {
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