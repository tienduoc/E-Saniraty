package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Debt;
import com.fpt.esanitary.entities.Order;

import java.util.Date;
import java.util.List;

public interface OrderService {

  List<Order> findAll();

  List<Order> findAllOpen();

  List<Debt> findAllGroupByUsername();

  List<Order> getOrderBetweenDate(Date fromDate, Date untilDate);

  Order findById(String id);

  List<Order> findByUsername(String username);

  List<Order> search(String keyword);

  void save(Order order);

  void update(Order order);

  void remove(String orderId);

  Order find(Integer id);
}
