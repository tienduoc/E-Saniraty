package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.CategoryDAO;
import com.fpt.esanitary.entities.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

  @Autowired
  private CategoryDAO categoryDAO;

  @Override
  public List<Category> findAll() {
    return categoryDAO.findAll();
  }

  @Override
  public Category find(Integer id) {
    return categoryDAO.find(id);
  }

  @Override
  public List<Category> findByParentId(Integer id) {
    return categoryDAO.findByParentId(id);
  }

  @Override
  public List<Category> getParent() {
    return categoryDAO.getParent();
  }

  @Override
  public List<Category> getChild() {
    return categoryDAO.getChild();
  }

  @Override
  public void create(Category category) {
    categoryDAO.create(category);
  }

  @Override
  public void delete(Integer id) {
    categoryDAO.delete(id);
  }

  @Override
  public void update(Category category) {
    categoryDAO.update(category);
  }

  @Override
  public Category findByName(String name) {
    return categoryDAO.findByName(name);
  }

  @Override
  public List<Category> search(String keyword) {
    return categoryDAO.search(keyword);
  }
}
