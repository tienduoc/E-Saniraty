package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Account> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account", Account.class).getResultList();
        return accounts;
    }

    @Override
    public Account find(String username) {
        Session session = sessionFactory.getCurrentSession();
        Query<Account> query = session.createQuery("from Account where username=:username");
        query.setParameter("username", username);
        Account account = query.uniqueResult();
        return account;
    }

    @Override
    public void create(Account account) {
        Session session = sessionFactory.getCurrentSession();
        session.save(account);
    }

    @Override
    public void update(Account account) {

    }

    @Override
    public void delete(Account account) {

    }

    @Override
    public List<Account> search(String keyword) {
        return null;
    }
}
