package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Order;
import org.springframework.security.access.prepost.PreAuthorize;

import java.util.List;

public interface OrderService {

  List<Order> findAll();

  Order findById(String id);

  List<Order> findByUsername(String username);

  List<Order> search(String keyword);

  void save(Order order);

  void update(Order order);

  Order find(Integer id);
}
