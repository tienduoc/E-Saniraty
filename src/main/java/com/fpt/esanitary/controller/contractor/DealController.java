package com.fpt.esanitary.controller.contractor;

import com.fpt.esanitary.entities.*;
import com.fpt.esanitary.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.persistence.NoResultException;
import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller("contractorDealControlller")
@RequestMapping("deal")
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

    @InitBinder
    public void initBinder(final WebDataBinder binder){
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping
    public String showDealManage(Model model) {
        String acc = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            acc = userDetail.getUsername(); // Lấy tên username
        }
        List<DealHistory> dealHistories = dealHistoryService.findByUsername(acc);
        dealHistories.sort(Comparator.comparing(DealHistory::getRequestDate).reversed());
        model.addAttribute("deals", dealHistories);
        return "contractor/deal/index";
    }

    @GetMapping("create")
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
        return "contractor/deal/create";
    }

    @PostMapping("create")
    public String createDealRequest(@RequestParam("message") String message,
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
            if (!contractorPrice[i].isEmpty()) {
                dealHistoryDetail.setContractorPrice(Double.parseDouble(contractorPrice[i]));
            } else {
                dealHistoryDetail.setContractorPrice(orderDetails.get(i).getUnitPrice());
            }
            dealHistoryDetailService.save(dealHistoryDetail);
        }

        // Set deal state
        Order order = orderService.findById(orderId);
        order.setDealStatus("InProcess");
        orderService.update(order);

        if (!message.isEmpty()) {
            DealMessage dealMessage = new DealMessage();
            dealMessage.setDealHistoryId(dealId);
            dealMessage.setTime(new Date());
            dealMessage.setSender(username);
            dealMessage.setMessage(message);
            dealMessageService.save(dealMessage);
        }

        return "contractor/deal/confirm";
    }

    @GetMapping("view")
    public String showDealDetail(@RequestParam String dealHistoryId, Model model) {
        model.addAttribute("deal", dealHistoryService.findById(dealHistoryId));
        model.addAttribute("dealDetails", dealHistoryDetailService.findByDealHistoryId(dealHistoryId));
        model.addAttribute("messages", dealMessageService.findByDealHistoryId(dealHistoryId));
        return "contractor/deal/detail";
    }

    @PostMapping("update")
    public String updateDeal(@RequestParam String dealHistoryId,
                             @RequestParam Double[] contractorPrice,
                             @ModelAttribute("deal") DealHistory dealHistory) {
        List<DealHistoryDetail> dealHistoryDetails = dealHistoryDetailService.findByDealHistoryId(dealHistoryId);
        for (int i = 0; i < dealHistoryDetails.size(); i++) {
            if (contractorPrice.length == 0 || contractorPrice[i] == 0) {
                double sellerPrice = dealHistoryDetails.get(i).getNewPrice();
                dealHistoryDetails.get(i).setContractorPrice(sellerPrice);
            } else {
                dealHistoryDetails.get(i).setContractorPrice(contractorPrice[i]);

            }
            dealHistoryDetailService.update(dealHistoryDetails.get(i));
        }
        dealHistory.setId(dealHistoryId);
        dealHistory.setOrderId(dealHistory.getOrderId());
        dealHistory.setRequestDate(new Date());
        dealHistory.setResponseDate(dealHistory.getResponseDate());
        dealHistory.setContructorApprove(true);
        dealHistory.setBossApprove(false);
        dealHistoryService.update(dealHistory);
        return "redirect:/deal";
    }

    @GetMapping("confirm")
    public String agreeWithDeal(@RequestParam String orderId,
                                @RequestParam String dealHistoryId) {
        List<OrderDetail> orderDetails = orderDetailService.findByOrder(orderId);
        List<DealHistoryDetail> dealHistoryDetails = dealHistoryDetailService.findByDealHistoryId(dealHistoryId);
        for (int i = 0; i < dealHistoryDetails.size(); i++) {
            orderDetails.get(i).setUnitPrice(dealHistoryDetails.get(i).getNewPrice());
            orderDetailService.update(orderDetails.get(i));
        }
        DealHistory dealHistory = dealHistoryService.findById(dealHistoryId);
        dealHistory.setContructorApprove(true);
        dealHistoryService.update(dealHistory);

        Order order = orderService.findById(orderId);
        order.setDealStatus("Success");
        orderService.update(order);
        return "redirect:/deal";
    }

    @GetMapping("cancelDeal")
    public String cancelDeal(@RequestParam String orderId,
                                @RequestParam String dealHistoryId) {
        DealHistory dealHistory = dealHistoryService.findById(dealHistoryId);
        dealHistory.setBossApprove(false);
        dealHistory.setContructorApprove(false);
        dealHistoryService.update(dealHistory);

        Order order = orderService.findById(orderId);
        order.setDealStatus("Cancel");
        orderService.update(order);
        return "redirect:/deal";
    }
}