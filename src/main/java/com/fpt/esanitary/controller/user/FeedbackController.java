package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.Feedback;
import com.fpt.esanitary.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller("userFeedbackController")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @PostMapping("createFeedback")
    public String sendFeedback(@RequestParam String content,
                               @RequestParam String productId) {
        String acc = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            acc = userDetail.getUsername(); // Lấy tên username
        }
        if (acc == null) {
            return "user/login";
        }
        Feedback feedback = new Feedback();
        feedback.setUsername(acc);
        feedback.setProductId(productId);
        feedback.setFeedbackContent(content);
        feedback.setDate(new Date());
        feedbackService.create(feedback);

        return "redirect:/product/detail?id="+productId;
    }
}
