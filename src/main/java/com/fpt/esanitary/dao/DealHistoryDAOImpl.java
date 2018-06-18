package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DealHistoryDAOImpl implements DealHistoryDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<DealHistory> findAllByOrder(String orderId) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from DealHistory where orderId = :orderId order by date desc", DealHistory.class)
            .setParameter("orderId", orderId);
    List<DealHistory> dealHistories = query.getResultList();
    return dealHistories;
  }

  @Override
  public void save(DealHistory dealHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.save(dealHistory);
  }

  @Override
  public void update(DealHistory dealHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.update(dealHistory);
  }

  @Override
  public void delete(DealHistory dealHistory) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(dealHistory);
  }
}
