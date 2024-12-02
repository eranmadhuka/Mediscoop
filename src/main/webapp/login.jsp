<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8" />
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Redister | Mediscoop</title>
      <!-- Bootstrap v5.3 CDN Link -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
      <!-- Main CSS File -->
      <link rel="stylesheet" href="assets/css/styles.css" />
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
      <%@ include file="common/header.jsp" %>
      <!-- Alert -->
      <!-- Login Section -->
      <div class="container-fluid login d-flex align-items-center justify-content-center" >
         <div class="row">
            <div class="col-lg-12">
               <div class="login-box p-5">
                  <h2>Patient Login</h2>
                  <form action="patientLogin" method="post" class="mt-3 needs-validation" novalidate>
                     <div class="form-floating mb-3">
                        <input
                           type="text"
                           class="form-control"
                           id="validationCustom01"
                           name="username"
                           placeholder="Username"
                           required
                           />
                        <label for="validationCustom01">Usernamee</label>
                        <div class="invalid-feedback">Please Enter username.</div>
                     </div>
                     <div class="form-floating mb-3">
                        <input
                           type="password"
                           class="form-control"
                           id="validationCustom02"
                           name="password"
                           placeholder="Password"
                           required
                           />
                        <label for="validationCustom02">Password</label>
                        <div class="invalid-feedback">Please Enter password.</div>
                     </div>
                     <button type="submit" class="btn btn-main mb-3">Login</button>
                  </form>
                  <!-- Register buttons -->
                  <div class="text-center">
                     <p>Not a member? <a href="<%=request.getContextPath()%>/register.jsp">Register</a></p>
                     <hr />
                     <a href="<%=request.getContextPath()%>/doctor/doctor-login.jsp">Doctor Login</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script
         src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
         integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
         crossorigin="anonymous"
         ></script>
      <script src="assets/js/main.js"></script>
      <script>
         (() => {
           "use strict";
           // Fetch all the forms we want to apply custom Bootstrap validation styles to
           const forms = document.querySelectorAll(".needs-validation");
           // Loop over them and prevent submission
           Array.from(forms).forEach((form) => {
             form.addEventListener(
               "submit",
               (event) => {
                 if (!form.checkValidity()) {
                   event.preventDefault();
                   event.stopPropagation();
                 }
                 form.classList.add("was-validated");
               },
               false
             );
           });
         })();
      </script>
   </body>
</html>