package com.fpt.esanitary.controller.supervisor;

import com.fpt.esanitary.entities.DealHistory;
import com.fpt.esanitary.entities.DealHistoryDetail;
import com.fpt.esanitary.entities.DealMessage;
import com.fpt.esanitary.service.DealHistoryDetailService;
import com.fpt.esanitary.service.DealHistoryService;
import com.fpt.esanitary.service.DealMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

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

    @InitBinder
    public void initBinder(final WebDataBinder binder){
        final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping
    public String getAllDeal(Model model) {
        model.addAttribute("deals", dealHistoryService.findAll());
        return "supervisor/deal/index";
    }

    @GetMapping("update")
    public String showUpdateDealForm(@RequestParam String dealHistoryId, Model model) {
        model.addAttribute("deal", dealHistoryService.findById(dealHistoryId));
        return "supervisor/deal/update";
    }

    @PostMapping("update")
    public String updateDeal(@RequestParam String[] newPrice,
                             @RequestParam("message") String message,
                             @ModelAttribute("deal") DealHistory dealHistory) {

        final String username = SecurityContextHolder.getContext().getAuthentication().getName();

        List<DealHistoryDetail> dealHistoryDetails = dealHistoryDetailService.findByDealHistoryId(dealHistory.getId());
        for (int i = 0; i < dealHistoryDetails.size(); i++) {
            boolean checkNewPrice = newPrice[i].matches("\\d+");
            if (checkNewPrice) {
                dealHistoryDetails.get(i).setNewPrice(Double.parseDouble(newPrice[i]));
            } else {
                double buyerPrice = dealHistoryDetails.get(i).getNewPrice();
                dealHistoryDetails.get(i).setNewPrice(buyerPrice);
            }
            dealHistoryDetailService.update(dealHistoryDetails.get(i));
        }
        dealHistory.setResponseDate(new Date());
        dealHistory.setContructorApprove(false);
        dealHistory.setBossApprove(true);
        dealHistoryService.update(dealHistory);

        if (!message.isEmpty()) {
            DealMessage dealMessage = new DealMessage();
            dealMessage.setDealHistoryId(dealHistory.getId());
            dealMessage.setTime(new Date());
            dealMessage.setSender(username);
            dealMessage.setMessage(message);
            dealMessageService.save(dealMessage);
        }

        return "redirect:/supervisor/deal";
    }

//    @GetMapping("cancel")
//    public String cancelDeal(@RequestParam String dealHistoryId,
//                             @ModelAttribute("message")DealMessage dealMessage)
}
