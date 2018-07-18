package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "[order]")
public class Order {
  private String id;
  private Date date;
  private String username;
  private boolean closed;
  private Double totalPrice;
  private Double totalPaid;
  private Collection<DealHistory> dealHistoriesById;
  private Account accountByUsername;
  private Collection<OrderDetail> orderDetailsById;
  private Collection<PayHistory> payHistoriesById;

  @Id
  @Column(name = "Id", nullable = false, length = 50)
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
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
  @Column(name = "Username", nullable = false, length = 50)
  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  @Basic
  @Column(name = "Closed", nullable = false)
  public boolean isClosed() {
    return closed;
  }

  public void setClosed(boolean closed) {
    this.closed = closed;
  }

  @Basic
  @Column(name = "TotalPrice", nullable = true, precision = 0)
  public Double getTotalPrice() {
    return totalPrice;
  }

  public void setTotalPrice(Double totalPrice) {
    this.totalPrice = totalPrice;
  }

  @Basic
  @Column(name = "TotalPaid", nullable = true, precision = 0)
  public Double getTotalPaid() {
    return totalPaid;
  }

  public void setTotalPaid(Double totalPaid) {
    this.totalPaid = totalPaid;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Order order = (Order) o;
    return closed == order.closed &&
            Objects.equals(id, order.id) &&
            Objects.equals(date, order.date) &&
            Objects.equals(username, order.username) &&
            Objects.equals(totalPrice, order.totalPrice) &&
            Objects.equals(totalPaid, order.totalPaid);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, date, username, closed, totalPrice, totalPaid);
  }

  @OneToMany(mappedBy = "orderByOrderId")
  public Collection<DealHistory> getDealHistoriesById() {
    return dealHistoriesById;
  }

  public void setDealHistoriesById(Collection<DealHistory> dealHistoriesById) {
    this.dealHistoriesById = dealHistoriesById;
  }

  @ManyToOne
  @JoinColumn(name = "Username", referencedColumnName = "Username", nullable = false, insertable = false, updatable = false)
  public Account getAccountByUsername() {
    return accountByUsername;
  }

  public void setAccountByUsername(Account accountByUsername) {
    this.accountByUsername = accountByUsername;
  }

  @OneToMany(mappedBy = "orderByOrderId")
  public Collection<OrderDetail> getOrderDetailsById() {
    return orderDetailsById;
  }

  public void setOrderDetailsById(Collection<OrderDetail> orderDetailsById) {
    this.orderDetailsById = orderDetailsById;
  }

  @OneToMany(mappedBy = "orderByOrderId")
  public Collection<PayHistory> getPayHistoriesById() {
    return payHistoriesById;
  }

  public void setPayHistoriesById(Collection<PayHistory> payHistoriesById) {
    this.payHistoriesById = payHistoriesById;
  }
}
