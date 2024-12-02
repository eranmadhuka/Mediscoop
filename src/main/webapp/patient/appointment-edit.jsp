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
            <div class="col-lg-9 p-3 border border-1 rounded shadow-sm bg-white">
               <h2>Edit Appointment</h2>
               <form action="editAppointment" method="post">
				    <input type="hidden" id="editAppID" name="appID" value="${app.appID}">
				    <input type="hidden" id="patientID" name="pID" value="${app.patientID}">
				    <div class="mb-3">
				        <label for="email" class="form-label">Email Address</label>
				        <input type="email" class="form-control" id="email" name="email" value="${app.patientEmail}" required>
				    </div>
				    <div class="mb-3">
				        <label for="date" class="form-label">Select your Doctor</label>
				        <select class="form-select" id="editDoctorName" name="doctorName" required>
				            <option>Select</option>
				            <option value="Doc1">Doc1</option>
				            <option value="Doc2">Doc2</option>
				        </select>
				    </div>
				    <div class="mb-3">
				        <label for="editDiseases" class="form-label">Diseases</label>
				        <input type="text" class="form-control" id="editDiseases" name="diseases" value="${app.diseases}" required>
				    </div>
				    <div class="mb-3">
				        <label for="editAppDate" class="form-label">Appointment Date</label>
				        <input type="date" class="form-control" id="editAppDate" name="appDate" value="${app.appDate}" required>
				    </div>
				    <div class="mb-3">
				        <label for="editMessage" class="form-label">Message</label>
				        <textarea class="form-control" id="editMessage" name="message" rows="4">${app.message}</textarea>
				    </div>
				    <button type="submit" class="btn btn-main">Save Changes</button>
				</form>
            </div>
         </div>
      </section>
      <!-- Footer Section -->
      <!-- Import Footer file -->
      <%@ include file="../common/footer.jsp" %>
   </body>
</html>
<% } %>