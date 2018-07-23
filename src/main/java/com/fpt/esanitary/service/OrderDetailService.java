package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.OrderDetail;

import java.util.List;

public interface OrderDetailService {

  List<OrderDetail> findByOrder(String orderId);

  void save(OrderDetail orderDetail);

  void update(OrderDetail orderDetail);
}
