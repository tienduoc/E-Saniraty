package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.entities.Category;
import com.fpt.esanitary.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

  @Autowired
  private CategoryService categoryService;

  @GetMapping
  public String getAllAccount(Model model, HttpServletRequest request){
    model.addAttribute("categories", categoryService.findAll());
    return "admin/category/index";
  }

  @GetMapping("/create")
  public String showFormCreate(Model model) {
    model.addAttribute("category", new Category());
    model.addAttribute("allCategory", categoryService.findAll());
    return "admin/category/create";
  }

  @PostMapping("/create")
  public String createCategory(@ModelAttribute("category") Category category,
                               @RequestParam(value = "parentId", required = false) Integer parentId) {
    categoryService.create(category);
    return "redirect:/admin/category";
  }

  @GetMapping("detail")
  public String showAccountDetail(@RequestParam("id") Integer id, Model model) {
    model.addAttribute("category", categoryService.find(id));
    return "admin/category/detail";
  }

  @GetMapping("update")
  public String showFormUpdate(@RequestParam("id") Integer id, Model model) {
    model.addAttribute("category", categoryService.find(id));
    model.addAttribute("allCategory", categoryService.findAll());
    return "admin/category/update";
  }

  @PostMapping("update")
  public String updateAccount(@ModelAttribute("category") Category category) {
    categoryService.update(category);
    return "redirect:/admin/category";
  }

  @PostMapping("/search")
  public String searchCategory(@RequestParam(value = "q", required=false) String keyword, Model model, HttpServletRequest request) {
    if (keyword != null) {
      PagedListHolder pagedListHolder = new PagedListHolder(categoryService.search(keyword));
      int page = ServletRequestUtils.getIntParameter(request, "p", 0);
      pagedListHolder.setPage(page);
      pagedListHolder.setPageSize(10);
      model.addAttribute("pagedListHolder", pagedListHolder);
      if (pagedListHolder.getPageSize() == 0) {
        model.addAttribute("notFound", "Sorry! Your search " + keyword + " did not match any results");
      }
    }
    return "admin/category/category";
  }
}
