package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.FeedbackDAO;
import com.fpt.esanitary.entities.Feedback;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FeedbackServiceImpl implements FeedbackService {

  @Autowired
  private FeedbackDAO feedbackDAO;

  @Override
  public List<Feedback> findAll() {
    return feedbackDAO.findAll();
  }

  @Override
  public List<Feedback> findByUsername(String username) {
    return feedbackDAO.findByUsername(username);
  }

  @Override
  public List<Feedback> findByProduct(String id) {
    return feedbackDAO.findByProduct(id);
  }

  @Override
  public void create(Feedback feedback) {
    feedbackDAO.create(feedback);
  }

  @Override
  public void update(Feedback feedback) {
    feedbackDAO.update(feedback);
  }

  @Override
  public void delete(Feedback feedback) {
    feedbackDAO.delete(feedback);
  }
}
