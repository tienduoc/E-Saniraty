package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.OrderDetailDAO;
import com.fpt.esanitary.entities.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderDetailServiceImpl implements OrderDetailService {

  @Autowired
  private OrderDetailDAO orderDetailDAO;

  @Override
  public List<OrderDetail> findByOrder(String orderId) {
    return orderDetailDAO.findByOrder(orderId);
  }

  @Override
  public void save(OrderDetail orderDetail) {
    orderDetailDAO.save(orderDetail);
  }

  @Override
  public void update(OrderDetail orderDetail) {
    orderDetailDAO.update(orderDetail);
  }

  @Override
  public void removeProduct(String orderId, String productId) {
    orderDetailDAO.removeProduct(orderId, productId);
  }
}
