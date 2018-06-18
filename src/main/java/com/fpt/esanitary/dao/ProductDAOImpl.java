package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Product;
import org.hibernate.Session;
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
    Session session = sessionFactory.getCurrentSession();
    List<Product> products = session.createQuery("from Product order by name", Product.class).getResultList();
    return products;
  }

  @Override
  public Product findById(String id) {
    Session session = sessionFactory.getCurrentSession();
    Product product = session.find(Product.class, id);
    return product;
  }

  @Override
  public List<Product> getProductByCategory() {
    Session session = sessionFactory.getCurrentSession();
    return null;
  }

  @Override
  public void create(Product product) {
    Session session = sessionFactory.getCurrentSession();
    session.save(product);
  }

  @Override
  public void update(Product product) {
    Session session = sessionFactory.getCurrentSession();
    session.update(product);
  }

  @Override
  public Product findByName(String name) {
    return null;
  }

  @Override
  public List<Product> search(String keyword) {
    return null;
  }

  @Override
  public List<Product> findByCategory(Integer id) {
    return null;
  }

  @Override
  public List<Product> findByParentCategory(Integer id) {
    Session session = sessionFactory.getCurrentSession();
    List<Product> products = session.createQuery("from Product where categoryId =:id")
            .setParameter("id", id)
            .getResultList();
    return products;
  }
}
