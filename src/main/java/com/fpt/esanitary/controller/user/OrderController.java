package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("userOrderController")
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("history")
    public String getOrder(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        model.addAttribute("orders", orderService.findByUsername(userDetail.getUsername()));
        return "user/orderHistory";
    }

    @GetMapping("view")
    public String viewOrder(@RequestParam String orderId, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        model.addAttribute("order", orderService.findById(orderId));
        return "user/viewOrder";
    }
}
