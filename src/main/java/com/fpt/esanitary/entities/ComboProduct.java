package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "combo_product", schema = "dbo", catalog = "esanitary")
@IdClass(ComboProductPK.class)
public class ComboProduct {
  private String comboId;
  private String productId;
  private Combo comboByComboId;
  private Product productByProductId;

  @Id
  @Column(name = "ComboID", nullable = false, length = 50)
  public String getComboId() {
    return comboId;
  }

  public void setComboId(String comboId) {
    this.comboId = comboId;
  }

  @Id
  @Column(name = "ProductID", nullable = false, length = 50)
  public String getProductId() {
    return productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ComboProduct that = (ComboProduct) o;
    return Objects.equals(comboId, that.comboId) &&
            Objects.equals(productId, that.productId);
  }

  @Override
  public int hashCode() {

    return Objects.hash(comboId, productId);
  }

  @ManyToOne
  @JoinColumn(name = "ComboID", referencedColumnName = "Id", nullable = false, insertable=false, updatable=false)
  public Combo getComboByComboId() {
    return comboByComboId;
  }

  public void setComboByComboId(Combo comboByComboId) {
    this.comboByComboId = comboByComboId;
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
