<img src="<%=request.getContextPath()%>/assets/images/logo2.png" alt="logo" class="img-fluid p-3" />
<ul class="list-group list-group-flush mt-2">
    <li class="list-group-item list-group-item-action p-3">
        <a class="nav-link" aria-current="page" href="<%=request.getContextPath()%>/admin/admin-dashboard.jsp"><i class="ri-dashboard-line"></i> Dashboard</a
            >
          </li>
          <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/listAppointments?userRole=admin"
              ><i class="ri-calendar-2-line"></i> Appointments</a
            >
          </li>
          <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/listPatients"
              ><i class="ri-user-line"></i> Patients</a
            >
          </li>
          <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/listDoctors"
              ><i class="ri-hospital-line"></i> Doctors</a 
            >
             <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/listSpecs"
              ><i class="ri-service-line"></i> Specialization</a
            >
          </li>
          </li>
          <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/admin/change-password.jsp"
              ><i class="ri-git-repository-private-line"></i> Change Password</a
            >
          </li>
          <li class="list-group-item list-group-item-action p-3">
            <a class="nav-link" href="<%=request.getContextPath()%>/LogoutServlet"
              ><i class="ri-logout-box-r-line"></i> Logout</a
            >
          </li>
        </ul>