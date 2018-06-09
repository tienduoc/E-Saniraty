package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Role;

import java.util.List;

public interface RoleService {

    List<Role> findAll();

    Role find(String id);

    Role findByName(String name);

    void create(Role role);

    void update(Role role);

    void delete(Role role);
}
