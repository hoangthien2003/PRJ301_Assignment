/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models.shopping;

import java.sql.Date;

/**
 *
 * @author hoang
 */
public class OrderDTO {
    private String orderID;
    private String userID;
    private Date date;
    private double total;
    private String address;
    private String phoneNumber;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String userID, Date date, double total, String andress, String phoneNumber) {
        this.orderID = orderID;
        this.userID = userID;
        this.date = date;
        this.total = total;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
