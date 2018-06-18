package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.OrderDAO;
import com.fpt.esanitary.entities.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
  public Order find(Integer id) {
    return orderDAO.find(id);
  }
}
