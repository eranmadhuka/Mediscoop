<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- Check if the admin is not logged in --%>
<% if (session.getAttribute("adminLoggedIn") == null || !(Boolean) session.getAttribute("adminLoggedIn")) { %>
<%-- Redirect to the login page --%>
<%
   response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
   %>
<% } else { %>
<%-- Patient is logged in, display the dashboard --%>   
<% String page_title = "Dashboard"; %>
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
                     <li class="breadcrumb-item">
                        <a href="admin-dashboard.jsp">Dashboard</a>
                     </li>
                     <li class="breadcrumb-item active" aria-current="page">
                        Patients
                     </li>
                  </ol>
               </nav>
               <!-- Appoinments Table -->
               <div class="row mt-3 mx-auto">
                  <div class="col-lg-12 border rounded border-1 shadow-sm p-4 bg-white">
                     <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5>List of Patient</h5>
                        <a href="<%=request.getContextPath()%>/admin/add-patient.jsp" class="btn btn-second">Add Patient</a>
                     </div>
                     <table class="table table-striped table-hover">
                        <thead>
                           <tr>
                              <th scope="col">Patient ID</th>
                              <th scope="col">Patient Name</th>
                              <th scope="col">DOB</th>
                              <th scope="col">Address</th>
                              <th scope="col">Phone</th>
                              <th scope="col">Email</th>
                              <th scope="col">Reg_date</th>
                              <th scope="col">Action</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:forEach var="patient" items="${listPatient}">
                              <tr>
                                 <td>
                                    <c:out value="${patient.patientID}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.firstName} ${patient.lastName}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.dob}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.address}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.phoneNo}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.email}" />
                                 </td>
                                 <td>
                                    <c:out value="${patient.reg_date}" />
                                 </td>
                                 <td>
                                    <a href="<%=request.getContextPath()%>/showPatientEditForm?id=${patient.patientID}" type="button" class="p-1 rounded bg-primary text-white" >
                                    <i class="ri-pencil-line"></i>
                                    </a>
                                    <a href="<%=request.getContextPath()%>/deltePatient?id=${patient.patientID}" class="p-1 rounded bg-danger text-white" >
                                    <i class="ri-delete-bin-line"></i>
                                    </a>
                                 </td>
                              </tr>
                           </c:forEach>
                        </tbody>
                     </table>
                  </div>
               </div>
            </main>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" ></script>
   </body>
</html>
<% } %>