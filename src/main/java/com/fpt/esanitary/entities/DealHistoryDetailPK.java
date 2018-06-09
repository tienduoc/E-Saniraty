package com.fpt.esanitary.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Objects;

public class DealHistoryDetailPK implements Serializable {
    private int dealHistoryId;
    private String productId;

    @Column(name = "DealHistoryID", nullable = false)
    @Id
    public int getDealHistoryId() {
        return dealHistoryId;
    }

    public void setDealHistoryId(int dealHistoryId) {
        this.dealHistoryId = dealHistoryId;
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
        DealHistoryDetailPK that = (DealHistoryDetailPK) o;
        return dealHistoryId == that.dealHistoryId &&
                Objects.equals(productId, that.productId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(dealHistoryId, productId);
    }
}
