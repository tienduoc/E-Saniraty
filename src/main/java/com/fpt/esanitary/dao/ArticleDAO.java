package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Article;

import java.util.List;

public interface ArticleDAO {

  List<Article> findAll();

  List<Article> findByManufacturer(String id);

  List<Article> search(String keyword);

  void create(Article article);

  void update(Article article);

  void delete(Article article);
}
