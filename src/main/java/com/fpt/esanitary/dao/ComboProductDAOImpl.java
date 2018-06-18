package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.ComboProduct;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ComboProductDAOImpl implements ComboProductDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<ComboProduct> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from ComboProduct order by comboByComboId.name", ComboProduct.class);
    List<ComboProduct> comboProducts = query.getResultList();
    return comboProducts;
  }

  @Override
  public List<ComboProduct> findByCombo(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from ComboProduct where comboByComboId.name like :keyword", ComboProduct.class)
            .setParameter("keyword", keyword);
    List<ComboProduct> comboProducts = query.getResultList();
    return comboProducts;
  }

  @Override
  public void save(ComboProduct comboProduct) {
    Session session = sessionFactory.getCurrentSession();
    session.save(comboProduct);
  }

  @Override
  public void update(ComboProduct comboProduct) {
    Session session = sessionFactory.getCurrentSession();
    session.update(comboProduct);
  }
}
