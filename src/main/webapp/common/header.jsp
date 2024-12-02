<!-- Top Navbar -->
<div class="top-nav bg-light">
   <nav class="navbar container">
      <div class="container-fluid">
         <div class="d-flex align-items-center">
            <a
               href="mailto: abc@example.com"
               class="d-flex justify-content-center align-items-center me-3"
               ><i class="ri-mail-line"></i> mediscoop@contact.com</a
               >
            <a
               href="tel: 123456789"
               class="d-flex justify-content-center align-items-center"
               ><i class="ri-phone-fill"></i> +9643112564</a
               >
         </div>
         <!-- Social Links -->
         <div class="social-icon align-items-center justify-content-center">
            <a href="#"><i class="me-1 fs-6 ri-facebook-fill"></i></a>
            <a href="#"><i class="me-1 fs-6 ri-instagram-fill"></i></a>
            <a href="#"><i class="me-1 fs-6 ri-youtube-fill"></i></a>
            <a href="#"><i class="me-1 fs-6 ri-linkedin-fill"></i></a>
            <a href="#"><i class="me-1 fs-6 ri-twitter-fill"></i></a>
         </div>
      </div>
   </nav>
</div>
<!-- Main Navbar -->
<div class="container-fluid main-nav">
   <nav class="navbar navbar-expand-lg container">
      <div class="container-fluid">
         <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">
         <img
            src="<%=request.getContextPath()%>/assets/images/logo.png"
            alt="logo"
            class="main-nav-logo"
            />
         </a>
         <a href="index.html" class="btn btn-main d-lg-none ms-auto"
            ><i class="bx bx-lock-alt"></i> Login</a
            >
         <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
         <i class="bx bx-menu"></i>
         </button>
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
               <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/index.jsp">Home</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">Services</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">About Us</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="#">Contact Us</a>
               </li>
            </ul>
            <%-- Check if the user is logged in --%>
            <% if (session.getAttribute("username") != null) { %>
            <div class="d-flex align-items-center">
               <button type="button" class="btn border-0 me-3">
               <i class="ri-notification-3-fill text-dark"></i>
               <span class="badge text-bg-danger">4</span>
               </button>
               <div class="dropdown">
                  <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="<%=request.getContextPath()%>/assets/images/user.png" alt="avatar" class="rounded-circle p-0" style="width: 40px; height: 40px; object-fit: cover" />
                  <span class="text-white ps-2"><%= session.getAttribute("username") %></span>
                  </a>
               </div>
            </div>
            <% } else { %>
            <div>
               <a href="<%=request.getContextPath()%>/login.jsp" class="btn btn-main">
               <i class="bx bx-lock-alt"></i> Login
               </a>
               <a href="<%=request.getContextPath()%>/register.jsp" class="btn btn-second">
               <i class="bx bx-user"></i> Register
               </a>
            </div>
            <% } %>
         </div>
      </div>
   </nav>
</div>