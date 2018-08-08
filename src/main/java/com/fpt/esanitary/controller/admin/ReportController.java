package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("admin/report")
public class ReportController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String showReport(Model model) {
        List<Order> orders = orderService.findAll();
        int numTotalOrder = 0;
        int numOrderSuccess = 0;
        for (Order o : orders) {
            numTotalOrder += 1;
            if (o.getClosed() == true) {
                numOrderSuccess += 1;
            }
        }
        model.addAttribute("numTotalOrder", numTotalOrder);
        model.addAttribute("numOrderSuccess", numOrderSuccess);
        return "admin/report/index";
    }

    @PostMapping
    public String getReportBetweenDate(@RequestParam("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fromDate,
                                       @RequestParam("untilDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date untilDate,
                                       Model model) {
        List<Order> orders = orderService.findAll();
        int numTotalOrder = 0;
        int numOrderSuccess = 0;
        for (Order o : orders) {
            numTotalOrder += 1;
            if (o.getClosed() == true) {
                numOrderSuccess += 1;
            }
        }
        model.addAttribute("numTotalOrder", numTotalOrder);
        model.addAttribute("numOrderSuccess", numOrderSuccess);
        model.addAttribute("orderBetweendate", orderService.getOrderBetweenDate(fromDate, untilDate));
        return "admin/report/index";
    }
}
