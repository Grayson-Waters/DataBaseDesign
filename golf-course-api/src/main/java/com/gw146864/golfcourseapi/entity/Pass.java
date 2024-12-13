package com.gw146864.golfcourseapi.entity;


import java.util.Date;

public class Pass {

    private int memberId;
    private String type;
    private Date dateInitialized;
    private int isPunchCard;

    // Getters and setters
    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getDateInitialized() {
        return dateInitialized;
    }

    public void setDateInitialized(Date dateInitialized) {
        this.dateInitialized = dateInitialized;
    }

    public int getIsPunchCard() {
        return isPunchCard;
    }

    public void setIsPunchCard(int isPunchCard) {
        this.isPunchCard = isPunchCard;
    }
}