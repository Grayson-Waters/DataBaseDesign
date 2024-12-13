package com.gw146864.golfcourseapi.entity;





public class Player {

    private String emailAddress;
    private String Lname;
    private String Fname;
    private String password;

    // Getters and setters
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getFname() {
        return Fname;
    }

    public void setFname(String Fname) {
        this.Fname = Fname;
    }

    public String getLname() {
        return Lname;
    }

    public void setLName(String Lname) {
        this.Lname = Lname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
