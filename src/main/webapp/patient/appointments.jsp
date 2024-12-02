<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <h2>Appointments</h2>
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item active" aria-current="page">
                     Appointments
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
                     src="<%= request.getContextPath() %>/assets/images/user.png"
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
            <div class="col-lg-9 border rounded border-1 shadow-sm p-4">
               <div class="d-flex align-items-center justify-content-between mb-3">
                  <h5>Appointments</h5>
					<a id="addAppointmentButton" type="button" class="btn btn-main" data-bs-toggle="modal" data-bs-target="#exampleModal">Add Appointment</a>
               </div>
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
                     <c:forEach var="app" items="${patientAppointmentList}">
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
                           <td>
                              <a href="<%=request.getContextPath()%>/showEditAppointmentForm?id=${app.appID}" class="p-1 rounded bg-primary text-white" >
                              	<i class="ri-pencil-line"></i>
                              </a>
                              <a href="<%=request.getContextPath()%>/deleteAppointment?appId=${app.appID}&id=${app.patientID}" class="p-1 rounded bg-danger text-white">
								 <i class="ri-delete-bin-line"></i>
							  </a>
                           </td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      </section>
      <!-- Modal for add App -->
      <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">Add Appointment</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
               </div>
               <div class="modal-body">
                  <form action="<%= request.getContextPath() %>/createAppointment" method="post">
				    <input type="hidden" class="form-control" name="patientId" value="${patientData.patientID}">
				    
				    <div class="mb-3">
				        <label for="email" class="form-label">Email Address</label>
				        <input type="email" class="form-control" id="email" name="email" required>
				    </div>
					
					<div class="mb-3">
					    <label for="date" class="form-label">Select your Doctor</label>
					    <select class="form-select" name="doctorName" required>
					        <option value="" disabled selected>Select</option>
					            <option value="doc1">doc1</option>
					            <option value="doc2">doc2</option>
					            <option value="doc3">doc3</option>
					            <option value="doc4">doc4</option>
					            <option value="doc5">doc5</option>
					    </select>
					</div>

				    <div class="mb-3">
				        <label for="date" class="form-label">Appointment Date</label>
				        <input type="date" class="form-control" id="date" name="date" required>
				    </div>
				
				    <div class="mb-3">
				        <label for="diseases" class="form-label">Diseases</label>
				        <input type="text" class="form-control" id="diseases" name="diseases" required>
				    </div>
				
				    <div class="mb-3">
				        <label for="message" class="form-label">Additional Message</label>
				        <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
				    </div>
				
				    <button type="submit" class="btn btn-main">Submit</button>
				</form>
               </div>
            </div>
         </div>
      </div>
      <!-- Footer Section -->
      <!-- Import Footer file -->
      <%@ include file="../common/footer.jsp" %>
  
   </body>
</html>
<% } %>