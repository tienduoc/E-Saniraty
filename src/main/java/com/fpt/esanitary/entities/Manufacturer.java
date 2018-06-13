package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
public class Manufacturer {
  private String id;
  private String name;
  private String url;
  private String desciption;
  private Collection<Article> articlesById;
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
  @Column(name = "URL", nullable = false, length = 2147483647)
  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  @Basic
  @Column(name = "Desciption", nullable = true, length = 2147483647)
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
    Manufacturer that = (Manufacturer) o;
    return Objects.equals(id, that.id) &&
            Objects.equals(name, that.name) &&
            Objects.equals(url, that.url) &&
            Objects.equals(desciption, that.desciption);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, name, url, desciption);
  }

  @OneToMany(mappedBy = "manufacturerByManufacturerId")
  public Collection<Article> getArticlesById() {
    return articlesById;
  }

  public void setArticlesById(Collection<Article> articlesById) {
    this.articlesById = articlesById;
  }

  @OneToMany(mappedBy = "manufacturerByManufacturerId")
  public Collection<Product> getProductsById() {
    return productsById;
  }

  public void setProductsById(Collection<Product> productsById) {
    this.productsById = productsById;
  }
}
