package com.fpt.esanitary.entities;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
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
  private String dealStatus;
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
  public boolean getClosed() {
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

  @Basic
  @Column(name = "DealStatus", nullable = true, length = 10)
  public String getDealStatus() {
    return dealStatus;
  }

  public void setDealStatus(String dealState) {
    this.dealStatus = dealState;
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
            Objects.equals(totalPaid, order.totalPaid) &&
            Objects.equals(dealStatus, order.dealStatus);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, date, username, closed, totalPrice, totalPaid, dealStatus);
  }

  @OneToMany(mappedBy = "orderByOrderId")
  @LazyCollection(LazyCollectionOption.FALSE)
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

  @OneToMany(mappedBy = "orderByOrderId", fetch = FetchType.EAGER)
  public Collection<OrderDetail> getOrderDetailsById() {
    return orderDetailsById;
  }

  public void setOrderDetailsById(Collection<OrderDetail> orderDetailsById) {
    this.orderDetailsById = orderDetailsById;
  }

  @OneToMany(mappedBy = "orderByOrderId", fetch = FetchType.EAGER)
  @Fetch(value = FetchMode.SUBSELECT)
  public Collection<PayHistory> getPayHistoriesById() {
    return payHistoriesById;
  }

  public void setPayHistoriesById(Collection<PayHistory> payHistoriesById) {
    this.payHistoriesById = payHistoriesById;
  }

  @Override
  public String toString() {
    return "Order{" +
            "id='" + id + '\'' +
            ", date=" + date +
            ", username='" + username + '\'' +
            ", closed=" + closed +
            ", totalPrice=" + totalPrice +
            ", totalPaid=" + totalPaid +
            ", dealStatus='" + dealStatus + '\'' +
            ", dealHistoriesById=" + dealHistoriesById +
            ", accountByUsername=" + accountByUsername +
            ", orderDetailsById=" + orderDetailsById +
            ", payHistoriesById=" + payHistoriesById +
            '}';
  }
}