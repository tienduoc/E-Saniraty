package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Article;
import com.fpt.esanitary.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("admin/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @GetMapping
    public String getAllAritcle(Model model) {
        model.addAttribute("articles", articleService.findAll());
        return "admin/hienthi";
    }

    @GetMapping("create")
    public String showFormCreateArticle(Model model) {
        model.addAttribute("article", new Article());
        return "admin/baiviet";
    }

    @PostMapping("create")
    public String createArticle(@RequestParam("aricleUrl") String content) {
        Article article = new Article();
        article.setDate(new Date());
        article.setTitle("demo");
        article.setAricleUrl(content);
        article.setManufacturerId("CS");
        articleService.create(article);
        return null;
    }
}
