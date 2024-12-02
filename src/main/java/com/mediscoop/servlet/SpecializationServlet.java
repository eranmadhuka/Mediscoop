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

import com.mediscoop.dao.DoctorDAO;
import com.mediscoop.dao.SpecializationDAO;
import com.mediscoop.model.Specialization;

public class SpecializationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SpecializationServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();

        try {
            switch (action) {
                case "/createSpec":
                	createSpec(request, response);
                    break;
                case "/editSpec":
                	editSpec(request, response);
                    break;
                case "/deleteSpec":
                	deleteSpec(request, response);
                    break;
                case "/listSpecs":
                	listSpec(request, response);
                    break;
                case "/showSpectEditForm":
                	showSpectEditForm(request, response);
                    break;
                default:
                	listSpec(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related errors
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
	}
	
		//Create Specialization Method
		 private void createSpec(HttpServletRequest request, HttpServletResponse response)
		            throws SQLException, IOException, ServletException {
			 String specName = request.getParameter("specName");
		     String specDecs = request.getParameter("specDecs");
		     
		     SpecializationDAO specDao = new SpecializationDAO();
		     
		     try {
		    	 specDao.addSpecialization(specName, specDecs);
		    	 response.sendRedirect("listSpecs");
		    	 
		     } catch(Exception e){
		    	 e.printStackTrace();
		     }
		 }
		 
		//Update Specialization Method
		 private void editSpec(HttpServletRequest request, HttpServletResponse response)
		            throws SQLException, IOException, ServletException {
			 try {

		            int spectId = Integer.parseInt(request.getParameter("id"));
		        	String specName = request.getParameter("specName");
		        	String specDecs = request.getParameter("specDecs");
		            
		        	Specialization spec = new Specialization(spectId, specName, specDecs);
		        	SpecializationDAO.updateSpect(spec);
		            
		            response.sendRedirect("listSpecs");
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		 }
		 
		//Delete Specialization Method
		private void deleteSpec(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, IOException, ServletException {
			int id = Integer.parseInt(request.getParameter("id"));
			SpecializationDAO.deleteSpect(id);
			response.sendRedirect("listSpecs"); 
		}
		
		private void showSpectEditForm(HttpServletRequest request, HttpServletResponse response)
	    	    throws SQLException, ServletException, IOException {
	    	    int id = Integer.parseInt(request.getParameter("id"));
	    	    Specialization existingSpect = SpecializationDAO.selectSpect(id); 
	    	    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/edit-specialization.jsp");
	    	    request.setAttribute("spect", existingSpect);
	    	    dispatcher.forward(request, response);
	    }
		
		//Retrieve Specialization Method
		private void listSpec(HttpServletRequest request, HttpServletResponse response)
				throws SQLException, IOException, ServletException {
			SpecializationDAO specializationdao = new SpecializationDAO(); 
		    List<Specialization> listSpecialization = specializationdao.selectAllSpecialization();
		    request.setAttribute("listSpecialization", listSpecialization);
		    RequestDispatcher dispatcher = request.getRequestDispatcher("admin/list-specialization.jsp");
		    dispatcher.forward(request, response);
		}


}
