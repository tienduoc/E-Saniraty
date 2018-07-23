package com.fpt.esanitary.controller.contractor;

import com.fpt.esanitary.entities.*;
import com.fpt.esanitary.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.persistence.NoResultException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller("contractorDealControlller")
@RequestMapping("contractor")
public class DealController {

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private ProductService productService;

    @Autowired
    private DealHistoryService dealHistoryService;

    @Autowired
    private DealMessageService dealMessageService;

    @Autowired
    private DealHistoryDetailService dealHistoryDetailService;

    @GetMapping("deal")
    public String showDealForm(@RequestParam String orderId, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth instanceof AnonymousAuthenticationToken) {
            return "user/login";
        }
        try {
            model.addAttribute("order", orderService.findById(orderId));
        } catch (NoResultException nre) {
            return "redirect:/";
        }
        return "contractor/deal";
    }

    @PostMapping("dealRequest")
    public String createDealRequest(@ModelAttribute("order") Order order,
                                    @RequestParam("message") String message,
                                    @RequestParam("orderId") String orderId,
                                    @RequestParam String[] contractorPrice) {

        final String dealId = "D-" + UUID.randomUUID().toString().substring(0, 7).toUpperCase();
        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        // Create deal
        DealHistory dealHistory = new DealHistory();
        dealHistory.setId(dealId);
        dealHistory.setOrderId(orderId);
        dealHistory.setRequestDate(new Date());
        dealHistory.setRequestDate(new Date());
        dealHistory.setContructorApprove(true);
        dealHistoryService.save(dealHistory);

        // Create deal detail reference to deal
        List<OrderDetail> orderDetails = orderDetailService.findByOrder(orderId);
        for (int i = 0; i < orderDetails.size(); i++) {
            DealHistoryDetail dealHistoryDetail = new DealHistoryDetail();
            dealHistoryDetail.setDealHistoryId(dealId);
            dealHistoryDetail.setProductId(orderDetails.get(i).getProductByProductId().getId());
            dealHistoryDetail.setOriginalPrice(orderDetails.get(i).getUnitPrice());
            dealHistoryDetail.setContractorPrice(Double.parseDouble(contractorPrice[i]));
            dealHistoryDetailService.save(dealHistoryDetail);
        }

        if (!message.isEmpty()) {
            DealMessage dealMessage = new DealMessage();
            dealMessage.setDealHistoryId(dealId);
            dealMessage.setTime(new Date());
            dealMessage.setSender(username);
            dealMessage.setMessage(message);
            dealMessageService.save(dealMessage);
        }

        return "contractor/dealConfirm";
    }
}
