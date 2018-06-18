package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Combo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComboDAOImpl implements ComboDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Combo> findALl() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Combo", Combo.class);
    List<Combo> combos = query.getResultList();
    return combos;
  }

  @Override
  public List<Combo> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Combo where name like :keyword")
            .setParameter("keyword", "%" + keyword + "%");
    List<Combo> combos = query.getResultList();
    return combos;
  }

  @Override
  public void create(Combo combo) {
    Session session = sessionFactory.getCurrentSession();
    session.save(combo);
  }

  @Override
  public void update(Combo combo) {
    Session session = sessionFactory.getCurrentSession();
    session.update(combo);
  }

  @Override
  public void delete(Combo combo) {
    Session session = sessionFactory.getCurrentSession();
    session.delete(combo);
  }
}
