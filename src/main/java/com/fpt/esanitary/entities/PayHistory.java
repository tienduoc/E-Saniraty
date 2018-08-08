package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "pay_history", schema = "dbo", catalog = "esanitary")
public class PayHistory {
    private int id;
    private String orderId;
    private Date date;
    private Double paid;
    private Order orderByOrderId;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "OrderID", nullable = false, length = 50)
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "Date", nullable = false)
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Basic
    @Column(name = "Paid", nullable = false, precision = 0)
    public Double getPaid() {
        return paid;
    }

    public void setPaid(Double paid) {
        this.paid = paid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PayHistory that = (PayHistory) o;
        return id == that.id &&
                Double.compare(that.paid, paid) == 0 &&
                Objects.equals(orderId, that.orderId) &&
                Objects.equals(date, that.date);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, orderId, date, paid);
    }

    @ManyToOne
    @JoinColumn(name = "OrderID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Order getOrderByOrderId() {
        return orderByOrderId;
    }

    public void setOrderByOrderId(Order orderByOrderId) {
        this.orderByOrderId = orderByOrderId;
    }

    @Override
    public String toString() {
        return "PayHistory{" +
                "id=" + id +
                ", orderId='" + orderId + '\'' +
                ", date=" + date +
                ", paid=" + paid +
                ", orderByOrderId=" + orderByOrderId +
                '}';
    }
}
