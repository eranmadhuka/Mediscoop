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

import com.mediscoop.dao.AppointmentDAO;
import com.mediscoop.dao.PatientDAO;
import com.mediscoop.model.Appointment;
import com.mediscoop.model.Patient;

public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AppointmentServlet() {
        super();   
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/createAppointment":
                	createAppointment(request, response);
                    break;
                case "/editAppointment":
                	editAppointment(request, response);
                    break;
                case "/showEditAppointmentForm":
                	showEditAppointmentForm(request, response);
                    break;
                case "/deleteAppointment":
                	deleteAppointment(request, response);
                    break;
                case "/listAppointments":
                	listAppointments(request, response);
                    break;
                default:
                	listAppointments(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
	}
	
	//Create Appointment Method
	 private void createAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {
		 int patientId = Integer.parseInt(request.getParameter("patientId"));
	     String email = request.getParameter("email");
	     String doctorName = request.getParameter("doctorName");
	     String date = request.getParameter("date");
	     String diseases = request.getParameter("diseases");
	     String message = request.getParameter("message");
	     	     
	     AppointmentDAO appointmentDAO = new AppointmentDAO();
	     
	     try {
	    	 	appointmentDAO.createAppintment(patientId, email,doctorName, date,diseases,message);
	    	 	response.sendRedirect(request.getContextPath() + "/listAppointments?userRole=patient&id=" + patientId);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Handle registration-related errors
	            response.sendRedirect(request.getContextPath() + "/error.jsp");
	        }
	 }
	 
	//Update Appointment Method
	 private void editAppointment(HttpServletRequest request, HttpServletResponse response)
	            throws SQLException, IOException, ServletException {

		 	int appID = Integer.parseInt(request.getParameter("appID"));
	        int pID = Integer.parseInt(request.getParameter("pID"));
	        String patientEmail = request.getParameter("email");
	        String updatedDoctorName = request.getParameter("doctorName");
	        String updatedDiseases = request.getParameter("diseases");
	        String updatedAppDate = request.getParameter("appDate");
	        String updatedMessage = request.getParameter("message");

	        System.out.println(appID+updatedDoctorName+updatedDiseases+updatedAppDate+updatedMessage);
	        
	        AppointmentDAO appointmentDAO = new AppointmentDAO();
	        boolean success = appointmentDAO.updateAppointment(appID, patientEmail,updatedDoctorName, updatedDiseases, updatedAppDate, updatedMessage);

	        if (success) {
	        	response.sendRedirect(request.getContextPath() + "/listAppointments?userRole=patient&id=" + pID);
	        } else {
	            response.sendRedirect(request.getContextPath()+"/Error.jsp"); 
	        }
	 }
	 
	//Delete deleteAppointment Method
	private void deleteAppointment(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int appId = Integer.parseInt(request.getParameter("appId"));
		int id = Integer.parseInt(request.getParameter("id"));
		AppointmentDAO.deleteAppointment(appId);
		response.sendRedirect("listAppointments?userRole=patient&id="+id);
	}
	
	private void showEditAppointmentForm(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, ServletException, IOException {
    	    int id = Integer.parseInt(request.getParameter("id"));
    	    Appointment existingPatient = AppointmentDAO.selectAppointment(id); 
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("patient/appointment-edit.jsp");
    	    request.setAttribute("app", existingPatient);
    	    dispatcher.forward(request, response);
    }
	
	//Retrieve Appointment 
	private void listAppointments(HttpServletRequest request, HttpServletResponse response)
	        throws SQLException, IOException, ServletException {
	    
	    AppointmentDAO appointmentAll = new AppointmentDAO(); 
	    AppointmentDAO appointmentByPatient = new AppointmentDAO();
	    
	    List<Appointment> listAppointments = appointmentAll.selectAllAppointments();
	    request.setAttribute("listAppointments", listAppointments);
	    
	    String userRole = request.getParameter("userRole");
	    
	    int patientID = 0; 
	    
	    String idParameter = request.getParameter("id");

	    if (userRole.equals("admin")) {
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list-appointments.jsp");
            dispatcher.forward(request, response);
            
        } else if (userRole.equals("doctor")) {
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("doctor/doctor-dashboard.jsp");
            dispatcher.forward(request, response);
            
        } else if (userRole.equals("patient")) {
        	
        	if (idParameter != null) {
    	        patientID = Integer.parseInt(idParameter);
    	        
    	        List<Appointment> listAppointmentsById = appointmentByPatient.selectPatientAppointments(patientID);
                request.setAttribute("patientAppointmentList", listAppointmentsById);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("patient/appointments.jsp");
                dispatcher.forward(request, response);
    	    } 
            
            
        }
	}




}
