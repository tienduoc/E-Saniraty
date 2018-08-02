package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.service.OrderDetailService;
import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller("adminOrderController")
@RequestMapping("admin/order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping
    public String getAllOrder(Model model) {
        model.addAttribute("orders", orderService.findAll());
        return "admin/order/index";
    }

    @GetMapping("detail")
    public String showOrderDetail(@RequestParam String orderId, Model model) {
        model.addAttribute("order", orderService.findById(orderId));
        model.addAttribute("orderDetails", orderDetailService.findByOrder(orderId));
        return "admin/order/detail";
    }

    @GetMapping("update")
    public String showUpdateForm(@RequestParam String orderId, Model model) {
        model.addAttribute("order", orderService.findById(orderId));
        model.addAttribute("orderDetails", orderDetailService.findByOrder(orderId));
        return "admin/order/update";
    }

    @PostMapping("update")
    public String updateOrder(@ModelAttribute Order order) {
        order = orderService.findById(order.getId());
        order.setClosed(order.getClosed());
        orderService.update(order);
        return "redirect:/admin/order";
    }
}
