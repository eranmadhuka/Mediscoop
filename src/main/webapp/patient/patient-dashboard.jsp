<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Check if the patient is not logged in --%>
<% if (session.getAttribute("patientLoggedIn") == null || !(Boolean) session.getAttribute("patientLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/login.jsp");
   %>
<% } else { %>
<%-- Patient is logged in, display the dashboard --%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Dashboard</title>
      <!-- Bootstrap v5.3 CDN Link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
      <!-- Main CSS File -->
      <link rel="stylesheet" href="../assets/css/styles.css" />
      <!-- Google Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,800;1,600&display=swap" rel="stylesheet" />
      <!-- Remix Icon CDN -->
      <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet" />
   </head>
   <body>
      <!-- Header Section -->
      <!-- Import Header file -->
      <%@ include file="../common/header.jsp" %>
      <!-- Page Banner -->
      <div class="container-fluid page-banner py-5">
         <div class="text-center">
            <h2>Dashboard</h2>
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                     Dashboard
                  </li>
               </ol>
            </nav>
         </div>
      </div>
      <!-- User Account -->
      <section class="container profile">
         <div class="row">
            <div
               class="col-lg-3 p-0 border border-1 rounded shadow-sm d-flex flex-column align-items-center"
               >
               <div class="avatar-img my-4">
                  <img
                     src="../assets/images/user.png"
                     class="avatar"
                     alt="avatar"
                     />
               </div>
               <h5>${patientData.firstName} ${patientData.lastName}</h5>
               <p class="m-0">
                  <i class="ri-calendar-2-line"></i> ${patientData.dob}
               </p>
               <p class="m-0"><i class="ri-map-pin-line"></i> ${patientData.city}, ${patientData.state}</p>
               <!-- Vertical nav -->
               <nav class="nav flex-column my-4 p-0">
                  <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/patient/patient-dashboard.jsp"
                     ><i class="ri-dashboard-line"></i> Dashboard</a
                     >
                  <a class="nav-link" href="<%=request.getContextPath()%>/listAppointments?id=${patientData.patientID}&userRole=patient">
					    <i class="ri-calendar-2-line"></i> Appointments
					</a>
                  <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet"
                     ><i class="ri-logout-box-r-line"></i>Logout</a
                     >
               </nav>
            </div>
            <div class="col-lg-9">
               <div class="row mx-auto">
                  <div
                     class="col-lg-12 border border-1 rounded shadow-sm p-4"
                     >
                     <h5>Personal Details</h5>
                     <div class="row mt-3">
                        <div class="col-lg-6">
                           <span>First Name</span>
                           <h4>${patientData.firstName}</h4>
                        </div>
                        <div class="col-lg-6">
                           <span>Last Name</span>
                           <h4>${patientData.lastName}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Username</span>
                           <h4>${patientData.username}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Gender</span>
                           <h4>${patientData.gender}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Birthday</span>
                           <h4>${patientData.dob}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Phone Number</span>
                           <h4>${patientData.phoneNo}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Address</span>
                           <h4>${patientData.address}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>City</span>
                           <h4>${patientData.city}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>ZIP code</span>
                           <h4>${patientData.zipCode}</h4>
                        </div>
                        <div class="col-lg-6 my-2">
                           <span>Registration Date</span>
                           <h4>${patientData.reg_date}</h4>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- Footer Section -->
      <!-- Import Footer file -->
      <%@ include file="../common/footer.jsp" %>
   </body>
</html>
<% } %>