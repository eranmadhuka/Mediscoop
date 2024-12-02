<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%-- Check if the patient is not logged in --%>
<% if (session.getAttribute("adminLoggedIn") == null || !(Boolean) session.getAttribute("adminLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
   %>
<% } else { %>
<%-- Patient is logged in, display the dashboard --%>   
<% String page_title = "Dashboard"; %>
<%@ page import="com.mediscoop.dao.PatientDAO" %>
<%@ page import="com.mediscoop.dao.DoctorDAO" %>
<%@ page import="com.mediscoop.dao.AppointmentDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title><% out.print(page_title); %></title>
      <!-- Bootstrap v5.3 CDN Link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
      <!-- Main CSS File -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />
      <!-- Google Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,400;0,500;0,800;1,600&display=swap" rel="stylesheet" />
      <!-- Remix Icon CDN -->
      <link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet" />
   </head>
   <body class="bg-light">
      <div class="row dashboard">
         <aside class="col-lg-2 border-end border-end-5 fixed-left bg-white p-0">
            <!-- Import Sidebar-menu -->
            <%@ include file="common/admin-sidebar-menu.jsp" %>
         </aside>
         <div class="col-lg-10 ms-auto">
            <!-- Header -->
            <!-- Import header -->
            <%@ include file="common/header.jsp" %>
            <!-- Main Section -->
            <main class="main px-3 mt-5">
               <!-- Breadcrumb -->
               <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                     <li class="breadcrumb-item active">
                        <a href="dashboard.html">Dashboard</a>
                     </li>
                  </ol>
               </nav>
               <!-- Overview Card -->
               <div class="row overviewcard z-0 px-3">
                  <!-- Patients count card -->
                  <div class="card col-lg-3 mx-2 p-3 bg-primary bg-gradient text-white">
                     <div class="row g-0">
                        <div class="col-lg-3 d-flex align-items-center justify-content-center" >
                           <i class="ri-user-line fs-1"></i>
                        </div>
                        <div class="col-md-9">
                           <div class="card-body">
                              <h5 class="card-title">Total Patient</h5>
                              <%
                                 PatientDAO patientDAO = new PatientDAO();
                                 int totalPatients = patientDAO.getTotalPatients();
                                 %>
                              <h1 class="text-white"><%= totalPatients %></h1>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- Doctors count card -->
                  <div class="card col-lg-3 mx-2 p-3 bg-primary bg-gradient text-white">
                     <div class="row g-0">
                        <div class="col-lg-3 d-flex align-items-center justify-content-center" >
                           <i class="ri-hospital-line fs-1"></i>
                        </div>
                        <div class="col-md-9">
                           <div class="card-body">
                              <h5 class="card-title">Total Doctors</h5>
                              	<%
                                 DoctorDAO doctorDAO = new DoctorDAO();
                                 int totalDoctors = doctorDAO.getTotalDoctors();
                                 %>
                              <h1 class="text-white"><%= totalDoctors %></h1>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- Appointments count card -->
                  <div class="card col-lg-3 mx-2 p-3 bg-primary bg-gradient text-white">
                     <div class="row g-0">
                        <div class="col-lg-3 d-flex align-items-center justify-content-center" >
                           <i class="ri-calendar-2-line fs-1"></i>
                        </div>
                        <div class="col-md-9">
                           <div class="card-body">
                              <h5 class="card-title">Total Appointments</h5>
                              <%
                                 AppointmentDAO appointmentdao = new AppointmentDAO();
                                  	int totalAppointments = appointmentdao.getTotalAppointments();
                                  %>
                              <h1 class="text-white"><%= totalAppointments %></h1>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </main>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" ></script>
   </body>
</html>
<% } %>