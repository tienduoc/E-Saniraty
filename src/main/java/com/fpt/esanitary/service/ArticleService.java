package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Article;

import java.util.List;

public interface ArticleService {

  List<Article> findAll();

  List<Article> findByManufacturer(String id);

  List<Article> search(String keyword);

  void create(Article article);

  void update(Article article);

  void delete(Article article);
}
