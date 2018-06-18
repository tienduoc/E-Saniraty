package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.sql.Date;
import java.util.Objects;

@Entity
public class Article {
  private int id;
  private String title;
  private Date date;
  private String aricleUrl;
  private String manufacturerId;
  private Manufacturer manufacturerByManufacturerId;

  @Id
  @Column(name = "Id", nullable = false)
  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  @Basic
  @Column(name = "Title", nullable = false, length = 2147483647)
  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  @Basic
  @Column(name = "Date", nullable = false)
  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  @Basic
  @Column(name = "AricleURL", nullable = false, length = 2147483647)
  public String getAricleUrl() {
    return aricleUrl;
  }

  public void setAricleUrl(String aricleUrl) {
    this.aricleUrl = aricleUrl;
  }

  @Basic
  @Column(name = "ManufacturerID", nullable = false, length = 20)
  public String getManufacturerId() {
    return manufacturerId;
  }

  public void setManufacturerId(String manufacturerId) {
    this.manufacturerId = manufacturerId;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Article article = (Article) o;
    return id == article.id &&
            Objects.equals(title, article.title) &&
            Objects.equals(date, article.date) &&
            Objects.equals(aricleUrl, article.aricleUrl) &&
            Objects.equals(manufacturerId, article.manufacturerId);
  }

  @Override
  public int hashCode() {

    return Objects.hash(id, title, date, aricleUrl, manufacturerId);
  }

  @ManyToOne
  @JoinColumn(name = "ManufacturerID", referencedColumnName = "Id", nullable = false, insertable = false, updatable = false)
  public Manufacturer getManufacturerByManufacturerId() {
    return manufacturerByManufacturerId;
  }

  public void setManufacturerByManufacturerId(Manufacturer manufacturerByManufacturerId) {
    this.manufacturerByManufacturerId = manufacturerByManufacturerId;
  }
}
