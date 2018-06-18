package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.ComboProduct;

import java.util.List;

public interface ComboProductDAO {

  List<ComboProduct> findAll();

  List<ComboProduct> findByCombo(String keyword);

  void save(ComboProduct comboProduct);

  void update(ComboProduct comboProduct);
}
