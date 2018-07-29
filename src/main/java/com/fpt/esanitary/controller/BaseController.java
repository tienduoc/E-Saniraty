package com.fpt.esanitary.controller;

import com.fpt.esanitary.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("*")
    public void menu(Model model){
        model.addAttribute("menu", categoryService.findAll());
    }

    @GetMapping("/403")
    public String showAccessDenied() {
        return "user/403";
    }

    @GetMapping("/thanks")
    public String showThanksPage() {
        return "user/thanks";
    }

    @GetMapping("/test")
    public String testForm() {
        return "contractor/deal/create";
    }
}
