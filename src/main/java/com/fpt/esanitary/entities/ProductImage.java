package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "product_image", schema = "dbo", catalog = "esanitary")
public class ProductImage {
    private String productId;
    private String image;
    private Product productByProductId;

    @Basic
    @Column(name = "ProductID", nullable = false, length = 50)
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Id
    @Basic
    @Column(name = "Image", nullable = false, length = 2147483647)
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductImage that = (ProductImage) o;
        return Objects.equals(productId, that.productId) &&
                Objects.equals(image, that.image);
    }

    @Override
    public int hashCode() {

        return Objects.hash(productId, image);
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
