package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ProductDAO;
import com.fpt.esanitary.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

  @Autowired
  private ProductDAO productDAO;

  @Override
  public List<Product> findAll() {
    return productDAO.findAll();
  }

  @Override
  public Product find(Integer id) {
    return productDAO.find(id);
  }

  @Override
  public List<Product> findByCategory(Integer id) {
    return productDAO.findByCategory(id);
  }

  @Override
  public List<Product> findByParentCategory(Integer id) {
    return productDAO.findByParentCategory(id);
  }

  @Override
  public void create(Product product) {
    productDAO.create(product);
  }

  @Override
  public void update(Product product) {
    productDAO.update(product);
  }

  @Override
  public Product findByName(String name) {
    return productDAO.findByName(name);
  }

  @Override
  public List<Product> search(String keyword) {
    return productDAO.search(keyword);
  }
}
