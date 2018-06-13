package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

  @Autowired
  private AccountService accountService;

  @Autowired
  private PasswordEncoder passwordEncoder;

  @GetMapping
  public String getAllAccount(Model model, HttpServletRequest request){
    PagedListHolder pagedListHolder = new PagedListHolder(accountService.findAll());
    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
    pagedListHolder.setPage(page);
    pagedListHolder.setPageSize(10);
    model.addAttribute("pagedListHolder", pagedListHolder);
    return "account";
  }

  @RequestMapping("/search")
  public String searchAccount(@RequestParam(value = "q", required=false) String keyword, Model model) {
    if (keyword != null) {
      List<Account> accSearchResult = accountService.search(keyword);
      if (accSearchResult.isEmpty()) {
        model.addAttribute("notFound", "Sorry! Your search " + keyword + " did not match any results");
      }
      model.addAttribute("accSearchResult", accSearchResult);
    }
    return "account-search";
  }
}
