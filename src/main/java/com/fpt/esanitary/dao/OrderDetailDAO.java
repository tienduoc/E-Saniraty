package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.OrderDetail;

import java.util.List;

public interface OrderDetailDAO {

  List<OrderDetail> findByOrder(String orderId);

  void save(OrderDetail orderDetail);

  void update(OrderDetail orderDetail);
}
