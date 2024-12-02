package com.mediscoop.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.mediscoop.model.Doctor;
import com.mediscoop.model.Patient;

public class DoctorDAO {
    private Connection connection;

    public DoctorDAO() {
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

    //Check username taken or not
    public boolean isUsernameTaken(String uname) throws SQLException {
        String query = "SELECT * FROM doctor WHERE username = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, uname);
        ResultSet resultSet = pstmt.executeQuery();
        return resultSet.next();
    }

    //Register new Doctor
    public void createDoctor(String uname, String email, String pass) throws SQLException {
        String query = "INSERT INTO doctor (username, password, email, reg_date) VALUES (?, ?, ?, NOW())";
        PreparedStatement pstmt = connection.prepareStatement(query);

        pstmt.setString(1, uname);
        pstmt.setString(2, email);
        pstmt.setString(3, pass);
        pstmt.executeUpdate();
    }

    //Add new Doctor
    public void addDoctor(String username, String password, String firstName, String lastName, String email,
        String phoneNo, String gender, String dob, String about, String address, String specialization) throws SQLException {
        String query = "INSERT INTO doctor (username, PASSWORD, email, first_name, last_name, phone_number, gender, date_of_birth, about_me, address, specialization, reg_date) VALUES (?, ?, ?,?,?,?,?,?,?,?,?, NOW())";
        PreparedStatement pstmt = connection.prepareStatement(query);

        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        pstmt.setString(4, firstName);
        pstmt.setString(5, lastName);
        pstmt.setString(6, phoneNo);
        pstmt.setString(7, gender);
        pstmt.setString(8, dob);
        pstmt.setString(9, about);
        pstmt.setString(10, address);
        pstmt.setString(11, specialization);
        pstmt.executeUpdate();
    }

    // Validate user credentials
    public Doctor isValidUser(String username, String password) throws SQLException {
        String query = "SELECT * FROM doctor WHERE username = ? AND password = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        try (ResultSet resultSet = pstmt.executeQuery()) {
            if (resultSet.next()) {
                int doctorId = resultSet.getInt("doctor_id");
                String uname = resultSet.getString("username");
                String pass = resultSet.getString("password");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String email = resultSet.getString("email");
                String tel = resultSet.getString("phone_number");
                String gender = resultSet.getString("gender");
                String dob = resultSet.getString("date_of_birth");
                String aboutMe = resultSet.getString("about_me");
                String address = resultSet.getString("address");
                String specialization = resultSet.getString("specialization");
                String regDate = resultSet.getString("reg_date");

                Doctor doctor = new Doctor(doctorId, uname, pass, firstName, lastName, email,
                    tel, gender, dob, aboutMe, address, specialization, regDate);

                return doctor;
            }
        }

        return null;
    }

    //Select Doctor by id
    public static Doctor selectDoctor(int id) {
        Doctor doctor = null;

        // Step 1: Establishing a Connection
        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM doctor WHERE doctor_id = ?")) {

            // Set the ID parameter in the prepared statement
            preparedStatement.setInt(1, id);

            System.out.println(preparedStatement);

            // Step 3: Execute the query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String tel = rs.getString("phone_number");
                String gender = rs.getString("gender");
                String dob = rs.getString("date_of_birth");
                String about = rs.getString("about_me");
                String address = rs.getString("address");
                String specialization = rs.getString("specialization");

                // Create a new Patient object
                doctor = new Doctor(id, username, password, firstName, lastName, email, tel, gender, dob, about, address, specialization);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctor;
    }

    // Update an existing Doctor
    public static void updateDoctor(Doctor doctor) throws SQLException {
        System.out.println("Hello Upadte");
        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement pstmt = connection.prepareStatement(
            "UPDATE doctor SET username=?, first_name=?, last_name=?, email=?, phone_number=?,gender=?, date_of_birth=?, about_me=?, address=?, specialization=? WHERE doctor_id=?")) {

            pstmt.setString(1, doctor.getUsername());
            pstmt.setString(2, doctor.getFirstName());
            pstmt.setString(3, doctor.getLastName());
            pstmt.setString(4, doctor.getEmail());
            pstmt.setString(5, doctor.getPhoneNo());
            pstmt.setString(6, doctor.getGender());
            pstmt.setString(7, doctor.getDob());
            pstmt.setString(8, doctor.getAbout());
            pstmt.setString(9, doctor.getAddress());
            pstmt.setString(10, doctor.getSpecialization());
            pstmt.setInt(11, doctor.getDoctorID());

            pstmt.executeUpdate();
        }
    }

    // Select all Doctors
    public List < Doctor > selectAllDoctorss() {

        // using try-with-resources to avoid closing resources (boilerplate code)
        List < Doctor > doctors = new ArrayList < > ();

        try {

            String sql = "SELECT *  FROM doctor";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            System.out.println(pstmt);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("doctor_id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String email = rs.getString("email");
                String tel = rs.getString("phone_number");
                String gender = rs.getString("gender");
                String dob = rs.getString("date_of_birth");
                String aboutMe = rs.getString("about_me");
                String address = rs.getString("address");
                String specialization = rs.getString("specialization");
                String regDate = rs.getString("reg_date");

                doctors.add(new Doctor(id, username, password, firstName, lastName, email, tel, gender, dob, aboutMe, address, specialization, regDate));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return doctors;
    }

    // Delete Doctor
    public static boolean deleteDoctor(int id) throws SQLException {
        boolean rowDeleted;

        try (Connection connection = DatabaseConnector.getConnection(); PreparedStatement pstmt = connection.prepareStatement("DELETE FROM doctor WHERE doctor_id = ?");) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    //Calculate Total doctors 
    public int getTotalDoctors() {
        int totalRows = 0;

        try {
            String sql = "SELECT COUNT(*) AS total_doctors FROM doctor";
            PreparedStatement pstmt = connection.prepareStatement(sql);
            ResultSet resultSet = pstmt.executeQuery();
            if (resultSet.next()) {
                totalRows = resultSet.getInt("total_doctors");
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