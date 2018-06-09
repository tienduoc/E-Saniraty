package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.AccountDAO;
import com.fpt.esanitary.entities.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountDAO accountDAO;

    @Override
    public List<Account> findAll() {
        return accountDAO.findAll();
    }

    @Override
    public Account find(String username) {
        return accountDAO.find(username);
    }

    @Override
    public void create(Account account) {
        accountDAO.create(account);
    }

    @Override
    public void update(Account account) {
        accountDAO.update(account);
    }

    @Override
    public void delete(Account account) {
        accountDAO.delete(account);
    }

    @Override
    public List<Account> search(String keyword) {
        return accountDAO.search(keyword);
    }
}
