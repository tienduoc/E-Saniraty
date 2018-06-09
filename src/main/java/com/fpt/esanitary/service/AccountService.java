package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Account;

import java.util.List;

public interface AccountService {

    List<Account> findAll();

    Account find(String username);

    void create(Account account);

    void update(Account account);

    void delete(Account account);

    List<Account> search(String keyword);
}
