package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.OrderDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<OrderDetail> findByOrder(String orderId) {
    Session session = sessionFactory.getCurrentSession();
    List<OrderDetail> orderDetails = session.createQuery("from OrderDetail where orderId = :orderId", OrderDetail.class)
            .setParameter("orderId", orderId)
            .getResultList();
    return orderDetails;
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

  @Override
  public void removeProduct(String orderId, String productId) {
    Session session = sessionFactory.getCurrentSession();
    Query<OrderDetail> query = session.createQuery("delete from OrderDetail od where od.orderId=:orderId and od.productId=:productId")
            .setParameter("orderId", orderId)
            .setParameter("productId", productId);
    query.executeUpdate();
  }
}
