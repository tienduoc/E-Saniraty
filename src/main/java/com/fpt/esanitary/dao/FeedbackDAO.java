package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.Feedback;

import java.util.List;

public interface FeedbackDAO {

  List<Feedback> findAll();

  Feedback findById(Integer id);

  List<Feedback> findByUsername(String username);

  List<Feedback> findByProduct(String id);

  void create(Feedback feedback);

  void update(Feedback feedback);

  void delete(Feedback feedback);
}
