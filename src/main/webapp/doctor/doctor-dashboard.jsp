<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Check if the doctor is not logged in --%>
<% if (session.getAttribute("doctorLoggedIn") == null || !(Boolean) session.getAttribute("doctorLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/doctor/doctor-login.jsp");
   %>
<% } else { %>
<%-- Doctor is logged in, display the doctor-dashboard --%>
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
      <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css" />
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
                  <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
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
            <div class="col-lg-3 p-0 border border-1 rounded shadow-sm d-flex flex-column align-items-center" >
               <div class="avatar-img my-4">
                  <img
                     src="<%=request.getContextPath()%>/assets/images/user.png"
                     class="avatar"
                     alt="avatar"
                     />
               </div>
               <h5>Dr. Darren Elder</h5>
               <p class="m-0">BDS, MDS - Oral & Maxillofacial Surgery</p>
               <!-- Vertical nav -->
               <nav class="nav flex-column my-4 p-0">
                  <a
                     class="nav-link"
                     aria-current="page"
                     href="<%=request.getContextPath()%>/listAppointments?userRole=doctor"
                     ><i class="ri-dashboard-line"></i> Dashboard</a
                     >
                  <a class="nav-link" href="<%=request.getContextPath()%>/doctor/doctor-profile-settings.jsp"
                     ><i class="ri-user-settings-line"></i>Profile Setting</a
                     >
                  <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet"
                     ><i class="ri-logout-box-r-line"></i>Logout</a
                     >
               </nav>
            </div>
            <div class="col-lg-9">
               <div class="row mx-auto">
                  <div class="col-lg-12 border rounded border-1 shadow-sm p-4">
                     <h5>Appointments</h5>
                     <table class="table table-striped table-hover">
                        <thead>
                           <tr>
                              <th scope="col">App ID</th>
                              <th scope="col">Patient ID</th>
                              <th scope="col">Patient Email</th>
                              <th scope="col">Doctor Name</th>
                              <th scope="col">Diseases</th>
                              <th scope="col">Appointment Date</th>
                              <th scope="col">Message</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="app" items="${listAppointments}">
                              <tr>
                                 <td>
                                    <c:out value="${app.appID}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.patientID}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.patientEmail}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.doctorName}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.diseases}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.appDate}" />
                                 </td>
                                 <td>
                                    <c:out value="${app.message}" />
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
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