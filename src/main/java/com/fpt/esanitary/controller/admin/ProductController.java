package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Product;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("product")
public class ProductController {

  @Autowired
  private ProductService productService;

  @Autowired
  private CategoryService categoryService;

  @Autowired


  @GetMapping
  public String getAllProduct(Model model, HttpServletRequest request) {
    PagedListHolder pagedListHolder = new PagedListHolder(productService.findAll());
    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
    pagedListHolder.setPage(page);
    pagedListHolder.setPageSize(10);
    model.addAttribute("pagedListHolder", pagedListHolder);
    return "product";
  }

  @GetMapping("/create")
  public String showFormCreate(Model model) {
    model.addAttribute("product", new Product());
    model.addAttribute("categories", categoryService.findAll());
    return "product-create";
  }
}
