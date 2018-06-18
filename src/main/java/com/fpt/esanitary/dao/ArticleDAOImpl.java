package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Article;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Article> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Article order by date", Article.class);
    List<Article> articles = query.getResultList();
    return articles;
  }

  @Override
  public List<Article> findByManufacturer(String id) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Article where manufacturerId=:id", Article.class);
    List<Article> articles = query.getResultList();
    return articles;
  }

  @Override
  public List<Article> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Article where title like :keyword", Article.class)
            .setParameter("keyword", "%" + keyword + "%");
    List<Article> articles = query.getResultList();
    return articles;
  }

  @Override
  public void create(Article article) {
    Session session = sessionFactory.getCurrentSession();
    session.save(article);
  }

  @Override
  public void update(Article article) {
    Session session = sessionFactory.getCurrentSession();
    session.update(article);
  }

  @Override
  public void delete(Article article) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(article);
  }
}
