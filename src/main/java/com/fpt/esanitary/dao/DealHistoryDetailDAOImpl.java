package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistoryDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DealHistoryDetailDAOImpl implements DealHistoryDetailDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public DealHistoryDetail findByDealHistory(Integer dealHistoryId) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from DealHistoryDetail where dealHistoryId = :dealHistoryId", DealHistoryDetail.class)
            .setParameter("dealHistoryId", dealHistoryId);
    DealHistoryDetail dealHistoryDetail = (DealHistoryDetail) query.getSingleResult();
    return dealHistoryDetail;
  }

  @Override
  public void save(DealHistoryDetail dealHistoryDetail) {
    Session session = sessionFactory.getCurrentSession();
    session.save(dealHistoryDetail);
  }

  @Override
  public void update(DealHistoryDetail dealHistoryDetail) {
    Session session = sessionFactory.getCurrentSession();
    session.update(dealHistoryDetail);
  }
}
