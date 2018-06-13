package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Category;

import java.util.List;

public interface CategoryDAO {

  List<Category> findAll();

  Category find(Integer id);

  List<Category> getParent();

  List<Category> getChild();

  void create(Category category);

  void delete(Category category);

  void update(Category category);

  Category findByName(String name);

  List<Category> search(String keyword);
}
