package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Category;

import java.util.List;

public interface CategoryService {

  List<Category> findAll();

  Category find(Integer id);

  List<Category> findByParentId(Integer id);

  List<Category> getParent();

  List<Category> getChild();

  void create(Category category);

  void delete(Integer id);

  void update(Category category);

  Category findByName(String name);

  List<Category> search(String keyword);
}
