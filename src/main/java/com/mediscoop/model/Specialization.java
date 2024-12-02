package com.mediscoop.model;

public class Specialization {
	
	private int specializationID;
	private String spcName;
	private String spcDec;
	private String creationDate;
	
	public Specialization(int specializationID, String spcName, String spcDec, String creationDate) {
		this.specializationID = specializationID;
		this.spcName = spcName;
		this.spcDec = spcDec;
		this.creationDate = creationDate;
	}
	
	public Specialization(int specializationID, String spcName, String spcDec) {
		this.specializationID = specializationID;
		this.spcName = spcName;
		this.spcDec = spcDec;
	}
	
	public Specialization(String spcName, String spcDec) {
		this.spcName = spcName;
		this.spcDec = spcDec;
	}

	public int getSpecializationID() {
		return specializationID;
	}

	public void setSpecializationID(int specializationID) {
		this.specializationID = specializationID;
	}

	public String getSpcName() {
		return spcName;
	}

	public void setSpcName(String spcName) {
		this.spcName = spcName;
	}

	public String getSpcDec() {
		return spcDec;
	}

	public void setSpcDec(String spcDec) {
		this.spcDec = spcDec;
	}

	public String getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	
	

}
