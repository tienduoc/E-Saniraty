package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ManufacturerDAO;
import com.fpt.esanitary.entities.Manufacturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ManufacturerServiceImpl implements ManufacturerService {

  @Autowired
  private ManufacturerDAO manufacturerDAO;

  @Override
  public List<Manufacturer> findAll() {
    return manufacturerDAO.findAll();
  }

  @Override
  public Manufacturer find(String id) {
    return manufacturerDAO.find(id);
  }

  @Override
  public List<Manufacturer> search(String keyword) {
    return manufacturerDAO.search(keyword);
  }

  @Override
  public void create(Manufacturer manufacturer) {
    manufacturerDAO.create(manufacturer);
  }

  @Override
  public void update(Manufacturer manufacturer) {
    manufacturerDAO.update(manufacturer);
  }
}
