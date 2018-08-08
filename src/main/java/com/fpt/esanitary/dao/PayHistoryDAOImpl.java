package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.PayHistory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PayHistoryDAOImpl implements PayHistoryDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<PayHistory> findAll() {
    Session session = sessionFactory.getCurrentSession();
    List<PayHistory> payHistories = session.createQuery("from PayHistory").getResultList();
    return payHistories;
  }

  @Override
  public List<PayHistory> findByOrder(String orderId) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from PayHistory where orderId = :orderId", PayHistory.class)
            .setParameter("orderId", orderId);
    List<PayHistory> payHistories = query.getResultList();
    return payHistories;
  }

  @Override
  public void save(PayHistory payHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.save(payHistory);
  }

  @Override
  public void update(PayHistory payHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.update(payHistory);
  }

  @Override
  public void delete(PayHistory payHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(payHistory);
  }

  @Override
  public int getLastId() {
    Session session = sessionFactory.getCurrentSession();
    int lastId = (int) session.createQuery("select id from PayHistory order by id desc")
            .setMaxResults(1)
            .uniqueResult();
    return lastId;
  }
}
