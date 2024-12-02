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
      <!-- Login Section -->
      <div class="container-fluid login d-flex align-items-center justify-content-center" >
         <div class="row">
            <div class="col-lg-12">
               <div class="register-box p-5">
                  <div class="d-flex d-flex align-items-center justify-content-between">
                     <h2>Doctor Register</h2>
                     <a href="<%=request.getContextPath()%>/register.jsp">Not a Doctor?</a>
                  </div>
                  <p>Register by entering the information below</p>
                  <form action="<%= request.getContextPath() %>/doctorRegister" method="post" class="mt-5 needs-validation" novalidate>
                     <div class="row">
                        <div class="col-lg-12 col-sm-12">
                           <div class="form-floating mb-3">
                              <input
                                 type="text"
                                 class="form-control"
                                 id="validationCustom01"
                                 name="username"
                                 placeholder="Username"
                                 required
                                 />
                              <label for="validationCustom01">Username</label>
                              <div class="invalid-feedback">Please Enter username.</div>
                           </div>
                        </div>
                     </div>
                     <div class="form-floating mb-3">
                        <input
                           type="email"
                           class="form-control"
                           id="floatingInput"
                           name="email"
                           placeholder="Email"
                           required
                           />
                        <label for="floatingInput">Email address</label>
                        <div class="invalid-feedback">
                           Please Enter valid Email address.
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6 col-sm-12 mb-3">
                           <div class="form-floating">
                              <input
                                 type="password"
                                 class="form-control"
                                 id="floatingPassword"
                                 name="password"
                                 placeholder="Password"
                                 required
                                 />
                              <label for="floatingPassword">Create Password</label>
                              <div class="invalid-feedback">Create strong password</div>
                           </div>
                        </div>
                        <div class="col-lg-6 col-sm-12">
                           <div class="form-floating">
                              <input
                                 type="password"
                                 class="form-control"
                                 id="reEnterPass"
                                 placeholder="Password"
                                 required
                                 />
                              <label for="reEnterPass">Confirm Password</label>
                              <div class="invalid-feedback">Confirm your password</div>
                           </div>
                        </div>
                     </div>
                     <div class="col-12 my-4">
                        <div class="form-check">
                           <input
                              class="form-check-input"
                              type="checkbox"
                              value=""
                              id="invalidCheck"
                              required
                              />
                           <label class="form-check-label" for="invalidCheck">
                           Yes, I understand and agree
                           <a href="#">Terms & Conditions.</a>
                           </label>
                           <div class="invalid-feedback">
                              You must agree before submitting.
                           </div>
                        </div>
                     </div>
                     <button type="submit" class="btn btn-main mb-3">Register</button>
                     <!-- Register buttons -->
                     <div class="text-center">
                        <p>Alredy have account <a href="<%=request.getContextPath()%>/login.jsp">Login</a></p>
                     </div>
                  </form>
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