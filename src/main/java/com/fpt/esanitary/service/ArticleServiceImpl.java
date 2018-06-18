package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.ArticleDAO;
import com.fpt.esanitary.entities.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ArticleServiceImpl implements ArticleService {

  @Autowired
  private ArticleDAO articleDAO;

  @Override
  public List<Article> findAll() {
    return articleDAO.findAll();
  }

  @Override
  public List<Article> findByManufacturer(String id) {
    return articleDAO.findByManufacturer(id);
  }

  @Override
  public List<Article> search(String keyword) {
    return articleDAO.search(keyword);
  }

  @Override
  public void create(Article article) {
    articleDAO.create(article);
  }

  @Override
  public void update(Article article) {
    articleDAO.update(article);
  }

  @Override
  public void delete(Article article) {
    articleDAO.delete(article);
  }
}
