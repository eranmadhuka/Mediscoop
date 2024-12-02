package com.mediscoop.model;

public class User {
	private int userID;
	private String username;
	private String password;
	
	public User() {}
	
	public User(int userID) {
		this.userID = userID;
	}
	
	public User(int userID, String username, String password) {
		this.userID = userID;
	    this.username = username;
	    this.password = password;
	}
	
	public User(String username, String password) {
	    this.username = username;
	    this.password = password;
	}

	// Getter and Setter methods for userID
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getter and Setter methods for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter methods for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
