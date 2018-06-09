package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.RoleDAO;
import com.fpt.esanitary.entities.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("roleService")
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    @Override
    public List<Role> findAll() {
        return roleDAO.findAll();
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

    }

    @Override
    public void update(Role role) {

    }

    @Override
    public void delete(Role role) {

    }
}
