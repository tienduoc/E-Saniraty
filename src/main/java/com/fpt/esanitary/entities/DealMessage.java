package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "deal_message", schema = "dbo", catalog = "esanitary")
public class DealMessage implements Serializable {
    private int id;
    private String dealHistoryId;
    private Date time;
    private String sender;
    private String message;
    private DealHistory dealHistoryByDealHistoryId;

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
    @Column(name = "DealHistoryID", nullable = false, length = 50)
    public String getDealHistoryId() {
        return dealHistoryId;
    }

    public void setDealHistoryId(String dealHistoryId) {
        this.dealHistoryId = dealHistoryId;
    }

    @Basic
    @Column(name = "Time", nullable = false)
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    @Basic
    @Column(name = "Sender", nullable = false, length = 2147483647)
    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    @Basic
    @Column(name = "Message", nullable = false, length = 2147483647)
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DealMessage that = (DealMessage) o;
        return id == that.id &&
                Objects.equals(dealHistoryId, that.dealHistoryId) &&
                Objects.equals(time, that.time) &&
                Objects.equals(sender, that.sender) &&
                Objects.equals(message, that.message);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, dealHistoryId, time, sender, message);
    }

    @ManyToOne
    @JoinColumn(name = "DealHistoryID", referencedColumnName = "Id", nullable = false, updatable = false, insertable = false)
    public DealHistory getDealHistoryByDealHistoryId() {
        return dealHistoryByDealHistoryId;
    }

    public void setDealHistoryByDealHistoryId(DealHistory dealHistoryByDealHistoryId) {
        this.dealHistoryByDealHistoryId = dealHistoryByDealHistoryId;
    }
}
