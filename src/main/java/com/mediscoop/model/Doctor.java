package com.mediscoop.model;


public class Doctor extends User {
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNo;
    private String gender;
    private String dob;
    private String about;
    private String address;
    private String specialization;
    private String reg_date;

    public Doctor(int doctorID, String username, String password, String firstName, String lastName, String email,
                  String phoneNo, String gender, String dob, String about, String address, String specialization, String reg_date) {
        super(doctorID, username, password);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.gender = gender;
        this.dob = dob;
        this.about = about;
        this.address = address;
        this.specialization = specialization;
        this.reg_date = reg_date;
    }

    public Doctor(String username, String password, String firstName, String lastName, String email,
                  String phoneNo, String gender, String dob, String about, String address, String specialization) {
        super(username, password);
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.gender = gender;
        this.dob = dob;
        this.about = about;
        this.address = address;
        this.specialization = specialization;
    }
    
    public Doctor(int doctorID,String username, String password, String firstName, String lastName, String email,
            String phoneNo, String gender, String dob, String about, String address, String specialization) {
    	super(doctorID, username, password);
	  this.firstName = firstName;
	  this.lastName = lastName;
	  this.email = email;
	  this.phoneNo = phoneNo;
	  this.gender = gender;
	  this.dob = dob;
	  this.about = about;
	  this.address = address;
	  this.specialization = specialization;
}
    
    
    public int getDoctorID() {
        return super.getUserID(); 
    }
    
    public void setDoctorID(int doctorID) {
    	super.setUserID(doctorID); 
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

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

    
}
