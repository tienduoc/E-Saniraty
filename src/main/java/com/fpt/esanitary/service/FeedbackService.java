package com.fpt.esanitary.service;

import com.fpt.esanitary.entities.Feedback;

import java.util.List;

public interface FeedbackService {

  List<Feedback> findAll();

  List<Feedback> findByUsername(String username);

  List<Feedback> findByProduct(String id);

  void create(Feedback feedback);

  void update(Feedback feedback);

  void delete(Feedback feedback);
}
