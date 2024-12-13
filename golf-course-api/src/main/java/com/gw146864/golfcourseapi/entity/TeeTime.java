package com.gw146864.golfcourseapi.entity;



import java.io.Serializable;
import java.util.Date;


public class TeeTime {

    private Date Date_time;
    

    private Player Email_address;

    public Date getDate_time() {
        return Date_time;
    }

    public void setDate_time(Date date_time) {
        this.Date_time = date_time;
    }


    public Player getEmail_address() {
        return Email_address;
    }
    
    public void setEmail_address(Player email_address) {
        this.Email_address = email_address;
    }
    
    
}
