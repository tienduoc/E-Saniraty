package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ManufacturerService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("userProductController")
@RequestMapping("product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ManufacturerService manufacturerService;

    @GetMapping("detail")
    public String getProductDetail(@RequestParam("id") String id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "user/detail";
    }
}
