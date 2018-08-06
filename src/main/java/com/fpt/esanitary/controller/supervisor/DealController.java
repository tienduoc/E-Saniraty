package com.fpt.esanitary.controller.supervisor;

import com.fpt.esanitary.entities.*;
import com.fpt.esanitary.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.mail.MessagingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller("supervisorDealController")
@RequestMapping("supervisor/deal")
public class DealController {

    @Autowired
    private DealHistoryService dealHistoryService;

    @Autowired
    private DealHistoryDetailService dealHistoryDetailService;

    @Autowired
    private DealMessageService dealMessageService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private MailService mailService;

    @InitBinder
    public void initBinder(final WebDataBinder binder) {
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    private void sendMessage(@RequestParam(value = "message", required = false) String message,
                             @ModelAttribute("deal") DealHistory dealHistory,
                             String username) {
        if (!message.isEmpty()) {
            DealMessage dealMessage = new DealMessage();
            dealMessage.setDealHistoryId(dealHistory.getId());
            dealMessage.setTime(new Date());
            dealMessage.setSender(username);
            dealMessage.setMessage(message);
            dealMessageService.save(dealMessage);
        }
    }

    @GetMapping
    public String getAllDeal(Model model) {
        model.addAttribute("deals", dealHistoryService.findAll());
        return "supervisor/deal/index";
    }

    @GetMapping("update")
    public String showUpdateDealForm(@RequestParam String dealHistoryId, Model model) {
        model.addAttribute("deal", dealHistoryService.findById(dealHistoryId));
        model.addAttribute("messages", dealMessageService.findByDealHistoryId(dealHistoryId));
        return "supervisor/deal/update";
    }

    @PostMapping("update")
    public String updateDeal(@RequestParam String[] newPrice,
                             @RequestParam("message") String message,
                             @ModelAttribute("deal") DealHistory dealHistory) throws MessagingException {

        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        List<DealHistoryDetail> dealHistoryDetails = dealHistoryDetailService.findByDealHistoryId(dealHistory.getId());
        for (int i = 0; i < dealHistoryDetails.size(); i++) {
            if (newPrice[i].trim() == null || newPrice[i].isEmpty()) {
                double buyerPrice = dealHistoryDetails.get(i).getContractorPrice();
                dealHistoryDetails.get(i).setNewPrice(buyerPrice);
            } else {
                dealHistoryDetails.get(i).setNewPrice(Double.parseDouble(newPrice[i]));
            }
            dealHistoryDetailService.update(dealHistoryDetails.get(i));
        }
        dealHistory.setResponseDate(new Date());
        dealHistory.setContructorApprove(false);
        dealHistory.setBossApprove(true);
        dealHistoryService.update(dealHistory);

        if (message != null) {
            sendMessage(message, dealHistory, username);
        }

        String customerUsername = orderService.findById(dealHistory.getOrderId()).getUsername();
        String userMail = accountService.find(customerUsername).getEmail();
        if (!userMail.trim().isEmpty()) {
            String msgBody = "<p>K&iacute;nh ch&agrave;o qu&yacute; kh&aacute;ch</p>\n" +
                    "<p>ELUX xin th&ocirc;ng b&aacute;o t&igrave;nh trạng thương lượng gi&aacute; của qu&yacute; kh&aacute;ch như sau</p>\n" +
                    "<ul>\n" +
                    "<li>M&atilde; thương lượng: <strong>" + dealHistory.getId() + "</strong></li>\n" +
                    "<li>M&atilde; h&oacute;a đơn: <strong>" + dealHistory.getOrderId() + "</strong></li>\n" +
                    "<li>Trạng th&aacute;i: <strong>đ&atilde; trả lời</strong></li>\n" +
                    "</ul>\n" +
                    "<p>Qu&yacute; kh&aacute;ch vui l&ograve;ng truy cập website để biết th&ecirc;m chi tiết, xin ch&acirc;n th&agrave;nh cảm ơn.</p>";

            mailService.sendMail("ELUX", userMail, "Thương lượng", msgBody);
        }
        return "redirect:/supervisor/deal";
    }

    @GetMapping("acceptDeal")
    public String acceptDeal(@RequestParam String dealHistoryId,
                             @RequestParam(value = "message", required = false) String message,
                             @RequestParam String orderId) throws MessagingException {

        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        List<OrderDetail> orderDetails = orderDetailService.findByOrder(orderId);
        List<DealHistoryDetail> dealHistoryDetails = dealHistoryDetailService.findByDealHistoryId(dealHistoryId);
        for (int i = 0; i < dealHistoryDetails.size(); i++) {
            dealHistoryDetails.get(i).setNewPrice(dealHistoryDetails.get(i).getContractorPrice());
            dealHistoryDetailService.update(dealHistoryDetails.get(i));
        }
        for (int i = 0; i < orderDetails.size(); i++) {
            if (orderDetails.get(i).getProductId().equals(dealHistoryDetails.get(i).getProductId())) {
                orderDetails.get(i).setUnitPrice(dealHistoryDetails.get(i).getContractorPrice());
                orderDetailService.update(orderDetails.get(i));
            }
        }
        DealHistory dealHistory = dealHistoryService.findById(dealHistoryId);
        dealHistory.setResponseDate(new Date());
        dealHistory.setBossApprove(true);
        dealHistoryService.update(dealHistory);

        Order order = orderService.findById(orderId);
        order.setDealStatus("Success");
        orderService.update(order);

        if (message != null) {
            sendMessage(message, dealHistory, username);
        }

        String customerUsername = orderService.findById(dealHistory.getOrderId()).getUsername();
        String userMail = accountService.find(customerUsername).getEmail();
        if (!userMail.trim().isEmpty()) {
            String msgBody = "<p>K&iacute;nh ch&agrave;o qu&yacute; kh&aacute;ch</p>\n" +
                    "<p>ELUX xin th&ocirc;ng b&aacute;o t&igrave;nh trạng thương lượng gi&aacute; của qu&yacute; kh&aacute;ch như sau</p>\n" +
                    "<ul>\n" +
                    "<li>M&atilde; thương lượng: <strong>" + dealHistory.getId() + "</strong></li>\n" +
                    "<li>M&atilde; h&oacute;a đơn: <strong>" + dealHistory.getOrderId() + "</strong></li>\n" +
                    "<li>Trạng th&aacute;i: <strong><span style=\"color: #0000ff;\">đ&atilde; chấp nhận</span></strong></li>\n" +
                    "</ul>\n" +
                    "<p>Qu&yacute; kh&aacute;ch vui l&ograve;ng truy cập website để biết th&ecirc;m chi tiết, xin ch&acirc;n th&agrave;nh cảm ơn.</p>";
            mailService.sendMail("ELUX", userMail, "Thương lượng", msgBody);
        }

        return "redirect:/supervisor/deal";
    }

    @GetMapping("cancelDeal")
    public String cancelDeal(@RequestParam String orderId,
                             @RequestParam String dealHistoryId,
                             @RequestParam(value = "message", required = false) String message) throws MessagingException {

        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        DealHistory dealHistory = dealHistoryService.findById(dealHistoryId);
        dealHistory.setResponseDate(new Date());
        dealHistory.setBossApprove(false);
        dealHistory.setContructorApprove(false);
        dealHistoryService.update(dealHistory);

        Order order = orderService.findById(orderId);
        order.setDealStatus("Cancel");
        orderService.update(order);

        if (message != null) {
            sendMessage(message, dealHistory, username);
        }

        String customerUsername = orderService.findById(dealHistory.getOrderId()).getUsername();
        String userMail = accountService.find(customerUsername).getEmail();
        if (!userMail.trim().isEmpty()) {
            String msgBody = "<p>K&iacute;nh ch&agrave;o qu&yacute; kh&aacute;ch</p>\n" +
                    "<p>ELUX xin th&ocirc;ng b&aacute;o t&igrave;nh trạng thương lượng gi&aacute; của qu&yacute; kh&aacute;ch như sau</p>\n" +
                    "<ul>\n" +
                    "<li>M&atilde; thương lượng: <strong>" + dealHistory.getId() + "</strong></li>\n" +
                    "<li>M&atilde; h&oacute;a đơn: <strong>" + dealHistory.getOrderId() + "</strong></li>\n" +
                    "<li>Trạng th&aacute;i: <span style=\"color: #ff0000;\"><strong>đ&atilde; hủy</strong></span></li>\n" +
                    "</ul>\n" +
                    "<p>Qu&yacute; kh&aacute;ch vui l&ograve;ng truy cập website để biết th&ecirc;m chi tiết, xin ch&acirc;n th&agrave;nh cảm ơn.</p>";

            mailService.sendMail("ELUX", userMail, "Thương lượng", msgBody);
        }

        return "redirect:/supervisor/deal";
    }
}