package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Feedback;
import com.fpt.esanitary.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller("adminFeedbackController")
@RequestMapping("admin/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping
    public String getAllFeedback(Model model) {
        model.addAttribute("feedbacks", feedbackService.findAll());
        List feedbacks = feedbackService.findAll();
        return "admin/feedback/index";
    }

    @GetMapping("approve")
    public String approveFeedback(@RequestParam("id") Integer id) {
        Feedback feedback = feedbackService.findById(id);
        feedback.setApprove(true);
        feedbackService.update(feedback);
        return "redirect:/admin/feedback";
    }

    @GetMapping("unapprove")
    public String unapproveFeedback(@RequestParam("id") Integer id) {
        Feedback feedback = feedbackService.findById(id);
        feedback.setApprove(false);
        feedbackService.update(feedback);
        return "redirect:/admin/feedback";
    }
}
