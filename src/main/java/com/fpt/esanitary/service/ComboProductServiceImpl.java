package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ComboProductDAO;
import com.fpt.esanitary.entities.ComboProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ComboProductServiceImpl implements ComboProductService {

  @Autowired
  private ComboProductDAO comboProductDAO;

  @Override
  public List<ComboProduct> findAll() {
    return comboProductDAO.findAll();
  }

  @Override
  public List<ComboProduct> findByCombo(String keyword) {
    return comboProductDAO.findByCombo(keyword);
  }

  @Override
  public void save(ComboProduct comboProduct) {
    comboProductDAO.save(comboProduct);
  }

  @Override
  public void update(ComboProduct comboProduct) {
    comboProductDAO.update(comboProduct);
  }
}
