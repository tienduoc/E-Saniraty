package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.DealHistory;

import java.util.List;

public interface DealHistoryService {

  List<DealHistory> findAll();

  List<DealHistory> findByUsername(String username);

  List<DealHistory> findByOrderId(String orderId);

  DealHistory findById(String dealHistoryId);

  void save(DealHistory dealHistory);

  void update(DealHistory dealHistory);

  void delete(DealHistory dealHistory);

  void deleteByOrderId(String orderId);
}
