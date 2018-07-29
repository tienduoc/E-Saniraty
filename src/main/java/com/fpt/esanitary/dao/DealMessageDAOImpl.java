package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealMessage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DealMessageDAOImpl implements DealMessageDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(DealMessage dealMessage) {
        Session session = sessionFactory.getCurrentSession();
        session.save(dealMessage);
    }

    @Override
    public List<DealMessage> findByDealHistoryId(String dealHistoryId) {
        Session session = sessionFactory.getCurrentSession();
        List<DealMessage> dealMessages = session.createQuery("from DealMessage where dealHistoryId = :dealHistoryId order by time desc", DealMessage.class)
                .setParameter("dealHistoryId", dealHistoryId)
                .getResultList();
        return dealMessages;
    }
}
