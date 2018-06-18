package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.PayHistory;

import java.util.List;

public interface PayHistoryDAO {

  List<PayHistory> findByOrder(String orderId);

  void save(PayHistory payHistory);

  void update(PayHistory payHistory);

  void delete(PayHistory payHistory);
}
