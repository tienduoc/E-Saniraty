package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Category;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Category> findAll() {
    Session session = sessionFactory.getCurrentSession();
    List categories = session.createQuery("from Category order by name").getResultList();
    return categories;
  }

  @Override
  public Category find(Integer id) {
    Session session = sessionFactory.getCurrentSession();
    Category category = session.createQuery("from Category where id=:id ", Category.class)
            .setParameter("id", id)
            .getSingleResult();
    return category;
  }

  @Override
  public List<Category> getParent() {
    Session session = sessionFactory.getCurrentSession();
    List<Category> categories = session.createQuery("from Category where parentId = null").getResultList();
    return categories;
  }

  @Override
  public List<Category> getChild() {
    Session session = sessionFactory.getCurrentSession();
    List<Category> categories = session.createQuery("from Category where parentId != null order by name").getResultList();
    return categories;
  }

  @Override
  public void create(Category category) {
    Session session = sessionFactory.getCurrentSession();
    session.save(category);
  }

  @Override
  public void delete(Category category) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(category);
  }

  @Override
  public void update(Category category) {
    Session session = sessionFactory.getCurrentSession();
    session.update(category);
  }

  @Override
  public Category findByName(String name) {
    Category category = null;
    Session session = sessionFactory.getCurrentSession();
    try {
      category = session.createQuery("from Category where name =:name", Category.class)
              .setParameter("name", name)
              .getSingleResult();
    } catch (RuntimeException e) {
      category = null;
    }
    return category;
  }

  @Override
  public List<Category> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Category where name like :keyword", Category.class)
            .setParameter("keyword", "%" + keyword + "%");
    List<Category> categories = query.getResultList();
    return categories;
  }
}
