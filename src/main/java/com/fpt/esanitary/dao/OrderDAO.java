package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Debt;
import com.fpt.esanitary.entities.Order;

import java.util.Date;
import java.util.List;

public interface OrderDAO {

  List<Order> findAll();

  List<Order> findAllOpen();

  List<Order> getOrderBetweenDate(Date fromDate, Date untilDate);

  List<Debt> findAllGroupByUsername();

  Order findById(String id);

  List<Order> findByUsername(String username);

  List<Order> search(String keyword);

  void save(Order order);

  void update(Order order);

  void remove(String orderId);

  Order find(Integer id);
}
