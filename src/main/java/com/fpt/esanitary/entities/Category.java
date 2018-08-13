package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Category implements Serializable {
    private int id;
    private String name;
    private Integer parentId;
    private Category categoryByParentId;
    private Collection<Category> categoriesById;
    private Collection<Product> productsById;

    @Id
    @Column(name = "Id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getId() {
        return id;
    }

    public void setId(int id) {
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
    @Column(name = "ParentID", nullable = true)
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Category category = (Category) o;
        return id == category.id &&
                Objects.equals(name, category.name) &&
                Objects.equals(parentId, category.parentId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, parentId);
    }

    @ManyToOne
    @JoinColumn(name = "ParentID", referencedColumnName = "Id", insertable = false, updatable = false)
    public Category getCategoryByParentId() {
        return categoryByParentId;
    }

    public void setCategoryByParentId(Category categoryByParentId) {
        this.categoryByParentId = categoryByParentId;
    }

    @OneToMany(mappedBy = "categoryByParentId")
    public Collection<Category> getCategoriesById() {
        return categoriesById;
    }

    public void setCategoriesById(Collection<Category> categoriesById) {
        this.categoriesById = categoriesById;
    }

    @OneToMany(mappedBy = "categoryByCategoryId")
    public Collection<Product> getProductsById() {
        return productsById;
    }

    public void setProductsById(Collection<Product> productsById) {
        this.productsById = productsById;
    }
}