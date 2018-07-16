package com.fpt.esanitary.controller;

import com.fpt.esanitary.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice(basePackages = {"com.fpt.esanitary.controller.user"} )
public class GlobalControllerAdvice {

    @Autowired
    private CategoryService categoryService;

    @ModelAttribute
    public void globalAttributes(Model model) {
        model.addAttribute("menu", categoryService.findAll());
    }
}
