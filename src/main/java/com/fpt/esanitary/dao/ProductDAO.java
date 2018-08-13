package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Product;

import java.util.List;

public interface ProductDAO {

    List<Product> findAll();

    List<Product> findAllByActive();

    Product findById(String id);

    List<Product> getLastestByCategory(Integer id, int amount);

    void create(Product product);

    void update(Product product);

    Product findByName(String name);

    List<Product> search(String keyword);

    List<Product> findByCategory(Integer id);

    List<Product> findByParentCategory(Integer id);
}
