package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.OrderDetail;
import com.fpt.esanitary.service.OrderDetailService;
import com.fpt.esanitary.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller("userOrderController")
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

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

    @GetMapping("update")
    public String showUpdateOrder (@RequestParam String orderId, Model model){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        model.addAttribute("order", orderService.findById(orderId));
        return "user/updateOrder";
    }

    @PostMapping("update")
    public String updateOrder(@RequestParam("id") String orderId,
                              @RequestParam String[] quantity,
                              RedirectAttributes redirectAttributes) {
        List<OrderDetail> orderDetails = orderDetailService.findByOrder(orderId);
        for (int i = 0; i < orderDetails.size(); i++) {
            if (!quantity[i].isEmpty()) {
                orderDetails.get(i).setQuantity(Integer.parseInt(quantity[i]));
                orderDetailService.update(orderDetails.get(i));
            }
        }
        redirectAttributes.addAttribute("orderId", orderId);
        return "redirect:/order/update";
    }

    @GetMapping("remove")
    public String removePorductInOrder(@RequestParam String orderId,
                                       @RequestParam String productId,
                                       RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        System.out.println(">>>>>> " + orderDetailService.findByOrder(orderId).size());
        if (orderDetailService.findByOrder(orderId).size() > 1) { // todo: kiem tra neu order dong thi khong duoc xoa
            orderDetailService.removeProduct(orderId, productId);
            redirectAttributes.addAttribute("orderId", orderId);
            return "redirect:/order/update";
        } else {
            orderDetailService.removeProduct(orderId, productId);
            orderService.remove(orderId);
            return "redirect:/order/history";
        }
    }
}
