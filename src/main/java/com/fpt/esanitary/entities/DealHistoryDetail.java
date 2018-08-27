package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "deal_history_detail", schema = "dbo", catalog = "esanitary")
@IdClass(DealHistoryDetailPK.class)
public class DealHistoryDetail implements Serializable {
  private String dealHistoryId;
  private String productId;
  private double originalPrice;
  private double contractorPrice;
  private Double newPrice;
  private DealHistory dealHistoryByDealHistoryId;
  private Product productByProductId;

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "DealHistoryID", nullable = false)
  public String getDealHistoryId() {
    return dealHistoryId;
  }

  public void setDealHistoryId(String dealHistoryId) {
    this.dealHistoryId = dealHistoryId;
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
  @Column(name = "OriginalPrice", nullable = false, precision = 0)
  public double getOriginalPrice() {
    return originalPrice;
  }

  public void setOriginalPrice(double originalPrice) {
    this.originalPrice = originalPrice;
  }

  @Basic
  @Column(name = "ContractorPrice", nullable = false, precision = 0)
  public double getContractorPrice() {
    return contractorPrice;
  }

  public void setContractorPrice(double contractorPrice) {
    this.contractorPrice = contractorPrice;
  }

  @Basic
  @Column(name = "NewPrice", precision = 0)
  public Double getNewPrice() {
    return newPrice;
  }

  public void setNewPrice(Double newPrice) {
    this.newPrice = newPrice;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    DealHistoryDetail that = (DealHistoryDetail) o;
    return dealHistoryId == that.dealHistoryId &&
            Double.compare(that.originalPrice, originalPrice) == 0 &&
            Double.compare(that.contractorPrice, contractorPrice) == 0 &&
            Double.compare(that.newPrice, newPrice) == 0 &&
            Objects.equals(productId, that.productId);
  }

  @Override
  public int hashCode() {

    return Objects.hash(dealHistoryId, productId, originalPrice, contractorPrice, newPrice);
  }

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "DealHistoryID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public DealHistory getDealHistoryByDealHistoryId() {
    return dealHistoryByDealHistoryId;
  }

  public void setDealHistoryByDealHistoryId(DealHistory dealHistoryByDealHistoryId) {
    this.dealHistoryByDealHistoryId = dealHistoryByDealHistoryId;
  }

  @ManyToOne
  @JoinColumn(name = "ProductID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Product getProductByProductId() {
    return productByProductId;
  }

  public void setProductByProductId(Product productByProductId) {
    this.productByProductId = productByProductId;
  }
}
