<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                        Edit Doctor
                     </li>
                  </ol>
               </nav>
               <!-- Appoinments Table -->
               <div class="row mt-3 mx-auto">
                  <div class="col-lg-12 border rounded border-1 shadow-sm p-4 bg-white">
                     <div class="d-flex justify-content-between align-items-center mb-3">
                        <h5>Edit Doctor</h5>
                     </div>
                     <form action="<%=request.getContextPath()%>/updateDoctor" method="post" class="row">
                        <input type="hidden" name="id" value="${doctor.doctorID}" />
                        <input type="hidden" name="adminUsername" value="<%= session.getAttribute("username") %>" />
                        <!-- Basic Informations -->
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
                                    name="username"
                                    value="${doctor.username}"
                                    required
                                    />
                              </div>
                              <div class="col-md-6 mb-3">
                                 <label for="password" class="form-label">
                                 Password
                                 </label>
                                 <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    name="password"
                                    value="${doctor.password}"
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
                                    name="email"
                                    value="${doctor.email}"
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
                                    name="firstName"
                                    value="${doctor.firstName}"
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
                                    name="lastName"
                                    value="${doctor.lastName}"
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
                                    name="phoneNo"
                                    value="${doctor.phoneNo}"
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
                                    value="${doctor.dob}"
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
                                 style="height: 100px"
                                 required
                                 >${doctor.about}</textarea>
                           </div>
                        </div>
                        <!-- Contact Details -->
                        <div class="border border-1 rounded shadow-sm p-4 mb-3">
                           <h5>Contact Details</h5>
                           <div class="row">
                              <div class="col-md-6 mb-3">
                                 <label for="address" class="form-label"
                                    >address</label
                                    >
                                 <input
                                    type="text"
                                    class="form-control"
                                    id="address"
                                    placeholder="1234 Main St"
                                    name="address"
                                    value="${doctor.doctorID}"
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
                           <button type="submit" class="btn btn-main">Save Changes</button>
                        </div>
                     </form>
                  </div>
               </div>
            </main>
         </div>
      </div>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous" ></script>
   </body>
</html>
<% } %>