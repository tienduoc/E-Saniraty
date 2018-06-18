package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistoryDetail;

public interface DealHistoryDetailDAO {

  DealHistoryDetail findByDealHistory(Integer dealHistoryId);

  void save(DealHistoryDetail dealHistoryDetail);

  void update(DealHistoryDetail dealHistoryDetail);
}
