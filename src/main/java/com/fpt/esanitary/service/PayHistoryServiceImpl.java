package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.PayHistoryDAO;
import com.fpt.esanitary.entities.PayHistory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PayHistoryServiceImpl implements PayHistoryService {

  @Autowired
  private PayHistoryDAO payHistoryDAO;

  @Override
  public List<PayHistory> findByOrder(String orderId) {
    return payHistoryDAO.findByOrder(orderId);
  }

  @Override
  public void save(PayHistory payHistory) {
    payHistoryDAO.save(payHistory);
  }

  @Override
  public void update(PayHistory payHistory) {
    payHistoryDAO.update(payHistory);
  }

  @Override
  public void delete(PayHistory payHistory) {
    payHistoryDAO.delete(payHistory);
  }
}
