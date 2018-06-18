package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Product {
  private String id;
  private int categoryId;
  private String manufacturerId;
  private String name;
  private Double costPrice;
  private double salePrice;
  private String material;
  private String description;
  private String review;
  private String size;
  private Double weight;
  private int unitInStock;
  private boolean enabled;
  private Double minRatio;
  private Double raitoForContractor;
  private Double outlet;
  private Boolean outletEnable;
  private Collection<ComboProduct> comboProductsById;
  private Collection<DealHistoryDetail> dealHistoryDetailsById;
  private Collection<Feedback> feedbacksById;
  private Collection<OrderDetail> orderDetailsById;
  private Category categoryByCategoryId;
  private Manufacturer manufacturerByManufacturerId;
  private Collection<ProductImage> productImagesById;

  @Id
  @Column(name = "Id", nullable = false, length = 50)
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  @Basic
  @Column(name = "CategoryID", nullable = false)
  public int getCategoryId() {
    return categoryId;
  }

  public void setCategoryId(int categoryId) {
    this.categoryId = categoryId;
  }

  @Basic
  @Column(name = "ManufacturerID", nullable = false, length = 20)
  public String getManufacturerId() {
    return manufacturerId;
  }

  public void setManufacturerId(String manufacturerId) {
    this.manufacturerId = manufacturerId;
  }

  @Basic
  @Column(name = "Name", nullable = false, length = 200)
  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Basic

  @Column(name = "CostPrice", nullable = true, precision = 0)
  public Double getCostPrice() {
    return costPrice;
  }

  public void setCostPrice(Double costPrice) {
    this.costPrice = costPrice;
  }

  @Basic
  @Column(name = "SalePrice", nullable = false, precision = 0)
  public double getSalePrice() {
    return salePrice;
  }

  public void setSalePrice(double salePrice) {
    this.salePrice = salePrice;
  }

  @Basic
  @Column(name = "Material", nullable = false, length = 200)
  public String getMaterial() {
    return material;
  }

  public void setMaterial(String material) {
    this.material = material;
  }

  @Basic
  @Column(name = "Description", nullable = true, length = 2147483647)
  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  @Basic
  @Column(name = "Review", nullable = true, length = 2147483647)
  public String getReview() {
    return review;
  }

  public void setReview(String review) {
    this.review = review;
  }

  @Basic
  @Column(name = "Size", nullable = true, length = 50)
  public String getSize() {
    return size;
  }

  public void setSize(String size) {
    this.size = size;
  }

  @Basic
  @Column(name = "Weight", nullable = true, precision = 0)
  public Double getWeight() {
    return weight;
  }

  public void setWeight(Double weight) {
    this.weight = weight;
  }

  @Basic
  @Column(name = "UnitInStock", nullable = false)
  public int getUnitInStock() {
    return unitInStock;
  }

  public void setUnitInStock(int unitInStock) {
    this.unitInStock = unitInStock;
  }

  @Basic
  @Column(name = "Enabled", nullable = false)
  public boolean isEnabled() {
    return enabled;
  }

  public void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }

  @Basic
  @Column(name = "MinRatio", nullable = true, precision = 0)
  public Double getMinRatio() {
    return minRatio;
  }

  public void setMinRatio(Double minRatio) {
    this.minRatio = minRatio;
  }

  @Basic
  @Column(name = "RaitoForContractor", nullable = true, precision = 0)
  public Double getRaitoForContractor() {
    return raitoForContractor;
  }

  public void setRaitoForContractor(Double raitoForContractor) {
    this.raitoForContractor = raitoForContractor;
  }

  @Basic
  @Column(name = "Outlet", nullable = true, precision = 0)
  public Double getOutlet() {
    return outlet;
  }

  public void setOutlet(Double outlet) {
    this.outlet = outlet;
  }

  @Basic
  @Column(name = "OutletEnable", nullable = true)
  public Boolean getOutletEnable() {
    return outletEnable;
  }

  public void setOutletEnable(Boolean outletEnable) {
    this.outletEnable = outletEnable;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Product product = (Product) o;
    return categoryId == product.categoryId &&
            Double.compare(product.salePrice, salePrice) == 0 &&
            unitInStock == product.unitInStock &&
            enabled == product.enabled &&
            Objects.equals(id, product.id) &&
            Objects.equals(manufacturerId, product.manufacturerId) &&
            Objects.equals(name, product.name) &&
            Objects.equals(costPrice, product.costPrice) &&
            Objects.equals(material, product.material) &&
            Objects.equals(description, product.description) &&
            Objects.equals(review, product.review) &&
            Objects.equals(size, product.size) &&
            Objects.equals(weight, product.weight) &&
            Objects.equals(minRatio, product.minRatio) &&
            Objects.equals(raitoForContractor, product.raitoForContractor) &&
            Objects.equals(outlet, product.outlet) &&
            Objects.equals(outletEnable, product.outletEnable);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, categoryId, manufacturerId, name, costPrice, salePrice, material, description, review, size, weight, unitInStock, enabled, minRatio, raitoForContractor, outlet, outletEnable);
  }

  @OneToMany(mappedBy = "productByProductId")
  public Collection<ComboProduct> getComboProductsById() {
    return comboProductsById;
  }

  public void setComboProductsById(Collection<ComboProduct> comboProductsById) {
    this.comboProductsById = comboProductsById;
  }

  @OneToMany(mappedBy = "productByProductId")
  public Collection<DealHistoryDetail> getDealHistoryDetailsById() {
    return dealHistoryDetailsById;
  }

  public void setDealHistoryDetailsById(Collection<DealHistoryDetail> dealHistoryDetailsById) {
    this.dealHistoryDetailsById = dealHistoryDetailsById;
  }

  @OneToMany(mappedBy = "productByProductId")
  public Collection<Feedback> getFeedbacksById() {
    return feedbacksById;
  }

  public void setFeedbacksById(Collection<Feedback> feedbacksById) {
    this.feedbacksById = feedbacksById;
  }

  @OneToMany(mappedBy = "productByProductId")
  public Collection<OrderDetail> getOrderDetailsById() {
    return orderDetailsById;
  }

  public void setOrderDetailsById(Collection<OrderDetail> orderDetailsById) {
    this.orderDetailsById = orderDetailsById;
  }

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "CategoryID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Category getCategoryByCategoryId() {
    return categoryByCategoryId;
  }

  public void setCategoryByCategoryId(Category categoryByCategoryId) {
    this.categoryByCategoryId = categoryByCategoryId;
  }

  @ManyToOne
  @JoinColumn(name = "ManufacturerID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Manufacturer getManufacturerByManufacturerId() {
    return manufacturerByManufacturerId;
  }

  public void setManufacturerByManufacturerId(Manufacturer manufacturerByManufacturerId) {
    this.manufacturerByManufacturerId = manufacturerByManufacturerId;
  }

  @OneToMany(fetch = FetchType.EAGER, mappedBy = "productByProductId")
  public Collection<ProductImage> getProductImagesById() {
    return productImagesById;
  }

  public void setProductImagesById(Collection<ProductImage> productImagesById) {
    this.productImagesById = productImagesById;
  }
}
