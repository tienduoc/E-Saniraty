package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.DealMessageDAO;
import com.fpt.esanitary.entities.DealMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DealMessageServiceImpl implements DealMessageService {

    @Autowired
    private DealMessageDAO dealMessageDAO;

    @Override
    public void save(DealMessage dealMessage) {
        dealMessageDAO.save(dealMessage);
    }

    @Override
    public List<DealMessage> findByDealHistoryId(String dealHistoryId) {
        return dealMessageDAO.findByDealHistoryId(dealHistoryId);
    }
}
