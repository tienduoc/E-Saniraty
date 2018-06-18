package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ComboDAO;
import com.fpt.esanitary.entities.Combo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ComboServiceImpl implements ComboService {

  @Autowired
  private ComboDAO comboDAO;

  @Override
  public List<Combo> findALl() {
    return comboDAO.findALl();
  }

  @Override
  public List<Combo> search(String keyword) {
    return comboDAO.search(keyword);
  }

  @Override
  public void create(Combo combo) {
    comboDAO.create(combo);
  }

  @Override
  public void update(Combo combo) {
    comboDAO.update(combo);
  }

  @Override
  public void delete(Combo combo) {
    comboDAO.delete(combo);
  }
}
