package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Account;

import java.util.List;

public interface AccountDAO {

    List<Account> findAll();

    Account find(String username);

    void create(Account account);

    void update(Account account);

    List<Account> search(String keyword);

    List<Account> findAllCustomer();
}
