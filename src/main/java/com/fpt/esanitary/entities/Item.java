package com.fpt.esanitary.entities;

import org.hibernate.validator.constraints.Length;

import java.io.Serializable;

public class Item implements Serializable {

    private Product product;
    private int quantity;


    public Item() {
        super();
    }

    public Item(Product product, int quantity) {
        super();
        this.product = product;
        this.quantity = quantity;
    }
    public Product getProduct() {
        return product;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public int getQuantity() {
        return quantity;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
