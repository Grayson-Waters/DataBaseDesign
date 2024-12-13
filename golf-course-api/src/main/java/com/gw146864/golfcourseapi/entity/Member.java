package com.gw146864.golfcourseapi.entity;


import java.util.Date;

public class Member {

    private Integer memberId;
    private String emailAddress;
    private String phoneNumber;
    private String Cart_Enqueue_Date;

    // Getters and setters
    public Integer getMemberId() {
        return memberId;
    }

    public void setMemberId(Integer memberId) {
        this.memberId = memberId;
    }

    public String getEmailAddress() {
        return this.emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }


    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getCart_Enqueue_Date() {
        return "2024-03-05";
    }

    public void setCart_Enqueue_Date(String cartBarnEnqueueDateTime) {
        this.Cart_Enqueue_Date = Cart_Enqueue_Date;
    }
}