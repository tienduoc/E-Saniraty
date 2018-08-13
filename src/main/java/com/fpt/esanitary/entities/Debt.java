package com.fpt.esanitary.entities;

import javax.persistence.Entity;
import java.io.Serializable;

public class Debt implements Serializable {

    private String username;
    private Double totalPrice;
    private Double totalPaid;

    public Debt() {
    }

    public Debt(String username, Double totalPrice, Double totalPaid) {
        this.username = username;
        this.totalPrice = totalPrice;
        this.totalPaid = totalPaid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Double getTotalPaid() {
        return totalPaid;
    }

    public void setTotalPaid(Double totalPaid) {
        this.totalPaid = totalPaid;
    }

    @Override
    public String toString() {
        return "Debt{" +
                "username='" + username + '\'' +
                ", totalPrice=" + totalPrice +
                ", totalPaid=" + totalPaid +
                '}';
    }
}
