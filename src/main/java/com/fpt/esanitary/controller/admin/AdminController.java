package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Feedback;
import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.service.FeedbackService;
import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("admin")
public class AdminController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping
    public String showIndex(Model model) {
        int countNewOrders = 0;
        int countNewFeedbacks = 0;
        int countDebts = 0;

        List<Order> orders = orderService.findAll();

        for (Order o : orders) {
            if (o.getClosed() == false) {
                countNewOrders++;
            }
        }

        for (Order o : orders) {
            if (o.getTotalPrice() != o.getTotalPaid() || o.getTotalPaid() == null) {
                countDebts++;
            }
        }

        for (Feedback f : feedbackService.findAll()) {
            if (f.getApprove() == false) {
                countNewFeedbacks++;
            }
        }

        model.addAttribute("countNewOrders", countNewOrders);
        model.addAttribute("countNewFeedbacks", countNewFeedbacks);
        model.addAttribute("countDebts", countDebts);
        return "admin/index";
    }
}
