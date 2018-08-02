package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.DealHistoryDAO;
import com.fpt.esanitary.entities.DealHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DealHistoryServiceImpl implements DealHistoryService {

  @Autowired
  private DealHistoryDAO dealHistoryDAO;

  @Override
  public List<DealHistory> findAll() {
    return dealHistoryDAO.findAll();
  }

  @Override
  public List<DealHistory> findByUsername(String username) {
    return dealHistoryDAO.findByUsername(username);
  }

  @Override
  public List<DealHistory> findByOrderId(String orderId) {
    return dealHistoryDAO.findByOrderId(orderId);
  }

  @Override
  public DealHistory findById(String dealHistoryId) {
    return dealHistoryDAO.findById(dealHistoryId);
  }

  @Override
  public void save(DealHistory dealHistory) {
    dealHistoryDAO.save(dealHistory);
  }

  @Override
  public void update(DealHistory dealHistory) {
    dealHistoryDAO.update(dealHistory);
  }

  @Override
  public void delete(DealHistory dealHistory) {
    dealHistoryDAO.delete(dealHistory);
  }

  @Override
  public void deleteByOrderId(String orderId) {
    dealHistoryDAO.deleteByOrderId(orderId);
  }
}
