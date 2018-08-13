package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Feedback;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FeedbackDAOImpl implements FeedbackDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Feedback> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Feedback", Feedback.class);
    List<Feedback> feedbacks = query.getResultList();
    return feedbacks;
  }

  @Override
  public Feedback findById(Integer id) {
    Session session = sessionFactory.getCurrentSession();
    Feedback feedback = session.createQuery("from Feedback where id = :id", Feedback.class)
            .setParameter("id", id)
            .getSingleResult();
    return feedback;
  }

  @Override
  public List<Feedback> findByUsername(String username) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Feedback where username = :username", Feedback.class)
            .setParameter("username", username);
    List<Feedback> feedbacks = query.getResultList();
    return feedbacks;
  }

  @Override
  public List<Feedback> findByProduct(String id) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Feedback where productId = :id", Feedback.class)
            .setParameter("id", id);
    List<Feedback> feedbacks = query.getResultList();
    return feedbacks;
  }

  @Override
  public void create(Feedback feedback) {
    Session session = sessionFactory.getCurrentSession();
    session.save(feedback);
  }

  @Override
  public void update(Feedback feedback) {
    Session session = sessionFactory.getCurrentSession();
    session.update(feedback);
  }

  @Override
  public void delete(Feedback feedback) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(feedback);
  }
}
