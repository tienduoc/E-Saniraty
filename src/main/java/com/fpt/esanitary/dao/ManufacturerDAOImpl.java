package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.entities.Manufacturer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ManufacturerDAOImpl implements ManufacturerDAO {

  @Autowired
  private SessionFactory sessionFactory;

  @Override
  public List<Manufacturer> findAll() {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Manufacturer", Manufacturer.class);
    List<Manufacturer> manufacturers = query.getResultList();
    return manufacturers;
  }

  @Override
  public List<Manufacturer> search(String keyword) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from Manufacturer  where name like :keyword", Manufacturer.class)
            .setParameter("keyword", "%" + keyword + "%");
    List<Manufacturer> manufacturers = query.getResultList();
    return manufacturers;
  }

  @Override
  public void create(Manufacturer manufacturer) {
    Session session = sessionFactory.getCurrentSession();
    session.save(manufacturer);
  }

  @Override
  public void update(Manufacturer manufacturer) {
    Session session = sessionFactory.getCurrentSession();
    session.update(manufacturer);
  }

  @Override
  public Manufacturer find(String id) {
    Session session = sessionFactory.getCurrentSession();
    Manufacturer manufacturer = session.get(Manufacturer.class, id);
    return manufacturer;
  }
}