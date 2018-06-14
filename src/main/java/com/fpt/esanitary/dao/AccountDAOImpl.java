package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Account;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AccountDAOImpl implements AccountDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<Account> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Account> accounts = session.createQuery("from Account order by username", Account.class).getResultList();
        return accounts;
    }

    @Override
    public Account find(String username) {
        Session session = sessionFactory.getCurrentSession();
        Account account = session.get(Account.class, username);
        return account;
    }

    @Override
    public void create(Account account) {
        Session session = sessionFactory.getCurrentSession();
        account.setPassword(passwordEncoder.encode(account.getPassword()));
        session.save(account);
    }

    @Override
    public void update(Account account) {
        Session session = sessionFactory.getCurrentSession();
        session.update(account);
    }

    @Override
    public void delete(Account account) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(account);
    }

    @Override
    public List<Account> search(String keyword) {
        Session session = sessionFactory.getCurrentSession();
        Query<Account> query = session.createQuery("from Account where username like :keyword", Account.class);
        query.setParameter("keyword", "%" + keyword + "%");
        List<Account> accounts = query.getResultList();
        return accounts;
    }
}
