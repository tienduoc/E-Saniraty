package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "product_image", schema = "dbo", catalog = "esanitary")
public class ProductImage implements Serializable {
  private int id;
  private String productId;
  private String url;
  private Boolean mainPhoto;
  private Product productByProductId;

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
  @Column(name = "ProductID", nullable = false, length = 50)
  public String getProductId() {
    return productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }

  @Basic
  @Column(name = "Url", nullable = false, length = 2147483647)
  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  @Basic
  @Column(name = "MainPhoto", nullable = false)
  public Boolean getMainPhoto() {
    return mainPhoto;
  }

  public void setMainPhoto(Boolean mainPhoto) {
    this.mainPhoto = mainPhoto;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ProductImage that = (ProductImage) o;
    return id == that.id &&
            Objects.equals(productId, that.productId) &&
            Objects.equals(url, that.url) &&
            Objects.equals(mainPhoto, that.mainPhoto);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, productId, url, mainPhoto);
  }

  @ManyToOne(fetch = FetchType.EAGER)
  @JoinColumn(name = "ProductID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Product getProductByProductId() {
    return productByProductId;
  }

  public void setProductByProductId(Product productByProductId) {
    this.productByProductId = productByProductId;
  }
}
