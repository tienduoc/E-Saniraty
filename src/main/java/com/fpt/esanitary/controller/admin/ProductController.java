package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Product;
import com.fpt.esanitary.entities.ProductImage;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ManufacturerService;
import com.fpt.esanitary.service.ProductImageService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("product")
public class ProductController {

  @Autowired
  private ProductService productService;

  @Autowired
  private CategoryService categoryService;

  @Autowired
  private ManufacturerService manufacturerService;

  @GetMapping
  public String getAllProduct(Model model, HttpServletRequest request) {
    PagedListHolder pagedListHolder = new PagedListHolder(productService.findAll());
    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
    pagedListHolder.setPage(page);
    pagedListHolder.setPageSize(10);
    model.addAttribute("pagedListHolder", pagedListHolder);
    model.addAttribute("categories", categoryService.findAll());
    model.addAttribute("manufacturers", manufacturerService.findAll());
    return "product";
  }

  @GetMapping("create")
  public String showCreateForm(Model model) {
    model.addAttribute("product", new Product());
    model.addAttribute("images", new ProductImage());
    model.addAttribute("categories", categoryService.findAll());
    model.addAttribute("manufacturers", manufacturerService.findAll());
    return "product-create";
  }

  @PostMapping("create")
  public String createProduct(@ModelAttribute("product") Product product) {
    productService.create(product);
    return "redirect:/product";
  }

  @GetMapping("update")
  public String showUpdateForm(@RequestParam("id") String id, Model model) {
    model.addAttribute("product", productService.findById(id));
    model.addAttribute("categories", categoryService.findAll());
    model.addAttribute("manufacturers", manufacturerService.findAll());
    return "product-update";
  }

  @PostMapping("update")
  public String saveUpdate(@ModelAttribute("product") Product product) {
    productService.update(product);
    return "redirect:/product";
  }

  @GetMapping("detail")
  public String showProductDetail(@RequestParam("id") String id, Model model) {
    model.addAttribute("product", productService.findById(id));
    model.addAttribute("categories", categoryService.findAll());
    model.addAttribute("manufacturers", manufacturerService.findAll());
    return "product-detail";
  }
}
