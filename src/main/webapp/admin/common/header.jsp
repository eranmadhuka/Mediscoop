<header class="header bg-white d-flex align-items-center justify-content-between border-bottom border-bottom-1 shadow  px-4 pt-2">
    <div class="p-0 m-0">
        <h3>Hello, <%= session.getAttribute("username") %></h3>
        <%
		        // Java code to get the current date
		        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		        java.util.Date date = new java.util.Date();
		        String currentDate = sdf.format(date);
		    %>
            <p class="mb-1">Today is
                <%= currentDate %>
            </p>
    </div>

    <div class="d-flex align-items-center">
        <button type="button" class="btn border-0 me-3">
            <i class="ri-notification-3-fill text-dark"></i>
            <span class="badge text-bg-danger">4</span>
        </button>
        <div class="dropdown">
            <a class="dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img
                  src="<%=request.getContextPath()%>/assets/images/user.png"
                  alt="avatar"
                  class="rounded-circle p-0"
                  style="width: 40px; height: 40px; object-fit: cover"
                />
              </a>

            <ul class="dropdown-menu">
                <li>
                    <a class="dropdown-item" href="<%=request.getContextPath()%>/admin/admin-dashboard.jsp">
                        <i class="ri-user-line"></i> Dashboard</a>
                </li>
                <li>
                    <a class="dropdown-item" href="profile-setting.html"><i class="ri-settings-2-line"></i> Profile Setting</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="change-password.html"
                    ><i class="ri-lock-line"></i> Change Password</a
                  >
                </li>
                <li>
                  <a class="dropdown-item" href="<%=request.getContextPath()%>/LogoutServlet"
                    ><i class="ri-login-box-line"></i> Logout</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </header>