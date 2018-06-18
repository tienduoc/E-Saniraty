package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistory;

import java.util.List;

public interface DealHistoryDAO {

  List<DealHistory> findAllByOrder(String orderId);

  void save(DealHistory dealHistory);

  void update(DealHistory dealHistory);

  void delete(DealHistory dealHistory);
}
