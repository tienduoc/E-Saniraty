package com.fpt.esanitary.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "deal_history", schema = "dbo", catalog = "esanitary")
public class DealHistory implements Serializable {
    private String id;
    private String orderId;
    private Date requestDate;
    private Date responseDate;
    private Boolean bossApprove;
    private Boolean contructorApprove;
    private Order orderByOrderId;
    private Collection<DealHistoryDetail> dealHistoryDetailsById;
    private Collection<DealMessage> dealMessagesById;

    @Id
    @Column(name = "Id", nullable = false, length = 50)
    public String getId() {
        return id;
    }

    public void setId(String id) {
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
    @Column(name = "RequestDate", nullable = false)
    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    @Basic
    @Column(name = "ResponseDate", nullable = true)
    public Date getResponseDate() {
        return responseDate;
    }

    public void setResponseDate(Date responseDate) {
        this.responseDate = responseDate;
    }

    @Basic
    @Column(name = "BossApprove", nullable = true)
    public Boolean getBossApprove() {
        return bossApprove;
    }

    public void setBossApprove(Boolean bossApprove) {
        this.bossApprove = bossApprove;
    }

    @Basic
    @Column(name = "ContructorApprove", nullable = false)
    public Boolean getContructorApprove() {
        return contructorApprove;
    }

    public void setContructorApprove(boolean contructorApprove) {
        this.contructorApprove = contructorApprove;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DealHistory that = (DealHistory) o;
        return contructorApprove == that.contructorApprove &&
                Objects.equals(id, that.id) &&
                Objects.equals(orderId, that.orderId) &&
                Objects.equals(requestDate, that.requestDate) &&
                Objects.equals(responseDate, that.responseDate) &&
                Objects.equals(bossApprove, that.bossApprove);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, orderId, requestDate, responseDate, bossApprove, contructorApprove);
    }

    @ManyToOne
    @JoinColumn(name = "OrderID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
    public Order getOrderByOrderId() {
        return orderByOrderId;
    }

    public void setOrderByOrderId(Order orderByOrderId) {
        this.orderByOrderId = orderByOrderId;
    }

    @OneToMany(mappedBy = "dealHistoryByDealHistoryId", fetch= FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    public Collection<DealHistoryDetail> getDealHistoryDetailsById() {
        return dealHistoryDetailsById;
    }

    public void setDealHistoryDetailsById(Collection<DealHistoryDetail> dealHistoryDetailsById) {
        this.dealHistoryDetailsById = dealHistoryDetailsById;
    }

    @OneToMany(mappedBy = "dealHistoryByDealHistoryId")
    public Collection<DealMessage> getDealMessagesById() {
        return dealMessagesById;
    }

    public void setDealMessagesById(Collection<DealMessage> dealMessagesById) {
        this.dealMessagesById = dealMessagesById;
    }
}
