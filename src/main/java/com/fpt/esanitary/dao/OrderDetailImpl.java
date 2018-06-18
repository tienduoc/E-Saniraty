package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.OrderDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailImpl implements OrderDetailDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public OrderDetail findByOrder(String orderId) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from OrderDetail where orderId = :orderId", OrderDetail.class)
            .setParameter("orderId", orderId);
    OrderDetail orderDetail = (OrderDetail) query.getSingleResult();
    return orderDetail;
  }

  @Override
  public void save(OrderDetail orderDetail) {
    Session session = sessionFactory.getCurrentSession();
    session.save(orderDetail);
  }

  @Override
  public void update(OrderDetail orderDetail) {
    Session session = sessionFactory.getCurrentSession();
    session.update(orderDetail);
  }
}
