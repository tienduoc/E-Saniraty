package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistoryDetail;

import java.util.List;

public interface DealHistoryDetailDAO {

  List<DealHistoryDetail> findByDealHistoryId(String dealHistoryId);

  List<DealHistoryDetail> findByUsername(String username);

  void save(DealHistoryDetail dealHistoryDetail);

  void update(DealHistoryDetail dealHistoryDetail);
}
