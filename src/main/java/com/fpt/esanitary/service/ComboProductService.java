package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.ComboProduct;

import java.util.List;

public interface ComboProductService {

  List<ComboProduct> findAll();

  List<ComboProduct> findByCombo(String keyword);

  void save(ComboProduct comboProduct);

  void update(ComboProduct comboProduct);
}
