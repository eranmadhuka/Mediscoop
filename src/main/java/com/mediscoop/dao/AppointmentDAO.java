package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mediscoop.model.Appointment;

public class AppointmentDAO {
    private Connection connection;

    public AppointmentDAO() {
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

    // Select all Appointmens
    public List < Appointment > selectAllAppointments() {
        List < Appointment > appointments = new ArrayList < > ();
        try {

            String sql = "SELECT *  FROM appointments";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int appID = rs.getInt("app_id");
                int patientID = rs.getInt("patient_id");
                String patientEmail = rs.getString("patient_email");
                String doctorName = rs.getString("doctor_name");
                String diseases = rs.getString("diseases");
                String appDate = rs.getString("app_date");
                String message = rs.getString("message");

                appointments.add(new Appointment(appID, patientID, patientEmail, doctorName, diseases, appDate, message));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    // Select Patient Appointments
    public List < Appointment > selectPatientAppointments(int pID) {
        List < Appointment > appointments = new ArrayList < > ();
        try {

            String sql = "SELECT * FROM appointments WHERE patient_id = ?";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, pID);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int appID = rs.getInt("app_id");
                int patientID = rs.getInt("patient_id");
                String patientEmail = rs.getString("patient_email");
                String doctorName = rs.getString("doctor_name");
                String diseases = rs.getString("diseases");
                String appDate = rs.getString("app_date");
                String message = rs.getString("message");

                appointments.add(new Appointment(appID, patientID, patientEmail, doctorName, diseases, appDate, message));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointments;
    }

    // Create new appointment by Patient
    public void createAppintment(int patientId, String email, String doctorName, String date, String diseases, String message) throws SQLException {

        String query = "INSERT INTO appointments (patient_id, patient_email, doctor_name, diseases, message,app_date) VALUES (?, ?, ?, ?, ?, ?)";

        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setInt(1, patientId);
        pstmt.setString(2, email);
        pstmt.setString(3, doctorName);
        pstmt.setString(4, diseases);
        pstmt.setString(5, message);
        pstmt.setString(6, date);

        pstmt.executeUpdate();
    }

    //Select patient by id
    public static Appointment selectAppointment(int id) {
        Appointment appointment = null;

        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM appointments WHERE app_id = ?")) {

            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);

            // Step 3: Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int patientID = rs.getInt("patient_id");
                String patientEmail = rs.getString("patient_email");
                String doctor_name = rs.getString("doctor_name");
                String diseases = rs.getString("diseases");
                String app_date = rs.getString("app_date");
                String message = rs.getString("message");

                // Create a new appointment object
                appointment = new Appointment(id, patientID, patientEmail, doctor_name, diseases, app_date, message);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointment;
    }

    public boolean updateAppointment(int appID, String patientEmail, String updatedDoctorName, String updatedDiseases, String updatedAppDate, String updatedMessage) throws SQLException {
        String updateQuery = "UPDATE appointments SET patient_email=?, doctor_name = ?, diseases = ?, app_date = ?, message = ? WHERE app_id = ?";

        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
            preparedStatement.setString(1, patientEmail);
            preparedStatement.setString(2, updatedDoctorName);
            preparedStatement.setString(3, updatedDiseases);
            preparedStatement.setString(4, updatedAppDate);
            preparedStatement.setString(5, updatedMessage);
            preparedStatement.setInt(6, appID);


            int rowsUpdated = preparedStatement.executeUpdate();

            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete Appointment
    public static boolean deleteAppointment(int id) throws SQLException {
        boolean rowDeleted;

        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement pstmt = connection.prepareStatement("DELETE FROM appointments WHERE app_id = ?");) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    //Calculate Total Appointments 
    public int getTotalAppointments() {
        int totalRows = 0;

        try {
            String sql = "SELECT COUNT(*) AS total_appointments FROM appointments";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                totalRows = resultSet.getInt("total_appointments");
            }
            resultSet.close();
            pstmt.close();
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalRows;
    }
}