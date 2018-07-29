package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistoryDetail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DealHistoryDetailDAOImpl implements DealHistoryDetailDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<DealHistoryDetail> findByDealHistoryId(String dealHistoryId) {
    Session session = sessionFactory.getCurrentSession();
    List<DealHistoryDetail> dealHistoryDetails = session.createQuery("from DealHistoryDetail where dealHistoryId = :dealHistoryId", DealHistoryDetail.class)
            .setParameter("dealHistoryId", dealHistoryId)
            .getResultList();
    return dealHistoryDetails;
  }

  @Override
  public List<DealHistoryDetail> findByUsername(String username) {
    Session session = sessionFactory.getCurrentSession();
    List<DealHistoryDetail> dealHistoryDetails = session.createQuery("from DealHistoryDetail where dealHistoryByDealHistoryId.orderByOrderId.username = :username", DealHistoryDetail.class)
            .setParameter("username", username)
            .getResultList();
    return dealHistoryDetails;
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
