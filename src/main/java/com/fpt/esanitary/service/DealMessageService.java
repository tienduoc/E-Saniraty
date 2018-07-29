package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.DealMessage;

import java.util.List;

public interface DealMessageService {

    void save(DealMessage dealMessage);

    List<DealMessage> findByDealHistoryId(String dealHistoryId);
}
