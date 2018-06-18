package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.DealHistoryDetail;

public interface DealHistoryDetailService {

  DealHistoryDetail findByDealHistory(Integer dealHistoryId);

  void save(DealHistoryDetail dealHistoryDetail);

  void update(DealHistoryDetail dealHistoryDetail);
}
