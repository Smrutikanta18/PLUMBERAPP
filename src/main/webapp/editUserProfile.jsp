<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="entities.User" %>
<%@ page import="java.sql.*, java.util.ArrayList" %>


<%
    User users = (User) request.getSession().getAttribute("users");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Plumberz - Free Plumbing Website Template</title>
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
            margin-left: 150px;
            margin-top: 50px;
            margin-bottom: 50px;
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
                    User user = (User) request.getSession().getAttribute("users");
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
                    <a href="service" class="nav-item nav-link ">Services</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                        <div class="dropdown-menu fade-up m-0">
                            <a href="booking" class="dropdown-item">Booking</a>
                            <a href="team" class="dropdown-item">Technicians</a>
                            <a href="testimonial" class="dropdown-item">Testimonial</a>
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

                <div class="edit-profile-container">
                    <h2>Edit Your Profile</h2>
                    <form id="contactForm1"  class="edit-profile-form">
                        <input type="hidden" id="adminId" name="userid" value="<%= user.getId()%>">
                        <div class="form-group">
                            <label for="firstName">User Name</label>
                            <input type="text" id="firstName" name="firstname" placeholder="<%= user.getUserName()%>"  value ="<%= user.getUserName()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="<%= user.getEmail()%>" value ="<%= user.getEmail()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone Number</label>
                            <input type="tel" id="phone" name="phone" placeholder="<%= user.getPhone()%>" value ="<%= user.getPhone()%>" required>
                        </div>
                        <button type="button" onclick="editProfile()" class="submit-button">Save Changes</button>
                        <div id="statusMessagePhone1" class="mt-2" style="font-size: 10px;"></div>
                    </form>
                </div>

    <!-- Page Header Start -->
    <div class="container-fluid page-header mb-5 py-5">
        <div class="container">
            <h1 class="display-3 text-white mb-3 animated slideInDown">Edit Profile</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb text-uppercase">
                    <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                    <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                    <li class="breadcrumb-item text-white active" aria-current="page">Edit Profile</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->



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
      function editProfile() {
          const formElement = document.getElementById("contactForm1");
          const formData = new FormData(formElement);

          $.ajax({
              type: "POST",
              url: "userEditProfile",
              data: formData,
              contentType: false, // Prevent jQuery from overriding the content type
              processData: false, // Prevent jQuery from processing the data
              success: function(response) {
                  if (response.success) {
                      $("#statusMessagePhone1").html("<div style='color: green;'>Update successfully!</div>");
                      $("#contactForm1")[0].reset(); // Reset the form on success
                  } else {
                      $("#statusMessagePhone1").html("<div style='color: red;'>Error updating profile.</div>");
                  }
                  clearMessageAfterTimeoutPhone();
              },
              error: function(xhr, status, error) {
                  console.error("AJAX error:", status, error); // Debugging: Log AJAX error
                  $("#statusMessagePhone1").html("<div style='color: red;'>An error occurred.</div>");
                  clearMessageAfterTimeoutPhone();
              }
          });
      }

        function clearMessageAfterTimeoutPhone() {
            setTimeout(function() {
                $("#statusMessagePhone1").html(""); // Clears the status message
            }, 3000);
        }
    </script>
</body>

</html>