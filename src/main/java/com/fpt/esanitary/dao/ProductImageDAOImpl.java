package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.ProductImage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductImageDAOImpl implements ProductImageDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<ProductImage> findAll() {
    Session session = sessionFactory.getCurrentSession();
    List<ProductImage> productImages = session.createQuery("from ProductImage order by id desc", ProductImage.class)
            .getResultList();
    return productImages;
  }

  @Override
  public List<ProductImage> findByProduct(String id) {
    Session session = sessionFactory.getCurrentSession();
    List<ProductImage> productImages = session.createQuery("from ProductImage where productId =:id")
            .setParameter("id", id)
            .getResultList();
    return productImages;
  }

  @Override
  public ProductImage find(int id) {
    Session session = sessionFactory.getCurrentSession();
    ProductImage productImage = session.createQuery("from ProductImage where id=:id", ProductImage.class)
            .setParameter("id", id)
            .getSingleResult();
    return productImage;
  }

  @Override
  public ProductImage findByUrl(String url) {
    Session session = sessionFactory.getCurrentSession();
    ProductImage productImage = session.createQuery("from ProductImage where url=:url", ProductImage.class)
            .setParameter("url", url)
            .getSingleResult();
    return productImage;
  }

  @Override
  public List<ProductImage> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query<ProductImage> query = session.createQuery("from ProductImage where url like :keyword", ProductImage.class);
    query.setParameter("keyword", "%" + keyword + "%");
    List<ProductImage> productImages = query.getResultList();
    return productImages;
  }

  @Override
  public void add(ProductImage productImage) {
    Session session = sessionFactory.getCurrentSession();
    session.save(productImage);
  }

  @Override
  public void delete(ProductImage productImage) {

  }

  @Override
  public void update(ProductImage productImage) {
    Session session = sessionFactory.getCurrentSession();
    session.update(productImage);
  }

}
