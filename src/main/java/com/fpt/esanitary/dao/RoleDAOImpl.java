package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Role;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleDAO")
public class RoleDAOImpl implements RoleDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Role> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Role> roles = session.createQuery("from Role").list();
        return roles;
    }

    @Override
    public Role find(String id) {
        return null;
    }

    @Override
    public Role findByName(String name) {
        return null;
    }

    @Override
    public void create(Role role) {
        Session session = sessionFactory.getCurrentSession();
        session.save(role);
    }

    @Override
    public void update(Role role) {
      Session session = sessionFactory.getCurrentSession();
      session.update(role);
    }

    @Override
    public void delete(Role role) {
      Session session = sessionFactory.getCurrentSession();
      session.delete(role);
    }
}
