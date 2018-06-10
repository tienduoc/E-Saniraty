package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

  @Autowired
  private AccountService accountService;

  @RequestMapping("/search")
  public String searchAccount(@RequestParam(value = "keyword", required=false) String keyword, Model model) {
    if (keyword != null) {
      List<Account> accSearchResult = accountService.search(keyword);
      if (accSearchResult.isEmpty()) {
        model.addAttribute("emptyResult", "Sorry! Your search " + keyword + " did not match any results");
      }
      model.addAttribute("accSearchResult", accSearchResult);
    }
    return "account-search";
  }
}
