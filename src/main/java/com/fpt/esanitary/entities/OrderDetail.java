package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "order_detail", schema = "dbo", catalog = "esanitary")
@IdClass(OrderDetailPK.class)
public class OrderDetail {
  private String orderId;
  private String productId;
  private double unitPrice;
  private int quantity;
  private Boolean dealSuccessed;
  private Order orderByOrderId;
  private Product productByProductId;

  @Id
  @Column(name = "OrderID", nullable = false, length = 50)
  public String getOrderId() {
    return orderId;
  }

  public void setOrderId(String orderId) {
    this.orderId = orderId;
  }

  @Id
  @Column(name = "ProductID", nullable = false, length = 50)
  public String getProductId() {
    return productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }

  @Basic
  @Column(name = "UnitPrice", nullable = false, precision = 0)
  public double getUnitPrice() {
    return unitPrice;
  }

  public void setUnitPrice(double unitPrice) {
    this.unitPrice = unitPrice;
  }

  @Basic
  @Column(name = "Quantity", nullable = false)
  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  @Basic
  @Column(name = "DealSuccessed", nullable = true)
  public Boolean getDealSuccessed() {
    return dealSuccessed;
  }

  public void setDealSuccessed(Boolean dealSuccessed) {
    this.dealSuccessed = dealSuccessed;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    OrderDetail that = (OrderDetail) o;
    return Double.compare(that.unitPrice, unitPrice) == 0 &&
            quantity == that.quantity &&
            Objects.equals(orderId, that.orderId) &&
            Objects.equals(productId, that.productId) &&
            Objects.equals(dealSuccessed, that.dealSuccessed);
  }

  @Override
  public int hashCode() {

    return Objects.hash(orderId, productId, unitPrice, quantity, dealSuccessed);
  }

  @ManyToOne
  @JoinColumn(name = "OrderID", referencedColumnName = "Id", nullable = false, insertable=false, updatable=false)
  public Order getOrderByOrderId() {
    return orderByOrderId;
  }

  public void setOrderByOrderId(Order orderByOrderId) {
    this.orderByOrderId = orderByOrderId;
  }

  @ManyToOne
  @JoinColumn(name = "ProductID", referencedColumnName = "Id", nullable = false, insertable=false, updatable=false)
  public Product getProductByProductId() {
    return productByProductId;
  }

  public void setProductByProductId(Product productByProductId) {
    this.productByProductId = productByProductId;
  }
}
