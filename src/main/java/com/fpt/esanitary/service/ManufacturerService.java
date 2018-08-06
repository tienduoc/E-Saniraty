package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Manufacturer;

import java.util.List;

public interface ManufacturerService {

  List<Manufacturer> findAll();

  Manufacturer find(String id);

  List<Manufacturer> search(String keyword);

  void create(Manufacturer manufacturer);

  void update(Manufacturer manufacturer);
}
