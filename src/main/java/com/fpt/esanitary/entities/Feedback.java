package com.fpt.esanitary.entities;

import javax.persistence.*;
import java.util.Objects;

@Entity
public class Feedback {
  private int feedbackId;
  private String username;
  private String productId;
  private String feedbackContent;
  private Account accountByUsername;
  private Product productByProductId;

  @Id
  @Column(name = "FeedbackID", nullable = false)
  public int getFeedbackId() {
    return feedbackId;
  }

  public void setFeedbackId(int feedbackId) {
    this.feedbackId = feedbackId;
  }

  @Basic
  @Column(name = "Username", nullable = false, length = 50)
  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  @Basic
  @Column(name = "ProductID", nullable = false, length = 50)
  public String getProductId() {
    return productId;
  }

  public void setProductId(String productId) {
    this.productId = productId;
  }

  @Basic
  @Column(name = "FeedbackContent", nullable = false, length = 2147483647)
  public String getFeedbackContent() {
    return feedbackContent;
  }

  public void setFeedbackContent(String feedbackContent) {
    this.feedbackContent = feedbackContent;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    Feedback feedback = (Feedback) o;
    return feedbackId == feedback.feedbackId &&
            Objects.equals(username, feedback.username) &&
            Objects.equals(productId, feedback.productId) &&
            Objects.equals(feedbackContent, feedback.feedbackContent);
  }

  @Override
  public int hashCode() {

    return Objects.hash(feedbackId, username, productId, feedbackContent);
  }

  @ManyToOne
  @JoinColumn(name = "Username", referencedColumnName = "Username", nullable = false, insertable = false, updatable = false)
  public Account getAccountByUsername() {
    return accountByUsername;
  }

  public void setAccountByUsername(Account accountByUsername) {
    this.accountByUsername = accountByUsername;
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
