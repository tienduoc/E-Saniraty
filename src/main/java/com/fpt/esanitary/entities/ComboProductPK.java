package com.fpt.esanitary.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class ComboProductPK implements Serializable {
    private String comboId;
    private String productId;

    @Column(name = "ComboID", nullable = false, length = 50)
    @Id
    public String getComboId() {
        return comboId;
    }

    public void setComboId(String comboId) {
        this.comboId = comboId;
    }

    @Column(name = "ProductID", nullable = false, length = 50)
    @Id
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
        ComboProductPK that = (ComboProductPK) o;
        return Objects.equals(comboId, that.comboId) &&
                Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(comboId, productId);
    }
}
