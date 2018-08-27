package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.entities.PayHistory;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.OrderDetailService;
import com.fpt.esanitary.service.OrderService;
import com.fpt.esanitary.service.PayHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin/debt")
public class DebtController {

    @Autowired
    private PayHistoryService payHistoryService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping("/")
    public String showPayHistoryManagenment(Model model) {
        model.addAttribute("debts", orderService.findAllGroupByUsername());
        model.addAttribute("ordersOpen", orderService.findAllOpen());
        model.addAttribute("accounts", accountService.findAll());
        return "admin/debt/index";
    }

    @GetMapping("pay")
    public String showPayForm(@RequestParam String orderId, Model model) {
        int payId = 0;
        try {
            payId = payHistoryService.getLastId() + 1;
        } catch (NullPointerException e) {
            payId = 1;
        }
        model.addAttribute("payId", payId);
        model.addAttribute("payHistories", payHistoryService.findByOrder(orderId));
        model.addAttribute("order", orderService.findById(orderId));
        model.addAttribute("orderDetails", orderDetailService.findByOrder(orderId));
        model.addAttribute("customer", accountService.find(orderService.findById(orderId).getUsername()));
        model.addAttribute("pay", new PayHistory());
        return "admin/debt/pay";
    }

    @PostMapping("pay")
    public String savePayInfomation(@ModelAttribute("pay") PayHistory payHistory,
                                    @RequestParam String orderId) {
        payHistory.setOrderId(orderId);
        payHistory.setDate(new Date());
        payHistoryService.save(payHistory);
        Order order = orderService.findById(payHistory.getOrderId());
        if (order.getTotalPaid() == null) {
            order.setTotalPaid(payHistory.getPaid());
        } else {
            order.setTotalPaid(order.getTotalPaid() + payHistory.getPaid());
        }
        if (Double.compare(order.getTotalPaid(), order.getTotalPrice()) == 0) {
            order.setClosed(true);
        }
        orderService.update(order);
        return "redirect:/admin/debt/pay?orderId=" + orderId;
    }
}
