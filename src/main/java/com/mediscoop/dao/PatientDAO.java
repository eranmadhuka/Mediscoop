package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mediscoop.model.Patient;

public class PatientDAO {
    private Connection connection;

    public PatientDAO() {
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

    //Create new patient
    public void createPatient(String uname, String email, String pass) throws SQLException {
        String query = "INSERT INTO patient (username, email, PASSWORD, reg_date) VALUES (?, ?, ?, NOW())";
        PreparedStatement pstmt = connection.prepareStatement(query);

        pstmt.setString(1, uname);
        pstmt.setString(2, email);
        pstmt.setString(3, pass);
        pstmt.executeUpdate();

    }

    // Add new patient By admin
    public void addPatient(String username, String password, String firstName, String lastName, String email,
        String phoneNo, String gender, String dob, String bloodGroup, String address, String city, String state,
        String zipCode) throws SQLException {
        String query = "INSERT INTO patient (username, password, first_name, last_name, email, phone_number, gender, date_of_birth, blood_group, address, city, state, zip_code, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";

        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, firstName);
        pstmt.setString(4, lastName);
        pstmt.setString(5, email);
        pstmt.setString(6, phoneNo);
        pstmt.setString(7, gender);
        pstmt.setString(8, dob);
        pstmt.setString(9, bloodGroup);
        pstmt.setString(10, address);
        pstmt.setString(11, city);
        pstmt.setString(12, state);
        pstmt.setString(13, zipCode);

        pstmt.executeUpdate();
    }


    //Check username taken or not
    public boolean isUsernameTaken(String uname) throws SQLException {
        String query = "SELECT * FROM patient WHERE username = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, uname);
        ResultSet resultSet = pstmt.executeQuery();
        return resultSet.next();
    }

    // Validate user credentials
    public Patient isValidUser(String username, String password) throws SQLException {
        String query = "SELECT * FROM patient WHERE username = ? AND password = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet resultSet = pstmt.executeQuery()) {
                if (resultSet.next()) {
                    int patientId = resultSet.getInt("patient_id");
                    String uname = resultSet.getString("username");
                    String pass = resultSet.getString("password");
                    String firstName = resultSet.getString("first_name");
                    String lastName = resultSet.getString("last_name");
                    String email = resultSet.getString("email");
                    String tel = resultSet.getString("phone_number");
                    String gender = resultSet.getString("gender");
                    String dob = resultSet.getString("date_of_birth");
                    String bloodGroup = resultSet.getString("blood_group");
                    String address = resultSet.getString("address");
                    String city = resultSet.getString("city");
                    String state = resultSet.getString("state");
                    String zipCode = resultSet.getString("zip_code");
                    String regDate = resultSet.getString("reg_date");

                    Patient patient = new Patient(patientId, uname, pass, firstName, lastName, email,
                        tel, gender, dob, bloodGroup, address, city, state,
                        zipCode, regDate);

                    return patient;
                }
            }
        }
        return null;
    }


    // Select all Patients
    public List < Patient > selectAllPatients() {

        // using try-with-resources to avoid closing resources (boilerplate code)
        List < Patient > Patients = new ArrayList < > ();

        try {

            String sql = "SELECT *  FROM patient";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("patient_id");
                String username = rs.getString("username");
                String pass = rs.getString("password");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String tel = rs.getString("phone_number");
                String gender = rs.getString("gender");
                String dob = rs.getString("date_of_birth");
                String bloodGroup = rs.getString("blood_group");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String state = rs.getString("state");
                String zipCode = rs.getString("zip_code");
                String regDate = rs.getString("reg_date");

                Patients.add(new Patient(id, username, pass, firstName, lastName, email, tel, gender, dob, bloodGroup, address, city, state, zipCode, regDate));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Patients;
    }

    //Select patient by id
    public static Patient selectPatient(int id) {
        Patient patient = null;

        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM patient WHERE patient_id = ?")) {

            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);

            // Step 3: Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String tel = rs.getString("phone_number");
                String gender = rs.getString("gender");
                String dob = rs.getString("date_of_birth");
                String bloodGroup = rs.getString("blood_group");
                String address = rs.getString("address");
                String city = rs.getString("city");
                String state = rs.getString("state");
                String zipCode = rs.getString("zip_code");

                // Create a new Patient object
                patient = new Patient(id, firstName, lastName, email, tel, gender, dob, bloodGroup, address, city, state, zipCode);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patient;
    }


    // Update an existing patient
    public static void updatePatient(Patient patient) throws SQLException {
        System.out.println("Hello Upadte");
        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement pstmt = connection.prepareStatement(
            "UPDATE patient SET gender=?, first_name=?, last_name=?, email=?, phone_number=?, date_of_birth=?, blood_group=?, address=?, city=?, state=?, zip_code=? WHERE patient_id=?")) {

            pstmt.setString(1, patient.getGender());
            pstmt.setString(2, patient.getFirstName());
            pstmt.setString(3, patient.getLastName());
            pstmt.setString(4, patient.getEmail());
            pstmt.setString(5, patient.getPhoneNo());
            pstmt.setString(6, patient.getDob());
            pstmt.setString(7, patient.getBloodGroup());
            pstmt.setString(8, patient.getAddress());
            pstmt.setString(9, patient.getCity());
            pstmt.setString(10, patient.getState());
            pstmt.setString(11, patient.getZipCode());
            pstmt.setInt(12, patient.getPatientID());

            pstmt.executeUpdate();
        }
    }

    // Delete Patient
    public static boolean deletePatient(int id) throws SQLException {
        boolean rowDeleted;

        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement pstmt = connection.prepareStatement("DELETE FROM patient WHERE patient_id = ?");) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    //Calculate Total Patients 
    public int getTotalPatients() {
        int totalRows = 0;

        try {
            String sql = "SELECT COUNT(*) AS total_patients FROM patient";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                totalRows = resultSet.getInt("total_patients");
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