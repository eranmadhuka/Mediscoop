<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
            <h2>Edit Profile</h2>
            <nav aria-label="breadcrumb">
               <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="../index.jsp">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                     Edit Profile
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
                  <form action="<%=request.getContextPath()%>/updateDoctor" method="post" class="row">
                     <!-- Basic Informations -->
                     <input type="hidden" name="id" value="${doctorData.doctorID}" />
                     <div class="border border-1 rounded shadow-sm p-4 mb-3">
                        <h5>Basic Information</h5>
                        <div class="row">
                           <div class="col-md-6 mb-3">
                              <label for="username" class="form-label"
                                 >Username</label
                                 >
                              <input
                                 type="text"
                                 class="form-control"
                                 id="username"
                                 value="${doctorData.username}"
                                 name="username"
                                 required
                                 />
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="email" class="form-label">
                              Email
                              </label>
                              <input
                                 type="email"
                                 class="form-control"
                                 id="email"
                                 value="${doctorData.email}"
                                 name="email"
                                 required
                                 />
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="firstName" class="form-label"
                                 >First Name</label
                                 >
                              <input
                                 type="text"
                                 class="form-control"
                                 id="firstName"
                                 value="${doctorData.firstName}"
                                 name="firstName"
                                 required
                                 />
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="lastName" class="form-label"
                                 >Last Name</label
                                 >
                              <input
                                 type="text"
                                 class="form-control"
                                 id="lastName"
                                 value="${doctorData.lastName}"
                                 name="lastName"
                                 required
                                 />
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="phoneNo" class="form-label"
                                 >Phone Number</label
                                 >
                              <input
                                 type="text"
                                 class="form-control"
                                 id="phoneNo"
                                 value="${doctorData.phoneNo}"
                                 name="phoneNo"
                                 required
                                 />
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="inputEmail4" class="form-label">Gender</label>
                              <select
                                 class="form-select"
                                 aria-label="Default select example"
                                 name="gender"
                                 required
                                 >
                                 <option>Select</option>
                                 <option value="Male">Male</option>
                                 <option value="Female">Female</option>
                              </select>
                           </div>
                           <div class="col-md-6 mb-3">
                              <label for="dob" class="form-label">Date of Birth</label>
                              <input
                                 type="date"
                                 class="form-control"
                                 id="dob"
                                 name="dob"
                                 value="${doctorData.dob}"
                                 required
                                 />
                           </div>
                        </div>
                     </div>
                     <!-- Biography -->
                     <div class="border border-1 rounded shadow-sm p-4 mb-3">
                        <h5>About Me</h5>
                        <div class="col-lg-12">
                           <textarea
                              class="form-control"
                              placeholder="Enter your details"
                              id="about"
                              name="about"
                              required
                              style="height: 100px"
                              >${doctorData.about}</textarea>
                        </div>
                     </div>
                     <!-- Contact Details -->
                     <div class="border border-1 rounded shadow-sm p-4 mb-3">
                        <h5>Contact Details</h5>
                        <div class="row">
                           <div class="col-md-6 mb-3">
                              <label for="address" class="form-label"
                                 >Address</label
                                 >
                              <input
                                 type="text"
                                 class="form-control"
                                 id="address"
                                 placeholder="1234 Main St"
                                 value="${doctorData.address}"
                                 name="address"
                                 required
                                 />
                           </div>
                        </div>
                     </div>
                     <!-- Services and Specialization-->
                     <div class="border border-1 rounded shadow-sm p-4 mb-3">
                        <h5>Specialization</h5>
                        <div class="col-lg-12">
                           <label for="specialization" class="mt-3"
                              >Choose Your Specialization:</label
                              >
                           <select
                              class="form-select"
                              aria-label="Default select example"
                              name="specialization"
                              required
                              >
                              <option value="cardiologist">Cardiologist</option>
                              <option value="dermatologist">Dermatologist</option>
                              <option value="pediatrician">Pediatrician</option>
                              <option value="orthopedic_surgeon"> Orthopedic Surgeon </option>
                              <option value="neurologist">Neurologist</option>
                           </select>
                        </div>
                     </div>
                     <div class="col-12">
                        <button type="submit" class="btn btn-main">Save changes</button>
                        <a href="listPatients" class="btn btn-second">Cancel</a>
                     </div>
                  </form>
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