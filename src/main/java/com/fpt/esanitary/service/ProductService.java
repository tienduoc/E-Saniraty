package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Product;

import java.util.List;

public interface ProductService {

  List<Product> findAll();

  Product find(Integer id);

  List<Product> findByCategory(Integer id);

  List<Product> findByParentCategory(Integer id);

  void create(Product product);

  void update(Product product);

  Product findByName(String name);

  List<Product> search(String keyword);
}
