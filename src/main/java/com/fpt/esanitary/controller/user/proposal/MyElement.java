package com.fpt.esanitary.controller.user.proposal;

import com.fpt.esanitary.entities.Product;

public class MyElement<P> extends Element {

    public MyElement(Product product) {
        value = product;
        cost = product.getSalePrice();
    }
}
