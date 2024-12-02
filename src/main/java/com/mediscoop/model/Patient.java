package com.mediscoop.model;

public class Patient extends User {
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNo;
	private String gender;
	private String dob;
	private String bloodGroup;
	private String address;
	private String city;
	private String state;
	private String zipCode;
	private String reg_date;
	
	public Patient(int patientID, String username, String password, String firstName, String lastName, String email,
			String phoneNo, String gender, String dob, String bloodGroup, String address, String city, String state,
			String zipCode, String reg_date) {
		super(patientID, username, password);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.reg_date = reg_date;
	}
	
	public Patient(String username, String password, String firstName, String lastName, String email,
			String phoneNo, String gender, String dob, String bloodGroup, String address, String city, String state,
			String zipCode, String reg_date) {
		super(username, password);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.reg_date = reg_date;
	}
	
	public Patient(int patientID, String firstName, String lastName, String email,
			String phoneNo, String gender, String dob, String bloodGroup, String address, String city, String state,
			String zipCode) {
		super(patientID);
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phoneNo = phoneNo;
		this.gender = gender;
		this.dob = dob;
		this.bloodGroup = bloodGroup;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
	}
	
	public Patient(int patientID, String email) {
		super(patientID);
		this.email= email;
	}
	
	public Patient(String email) {
		super();
		this.email= email;
	}
	
	public int getPatientID() {
		return super.getUserID(); 
	}

	public void setPatientID(int patientID) {
		super.setUserID(patientID);
	}

	public String getUsername() {
		return super.getUsername(); 
	}

	public void setUsername(String username) {
		super.setUsername(username); 
	}

	public String getPassword() {
		return super.getPassword(); 
	}

	public void setPassword(String password) {
		super.setPassword(password); 
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	
	
	
	
	
}
