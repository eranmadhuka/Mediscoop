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
                        Change Password
                     </li>
                  </ol>
               </nav>
               <!-- Patients Table -->
               <div class="row mx-auto">
                  <div class="col-lg-12 p-4 bg-white">
                     <form action="<%=request.getContextPath()%>/updateAdminPassword" method="post" class="row">
                        <input type="hidden" name="id" value="${adminData.adminID}" />
                        <div class="col-md-7 mb-3">
                           <label for="CurrentPass" class="form-label">Current Password</label>
                           <input type="password" class="form-control" id="CurrentPass" name="CurrentPass" />
                        </div>
                        <div class="col-md-7 mb-3">
                           <label for="NewPass" class="form-label">New Password</label>
                           <input type="password" class="form-control" id="NewPass" name="NewPass" />
                        </div>
                        <div class="col-md-7 mb-3">
                           <label for="ConPass" class="form-label">Confirm Password</label>
                           <input type="password" class="form-control" id="ConPass" name="ConPass"  />
                        </div>
                        <div class="col-12">
                           <button type="submit" class="btn btn-main">Save changes</button>
                           <button type="reset" class="btn btn-second">Cancel</button>
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