package com.fpt.esanitary.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class OrderDetailPK implements Serializable {
    private String orderId;
    private String productId;

    @Column(name = "OrderID", nullable = false, length = 50)
    @Id
    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
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
        OrderDetailPK that = (OrderDetailPK) o;
        return Objects.equals(orderId, that.orderId) &&
                Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(orderId, productId);
    }
}
