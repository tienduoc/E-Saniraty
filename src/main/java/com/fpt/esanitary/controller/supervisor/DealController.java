package com.fpt.esanitary.controller.supervisor;

import com.fpt.esanitary.entities.DealHistory;
import com.fpt.esanitary.service.DealHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("supervisorDealController")
@RequestMapping("supervisor/deal")
public class DealController {

    @Autowired
    private DealHistoryService dealHistoryService;


    @GetMapping
    public String getAllDeal(Model model) {
        model.addAttribute("deals", dealHistoryService.findAll());
        return "supervisor/deal/index";
    }
}
