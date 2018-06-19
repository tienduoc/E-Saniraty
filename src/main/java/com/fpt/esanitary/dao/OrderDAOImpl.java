package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Order;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDAOImpl implements OrderDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Order> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Order", Order.class);
    List<Order> orders = query.getResultList();
    return orders;
  }

  @Override
  public List<Order> findByUsername(String username) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Order where username = :username", Order.class)
            .setParameter("username", username);
    List<Order> orders = query.getResultList();
    return orders;
  }

  @Override
  public List<Order> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Order where username like :keyword")
            .setParameter("keyword", "%" + keyword + "%");
    List<Order> orders = query.getResultList();
    return orders;
  }

  @Override
  public void save(Order order) {
    Session session = sessionFactory.getCurrentSession();
    session.save(order);
  }

  @Override
  public void update(Order order) {
    Session session = sessionFactory.getCurrentSession();
    session.update(order);
  }

  @Override
  public Order find(Integer id) {
    Session session = sessionFactory.getCurrentSession();
//    session.find(Order.class, id);
    Query query = session.createQuery("from Order where id = :id")
            .setParameter("id", id);
    Order order = (Order) query.getSingleResult();
    return order;
  }
}