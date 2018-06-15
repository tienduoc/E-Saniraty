package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Product;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Product> findAll() {
    return null;
  }

  @Override
  public Product find(Integer id) {
    return null;
  }

  @Override
  public List<Product> getProductByCategory() {
    return null;
  }

  @Override
  public void create(Product product) {

  }

  @Override
  public void update(Product product) {

  }

  @Override
  public Product findByName(String name) {
    return null;
  }

  @Override
  public List<Product> search(String keyword) {
    return null;
  }
}
