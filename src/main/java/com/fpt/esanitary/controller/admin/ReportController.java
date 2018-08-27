package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.entities.OrderDetail;
import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("admin/report")
public class ReportController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public String showReport(Model model) {
        try {
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
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/report/index";
    }

    @PostMapping
    public String getReportBetweenDate(@RequestParam("fromDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date fromDate,
                                       @RequestParam("untilDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date untilDate,
                                       @RequestParam("role") String role,
                                       HttpSession session,
                                       Model model) {
        try {
//        List<Order> orders = orderService.findAll();
            int numTotalOrder = 0;
            int numOrderSuccess = 0;

            Map<String, Integer> numOfCats = new TreeMap<>();
            List<Order> orderList = orderService.getOrderBetweenDate(fromDate, untilDate);
            if (!role.isEmpty()) {
                orderList.removeIf(order -> !order.getAccountByUsername().getRoleId().equals(role));
            }

            for (int i = 0; i < orderList.size(); i++) {
                numTotalOrder += 1;
                if (orderList.get(i).getClosed() == true) {
                    numOrderSuccess += 1;
                }
                List<OrderDetail> orderDetailList = (List<OrderDetail>) orderList.get(i).getOrderDetailsById();
                for (int j = 0; j < orderDetailList.size(); j++) {
                    String categoryName = orderDetailList.get(j).getProductByProductId().getCategoryByCategoryId().getName();
                    Integer productQuantity = orderDetailList.get(j).getQuantity();
                    if (numOfCats.containsKey(categoryName)) {
                        productQuantity = numOfCats.get(categoryName) + productQuantity;
                    }
                    numOfCats.put(categoryName, productQuantity);
                }
            }
            model.addAttribute("role", role);
            model.addAttribute("fromDate", fromDate);
            model.addAttribute("untilDate", untilDate);
            model.addAttribute("numOfCats", numOfCats);
            session.setAttribute("numTotalOrder", numTotalOrder);
            model.addAttribute("numOrderSuccess", numOrderSuccess);
//            model.addAttribute("orderBetweendate", orderList);
            session.setAttribute("reportResult", orderList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/report/index";
    }

    @GetMapping("print")
    public String printReport(HttpSession session ,ModelMap modelMap) {
        List<Map<String, ?>> listOrders = new ArrayList<Map<String, ?>>();
//        List<Order> orders = orderService.findAll();
        List<Order> orders = (List<Order>) session.getAttribute("reportResult");
        for (Order o : orders) {
            Map<String, Object> m = new HashMap<String, Object>();
            m.put("orderId", o.getId());
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String date = sdf.format(o.getDate());
            m.put("date", date);
            BigDecimal totalPrice = new BigDecimal(o.getTotalPrice());
            m.put("totalPrice", totalPrice);
            m.put("fullname", o.getAccountByUsername().getFullname());
            String status;
            if (o.getAccountByUsername().getRoleId().equals("CU") && !o.getClosed()){
                status = "Đang xử lý";
            } else if (o.getAccountByUsername().getRoleId().equals("CO") && !o.getClosed()){
                BigDecimal debt = new BigDecimal(o.getTotalPrice() - o.getTotalPaid());
                status = "Nợ: " + (debt) + "đ";
            } else {
                status = "Đã đóng";
            }
            m.put("status", status);
            listOrders.add(m);
        }
        modelMap.put("listProducts", listOrders);
        return "admin/report/print";
    }
}
