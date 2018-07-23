package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Order;

import java.util.List;

public interface OrderDAO {

  List<Order> findAll();

  Order findById(String id);

  List<Order> findByUsername(String username);

  List<Order> search(String keyword);

  void save(Order order);

  void update(Order order);

  Order find(Integer id);
}
