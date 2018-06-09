package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Combo {
    private String id;
    private String name;
    private double comboPrice;
    private Collection<ComboProduct> comboProductsById;

    @Id
    @Column(name = "Id", nullable = false, length = 50)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    @Basic
    @Column(name = "Name", nullable = false, length = 2147483647)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "ComboPrice", nullable = false, precision = 0)
    public double getComboPrice() {
        return comboPrice;
    }

    public void setComboPrice(double comboPrice) {
        this.comboPrice = comboPrice;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Combo combo = (Combo) o;
        return Double.compare(combo.comboPrice, comboPrice) == 0 &&
                Objects.equals(id, combo.id) &&
                Objects.equals(name, combo.name);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, name, comboPrice);
    }

    @OneToMany(mappedBy = "comboByComboId")
    public Collection<ComboProduct> getComboProductsById() {
        return comboProductsById;
    }

    public void setComboProductsById(Collection<ComboProduct> comboProductsById) {
        this.comboProductsById = comboProductsById;
    }
}
