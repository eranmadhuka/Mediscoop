package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mediscoop.model.Admin;

public class AdminDAO {
	private Connection connection;

    public AdminDAO() {
        connection = DatabaseConnector.getConnection();
    }

    // Close the database connection
    public void closeConnection() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // Validate user credentials
    public Admin isValidUser(String username, String password) throws SQLException {
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            
            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    int adminID = resultSet.getInt("admin_id");
                    String uname = resultSet.getString("username");
                    String pass = resultSet.getString("password");
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    String tel = resultSet.getString("contact_number");
                    String address = resultSet.getString("address");
                    
                    Admin admin = new Admin(adminID, uname, pass, firstName, lastName, email, tel, address);
                    
                    return admin;
                }
            }
        }
        
        // Return null if no matching admin found
        return null;
    }
    
    
    public boolean updateAdminPassword(int id, String currentPass, String newPass) {
    	
    	System.out.println(id+currentPass + newPass+ currentPass);
    	
        // Example SQL update statement (please adapt it to your schema):
        String sql = "UPDATE admin SET password = ? WHERE admin_id = ? AND password = ?";
       
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, newPass);
            pstmt.setInt(2, id);
            pstmt.setString(3, currentPass);
            
            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0; // Return true if the password was updated
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return false; // Return false if there was an error or the password didn't match
    }


    // Check if a username is already taken
    public boolean isUsernameTaken(String username) throws SQLException {
        String query = "SELECT * FROM admin WHERE username = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            try (ResultSet resultSet = pstmt.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    // Create a new admin
    public void createUser(String username, String email, String password) throws SQLException {
        String query = "INSERT INTO admin (username, email, password) VALUES (?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            pstmt.executeUpdate();
        }
    }

}
