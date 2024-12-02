package com.mediscoop.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.mediscoop.dao.DoctorDAO;
import com.mediscoop.dao.PatientDAO;
import com.mediscoop.model.Doctor;
import com.mediscoop.model.Patient;

public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoctorServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		
		try {
			
			switch(action) {
			case "/doctorRegister":
				doctorRegister(request, response);
				break;
			case "/addDoctor":
				addDoctor(request, response);
				break;
			case "/listDoctors":
				listDoctors(request, response);
                break;
			case "/showDoctorEditForm":
				showDoctorEditForm(request, response);
                break;
			case "/updateDoctor":
				updateDoctor(request, response);
                break;
			case "/doctorLogin":
				doctorLogin(request, response);
				break;
			case "/delteDoctor":
				delteDoctor(request, response);
                break;
			default:
				listDoctors(request, response);
				break;
			}			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	private void doctorRegister(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		System.out.println(username+" "+email+" "+password);
		
		DoctorDAO doctorDAO = new DoctorDAO();
		
		try {
			
			// Check if the provided credentials are valid
			if (doctorDAO.isUsernameTaken(username))  {
				response.sendRedirect("doctor/doctor-register.jsp?error=Username+already+exists");
            } else {
            	// Create a new user
            	doctorDAO.createDoctor(username,password, email );
            	response.sendRedirect("doctor/doctor-login.jsp");
            }
			
		}catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Registration+failed");
        }
		
	}
	
	private void addDoctor(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String tel = request.getParameter("phoneNo");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String about = request.getParameter("about");
        String specialization = request.getParameter("specialization");
        
        DoctorDAO doctorDAO = new  DoctorDAO();

        try {
            // Check if the provided credentials are valid
            if (doctorDAO.isUsernameTaken(username)) {
                response.sendRedirect(request.getContextPath()+"/admin/add-doctor.jsp?error=Username+already+exists");
            } else {
                // Create a new user
            	doctorDAO.addDoctor(username, password, firstName,lastName, email,tel,gender,dob,about,address,specialization );
                response.sendRedirect("listDoctors");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle registration-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
	
	private void showDoctorEditForm(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, ServletException, IOException {
    	    int id = Integer.parseInt(request.getParameter("id"));
    	    Doctor existingDoctor = DoctorDAO.selectDoctor(id); 
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit-doctor.jsp");
    	    request.setAttribute("doctor", existingDoctor);
    	    dispatcher.forward(request, response);
    }
		
	private void doctorLogin(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException {

	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    DoctorDAO doctorDAO = new DoctorDAO();

	    try {

	        if (doctorDAO.isValidUser(username, password) != null) {
	            // Successful login
	            HttpSession session = request.getSession();
	            session.setAttribute("doctorLoggedIn", true);
	            session.setAttribute("username", username);
	            
	            Doctor doctor = doctorDAO.isValidUser(username, password);
	            session.setAttribute("doctorData", doctor);

	            response.sendRedirect(request.getContextPath() + "/listAppointments?userRole=doctor");
	        } else {
	            // Invalid login
	            response.sendRedirect(request.getContextPath() + "/doctor/doctor-login.jsp?error=Invalid+username+or+password");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        // Handle login-related errors
	        response.sendRedirect(request.getContextPath() + "/error.jsp");
	    }
	}
	
	private void updateDoctor(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        try {

            int doctorId = Integer.parseInt(request.getParameter("id"));
        	String uname = request.getParameter("username");
        	String pass = request.getParameter("password");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String tel = request.getParameter("phoneNo");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String aboutMe = request.getParameter("about");
            String address = request.getParameter("address");
            String specialization = request.getParameter("specialization");
            
            String adminUsername = request.getParameter("adminUsername");

            Doctor doctor = new Doctor(doctorId,  uname,  pass,  firstName,  lastName,  email,
            		tel,  gender,  dob,  aboutMe,  address,  specialization);
            DoctorDAO.updateDoctor(doctor);
            
            if ("admin".equals(adminUsername)) {
                response.sendRedirect("listDoctors"); // Redirect to the admin dashboard
            } else {
                response.sendRedirect("doctor/doctor-profile-settings.jsp"); // Redirect to the doctor dashboard
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	    private void listDoctors(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	    DoctorDAO doctorDAO = new DoctorDAO(); // Create an instance of PatientDAO
	    List<Doctor> listDoctors = doctorDAO.selectAllDoctorss();
	    request.setAttribute("listDoctors", listDoctors);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list-doctors.jsp");
	    dispatcher.forward(request, response);
	}
	    
	    private void delteDoctor(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			DoctorDAO.deleteDoctor(id);
			response.sendRedirect("listDoctors");

		}
	


}
