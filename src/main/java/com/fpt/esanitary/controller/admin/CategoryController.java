package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.entities.Category;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

  @Autowired
  private CategoryService categoryService;

  @Autowired
  private ProductService productService;

  @GetMapping
  public String getAllCategory(Model model, HttpServletRequest request){
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
                               @RequestParam(value = "parentId", required = false) Integer parentId,
                               Model model) {
    Category extCat = categoryService.findByName(category.getName());
    if (extCat == null) {
      categoryService.create(category);
      return "redirect:/admin/category";
    } else {
      model.addAttribute("catExist", "Tên nhóm sản phẩm bị trùng, vui lòng nhập lại");
      return "admin/category/create";
    }
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
  public String updateCategory(@ModelAttribute("category") Category category) {
    categoryService.update(category);
    return "redirect:/admin/category";
  }

  @GetMapping("delete")
  public String deleteCategory(@RequestParam("id") Integer id, RedirectAttributes redirectAttributes) {
    if (categoryService.findByParentId(id).size() == 0 && productService.findByCategory(id).size() == 0) {
      categoryService.delete(id);
      redirectAttributes.addFlashAttribute("result", "Đã xóa thành công");
    } else if (categoryService.findByParentId(id).size() != 0){
      redirectAttributes.addFlashAttribute("result", "Danh mục có chứa danh mục con, không thể xóa.");
    } else if (productService.findByCategory(id).size() != 0){
      redirectAttributes.addFlashAttribute("result", "Danh mục có chứa sản phẩm, không thể xóa.");
    }
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
