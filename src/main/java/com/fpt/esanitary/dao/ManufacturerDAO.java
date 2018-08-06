package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Manufacturer;

import java.util.List;

public interface ManufacturerDAO {

  List<Manufacturer> findAll();

  List<Manufacturer> search(String keyword);

  void create(Manufacturer manufacturer);

  void update(Manufacturer manufacturer);

  Manufacturer find(String id);
}
