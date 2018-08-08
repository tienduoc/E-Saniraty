package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.PayHistory;

import java.util.List;

public interface PayHistoryService {

  List<PayHistory> findAll();

  List<PayHistory> findByOrder(String orderId);

  void save(PayHistory payHistory);

  void update(PayHistory payHistory);

  void delete(PayHistory payHistory);

  int getLastId();
}
