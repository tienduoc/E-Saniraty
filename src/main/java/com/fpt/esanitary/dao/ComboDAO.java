package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Combo;

import java.util.List;

public interface ComboDAO {

  List<Combo> findALl();

  List<Combo> search(String keyword);

  void create(Combo combo);

  void update(Combo combo);

  void delete(Combo combo);
}
