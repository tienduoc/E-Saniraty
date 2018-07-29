package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealMessage;

import java.util.List;

public interface DealMessageDAO {

    void save(DealMessage dealMessage);

    List<DealMessage> findByDealHistoryId(String dealHistoryId);
}
