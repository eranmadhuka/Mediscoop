package com.mediscoop.model;

public class Appointment extends Patient {
    private int appID;
    private String doctorName;
    private String diseases;
    private String appDate;
    private String message;
    
    public Appointment(int appID, int patientID, String patientEmail, String doctorName, String diseases, String appDate, String message) {
        super(patientID, patientEmail);
        this.appID = appID;
        this.doctorName = doctorName;
        this.diseases = diseases;
        this.appDate = appDate;
        this.message = message;
    }
    
    public Appointment(int appID, String patientEmail, String doctorName, String diseases, String appDate, String message) {
        super(patientEmail);
        this.appID = appID;
        this.doctorName = doctorName;
        this.diseases = diseases;
        this.appDate = appDate;
        this.message = message;
    }

    // Getter methods for the private fields
    public int getAppID() {
        return appID;
    }
    
    public int getPatientID() {
        return super.getPatientID(); 
    }
    
    public String getPatientEmail() {
        return super.getEmail(); 
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getDiseases() {
        return diseases;
    }

    public String getAppDate() {
        return appDate;
    }

    public String getMessage() {
        return message;
    }

    // Setter methods for the private fields
    public void setPatientID(int patientID) {
        super.setPatientID(patientID); 
    }
    
    public void setPatientEmail(String patientEmail) {
        super.setEmail(patientEmail); 
    }
    
    public void setAppID(int appID) {
        this.appID = appID;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public void setDiseases(String diseases) {
        this.diseases = diseases;
    }

    public void setAppDate(String appDate) {
        this.appDate = appDate;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
