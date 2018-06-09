package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Category {
    private String id;
    private String name;
    private String desciption;
    private Collection<Product> productsById;

    @Id
    @Column(name = "Id", nullable = false, length = 20)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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
    @Column(name = "Desciption", nullable = true, length = 10)
    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return Objects.equals(id, category.id) &&
                Objects.equals(name, category.name) &&
                Objects.equals(desciption, category.desciption);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, desciption);
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<Product> getProductsById() {
        return productsById;
    }

    public void setProductsById(Collection<Product> productsById) {
        this.productsById = productsById;
    }
}
