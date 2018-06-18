package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.OrderDetail;

public interface OrderDetailService {

  OrderDetail findByOrder(String orderId);

  void save(OrderDetail orderDetail);

  void update(OrderDetail orderDetail);
}
