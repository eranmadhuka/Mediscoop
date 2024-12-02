package com.mediscoop.servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.mediscoop.dao.PatientDAO;
import com.mediscoop.model.Patient;

public class PatientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public PatientServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();

        try {
            switch (action) {
                case "/patientRegister":
                    patientRegister(request, response);
                    break;
                case "/addPatient":
                	addPatient(request, response);
                    break;
                case "/patientLogin":
                    patientLogin(request, response);
                    break;
                case "/listPatients":
                	listPatients(request, response);
                    break;
                case "/showPatientEditForm":
                	showPatientEditForm(request, response);
                    break;
                case "/updatePatient":
                	updatePatient(request, response);
                    break;
                case "/deltePatient":
                	deletePatient(request, response);
                    break;
                default:
                	listPatients(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void patientRegister(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PatientDAO patientDAO = new PatientDAO();

        try {
            // Check if the provided credentials are valid
            if (patientDAO.isUsernameTaken(username)) {
                response.sendRedirect("register.jsp?error=Username+already+exists");
            } else {
                // Create a new user
                patientDAO.createPatient(username, email, password);
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle registration-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    private void addPatient(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String tel = request.getParameter("tel");
        String dob = request.getParameter("dob");
        String bloodGroup = request.getParameter("bloodGroup");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipCode = request.getParameter("zipCode");

        PatientDAO patientDAO = new PatientDAO();

        try {
            // Check if the provided credentials are valid
            if (patientDAO.isUsernameTaken(username)) {
                response.sendRedirect(request.getContextPath()+"/admin/add-patient.jsp?error=Username+already+exists");
            } else {
                // Create a new user
                patientDAO.addPatient(username, password, firstName,lastName, email,tel,gender,dob,bloodGroup,address,city,state,zipCode );
                response.sendRedirect("listPatients");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle registration-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    private void patientLogin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PatientDAO patientDAO = new PatientDAO();

        try {
            // Check if the provided credentials are valid
            if (patientDAO.isValidUser(username, password) != null) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("patientLoggedIn", true);
                session.setAttribute("username", username);
                
                // Retrieve all data for the user and set it as an attribute
                Patient patient = patientDAO.isValidUser(username, password);
                session.setAttribute("patientData", patient);
                
                response.sendRedirect(request.getContextPath() + "/patient/patient-dashboard.jsp");
            } else {
                // Invalid login
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid+username+or+password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle login-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }

    
    private void showPatientEditForm(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, ServletException, IOException {
    	    int id = Integer.parseInt(request.getParameter("id"));
    	    Patient existingPatient = PatientDAO.selectPatient(id); 
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit-patient.jsp");
    	    request.setAttribute("patient", existingPatient);
    	    dispatcher.forward(request, response);
    }

    
    private void updatePatient(HttpServletRequest request, HttpServletResponse response) 
            throws SQLException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String gender = request.getParameter("gender");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String tel = request.getParameter("tel");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String bloodGroup = request.getParameter("bloodGroup");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String zipCode = request.getParameter("zipCode");
            
            Patient patient = new Patient(id, firstName, lastName, email, tel, gender, dob, bloodGroup, address, city, state, zipCode);
            PatientDAO.updatePatient(patient);
            
            response.sendRedirect("listPatients");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
	    private void listPatients(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
	    	
	    PatientDAO patientDAO = new PatientDAO(); // Create an instance of PatientDAO
	    List<Patient> listPatient = patientDAO.selectAllPatients();
	    request.setAttribute("listPatient", listPatient);
	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list-patients.jsp");
	    dispatcher.forward(request, response);
	}
	    
	    private void deletePatient(HttpServletRequest request, HttpServletResponse response) 
				throws SQLException, IOException {
			int id = Integer.parseInt(request.getParameter("id"));
			PatientDAO.deletePatient(id);
			response.sendRedirect("listPatients");

		}
	    

}
