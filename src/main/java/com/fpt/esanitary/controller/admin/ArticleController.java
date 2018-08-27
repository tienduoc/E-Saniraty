package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Article;
import com.fpt.esanitary.service.ArticleService;
import com.fpt.esanitary.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping("admin/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ManufacturerService manufacturerService;

    @GetMapping
    public String getAllAritcle(Model model) {
        model.addAttribute("articles", articleService.findAll());
        return "admin/article/index";
    }

    @GetMapping("create")
    public String showFormCreateArticle(Model model) {
        model.addAttribute("article", new Article());
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/article/create";
    }

    @PostMapping("create")
    public String createArticle(@ModelAttribute("article") Article article) {
        article.setDate(new Date());
        article.setTitle(article.getTitle());
        article.setAricleUrl(article.getAricleUrl());
        article.setManufacturerId(article.getManufacturerId());
        articleService.create(article);
        return "redirect:/admin/article";
    }
}
