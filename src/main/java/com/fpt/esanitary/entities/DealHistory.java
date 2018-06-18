package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name = "deal_history", schema = "dbo", catalog = "esanitary")
public class DealHistory {
  private int id;
  private String orderId;
  private Timestamp date;
  private Boolean bossApprove;
  private Boolean contructorApprove;
  private Order orderByOrderId;
  private Collection<DealHistoryDetail> dealHistoryDetailsById;

  @Id
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
  public Timestamp getDate() {
    return date;
  }

  public void setDate(Timestamp date) {
    this.date = date;
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
  @Column(name = "ContructorApprove", nullable = true)
  public Boolean getContructorApprove() {
    return contructorApprove;
  }

  public void setContructorApprove(Boolean contructorApprove) {
    this.contructorApprove = contructorApprove;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    DealHistory that = (DealHistory) o;
    return id == that.id &&
            Objects.equals(orderId, that.orderId) &&
            Objects.equals(date, that.date) &&
            Objects.equals(bossApprove, that.bossApprove) &&
            Objects.equals(contructorApprove, that.contructorApprove);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, orderId, date, bossApprove, contructorApprove);
  }

  @ManyToOne
  @JoinColumn(name = "OrderID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Order getOrderByOrderId() {
    return orderByOrderId;
  }

  public void setOrderByOrderId(Order orderByOrderId) {
    this.orderByOrderId = orderByOrderId;
  }

  @OneToMany(mappedBy = "dealHistoryByDealHistoryId")
  public Collection<DealHistoryDetail> getDealHistoryDetailsById() {
    return dealHistoryDetailsById;
  }

  public void setDealHistoryDetailsById(Collection<DealHistoryDetail> dealHistoryDetailsById) {
    this.dealHistoryDetailsById = dealHistoryDetailsById;
  }
}
