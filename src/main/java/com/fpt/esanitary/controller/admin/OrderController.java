package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("adminOrderController")
@RequestMapping("admin/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String getAllOrder(Model model) {
        model.addAttribute("orders", orderService.findAll());
        return "admin/order/index";
    }
}
