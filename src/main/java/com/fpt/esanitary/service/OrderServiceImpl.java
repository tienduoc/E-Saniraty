package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.OrderDAO;
import com.fpt.esanitary.entities.Debt;
import com.fpt.esanitary.entities.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

  @Autowired
  private OrderDAO orderDAO;

  @Override
  public List<Order> findAll() {
    return orderDAO.findAll();
  }

  @Override
  public List<Order> findAllOpen() {
    return orderDAO.findAllOpen();
  }

  @Override
  public List<Debt> findAllGroupByUsername() {
    return orderDAO.findAllGroupByUsername();
  }

  @Override
  public List<Order> getOrderBetweenDate(Date fromDate, Date untilDate) {
    return orderDAO.getOrderBetweenDate(fromDate, untilDate);
  }

  @Override
  public Order findById(String id) {
    return orderDAO.findById(id);
  }

  @Override
  public List<Order> findByUsername(String username) {
    return orderDAO.findByUsername(username);
  }

  @Override
  public List<Order> search(String keyword) {
    return orderDAO.search(keyword);
  }

  @Override
  public void save(Order order) {
    orderDAO.save(order);
  }

  @Override
  public void update(Order order) {
    orderDAO.update(order);
  }

  @Override
  public void remove(String orderId) {
    orderDAO.remove(orderId);
  }

  @Override
  public Order find(Integer id) {
    return orderDAO.find(id);
  }
}
