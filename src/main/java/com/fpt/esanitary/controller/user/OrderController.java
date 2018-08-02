package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.DealHistory;
import com.fpt.esanitary.entities.DealMessage;
import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.entities.OrderDetail;
import com.fpt.esanitary.service.DealHistoryService;
import com.fpt.esanitary.service.DealMessageService;
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

import java.util.Date;
import java.util.List;

@Controller("userOrderController")
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private DealHistoryService dealHistoryService;

    @Autowired
    private DealMessageService dealMessageService;

    private final int MIN_QUANTITY = 1;
    private final int MAX_QUANTITY = 999;

    @GetMapping
    public String getOrder(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        UserDetails userDetail = (UserDetails) auth.getPrincipal();
        String username = userDetail.getUsername();
        List<Order> orders = orderService.findByUsername(username);
        if (orders.size() > 0) {
            model.addAttribute("orders", orders);
            return "user/order/index";
        } else {
            return "user/order/empty";
        }
    }

    @GetMapping("view")
    public String viewOrder(@RequestParam String orderId, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        model.addAttribute("order", orderService.findById(orderId));
        return "user/order/detail";
    }

    @GetMapping("update")
    public String showUpdateOrder(@RequestParam String orderId, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "redirect:/login";
        }
        model.addAttribute("order", orderService.findById(orderId));
        return "user/order/update";
    }

    @PostMapping("update")
    public String updateOrder(@RequestParam("id") String orderId,
                              @RequestParam String[] quantity,
                              RedirectAttributes redirectAttributes) {
        List<OrderDetail> orderDetails = orderDetailService.findByOrder(orderId);
        for (int i = 0; i < orderDetails.size(); i++) {
            if (!quantity[i].isEmpty()) {
                int qty = Integer.parseInt(quantity[i]);
                if (qty >= MIN_QUANTITY && qty <= MAX_QUANTITY) {
                    orderDetails.get(i).setQuantity(Integer.parseInt(quantity[i]));
                    orderDetailService.update(orderDetails.get(i));
                } else {
                    redirectAttributes.addAttribute("orderId", orderId);
                    redirectAttributes.addFlashAttribute("productId", orderDetails.get(i).getProductId());
                    redirectAttributes.addFlashAttribute("errQuantity", "Vui lòng nhập số lượng từ 1-999");
                    return "redirect:/order/update";
                }
            }
        }

        // If order in deal then write a deal message
        final String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<DealHistory> dealHistories = dealHistoryService.findByOrderId(orderId);
        for (int i = 0; i < dealHistories.size(); i++) {
            boolean dealOpen = dealHistories.get(i).getBossApprove() && !dealHistories.get(i).getContructorApprove();
            if (dealOpen) {
                dealHistories.get(i).setContructorApprove(true);
                dealHistories.get(i).setBossApprove(false);
                dealHistoryService.update(dealHistories.get(i));
                DealMessage dealMessage = new DealMessage();
                dealMessage.setDealHistoryId(dealHistories.get(i).getId());
                dealMessage.setTime(new Date());
                dealMessage.setSender("Thông báo");
                dealMessage.setMessage("Khách hàng " + username + " đã cập nhật đơn hàng");
                dealMessageService.save(dealMessage);
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
        } else if (!orderService.findById(orderId).getDealHistoriesById().isEmpty()) {
            return "user/403";
        } else if (orderDetailService.findByOrder(orderId).size() > 1) { // todo Duoc: kiem tra neu order dong thi khong duoc xoa
            orderDetailService.removeProduct(orderId, productId);
            redirectAttributes.addAttribute("orderId", orderId);
            return "redirect:/order/update";
        } else {
            orderService.remove(orderId);
            return "redirect:/order";
        }
    }
}
