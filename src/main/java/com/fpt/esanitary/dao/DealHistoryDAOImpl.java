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
  public List<DealHistory> findAll() {
    Session session = sessionFactory.getCurrentSession();
    List<DealHistory> dealHistories = session.createQuery("from  DealHistory", DealHistory.class).getResultList();
    return dealHistories;
  }

    @Override
    public List<DealHistory> findByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        List<DealHistory> dealHistories = session.createQuery("from DealHistory where orderByOrderId.username = :username", DealHistory.class)
                .setParameter("username", username)
                .getResultList();
        return dealHistories;
    }

    @Override
  public DealHistory findById(String dealHistoryId) {
    Session session = sessionFactory.getCurrentSession();
    DealHistory dealHistory = session.createQuery("from DealHistory where id = :dealHistoryId", DealHistory.class)
            .setParameter("dealHistoryId", dealHistoryId)
            .getSingleResult();
    return dealHistory;
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
