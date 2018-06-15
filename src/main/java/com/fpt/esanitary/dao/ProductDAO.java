package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Product;

import java.util.List;

public interface ProductDAO {

  List<Product> findAll();

  Product find(Integer id);

  List<Product> getProductByCategory();

  void create(Product product);

  void update(Product product);

  Product findByName(String name);

  List<Product> search(String keyword);
}
