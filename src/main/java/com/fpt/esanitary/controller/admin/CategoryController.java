package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Category;
import com.fpt.esanitary.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

  @Autowired
  private CategoryService categoryService;

  @GetMapping
  public String getAllAccount(Model model, HttpServletRequest request){
    PagedListHolder pagedListHolder = new PagedListHolder(categoryService.findAll());
    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
    pagedListHolder.setPage(page);
    pagedListHolder.setPageSize(10);
    model.addAttribute("pagedListHolder", pagedListHolder);
    model.addAttribute("parent", categoryService.getParent());
    return "category";
  }

  @GetMapping("/create")
  public String showFormCreate(Model model) {
    model.addAttribute("category", new Category());
    model.addAttribute("parents", categoryService.getParent());
    return "category-create";
  }

  @PostMapping("/create")
  public String createCategory(@ModelAttribute("category") Category category,
                               @RequestParam(value = "parentId", required = false) Integer parentId) {
    categoryService.create(category);
    return "redirect:/category";
  }




  @RequestMapping("/search")
  public String searchCategory(@RequestParam(value = "q", required=false) String keyword, Model model) {
    if (keyword != null) {
      List<Category> catSearchResult = categoryService.search(keyword);
      if (catSearchResult.isEmpty()) {
        model.addAttribute("notFound", "Sorry! Your search " + keyword + " did not match any results");
      }
      model.addAttribute("catSearchResult", catSearchResult);
    }
    return "category-search";
  }
}
