package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("admin/account")
public class AccountController {

  @Autowired
  private AccountService accountService;

  @Autowired
  private RoleService roleService;

  @Autowired
  private PasswordEncoder passwordEncoder;

//  @GetMapping("forBoss")
//  public String getAccountsForBoss(Model model, HttpServletRequest request){
//    PagedListHolder pagedListHolder = new PagedListHolder(accountService.findAll());
//    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//    pagedListHolder.setPage(page);
//    pagedListHolder.setPageSize(10);
//    model.addAttribute("pagedListHolder", pagedListHolder);
//    return "admin/account/account";
//  }

//  @GetMapping
//  public String getAccountsForAdmin(Model model, HttpServletRequest request){
//    PagedListHolder pagedListHolder = new PagedListHolder(accountService.findAllCustomer());
//    int page = ServletRequestUtils.getIntParameter(request, "p", 0);
//    pagedListHolder.setPage(page);
//    pagedListHolder.setPageSize(10);
//    model.addAttribute("pagedListHolder", pagedListHolder);
//    return "admin/account/account";
//  }

  @GetMapping
  public String getAllAccount(Model model) {
      model.addAttribute("accounts", accountService.findAll());
      return "admin/account/index";
  }

  @GetMapping("create")
  public String showFormCreateAccount(Model model) {
    model.addAttribute("account", new Account());
    model.addAttribute("roles", roleService.findAll());
    return "admin/account/create";
  }

  @PostMapping("create")
  public String createAccount(@ModelAttribute("account") Account account) {
    account.setPassword(passwordEncoder.encode(account.getPassword()));
    accountService.create(account);
    return "redirect:/admin/account";
  }

  @GetMapping("detail")
  public String showAccountDetail(@RequestParam("username") String username, @ModelAttribute("roleId") String roleId, Model model) {
    model.addAttribute("account", accountService.find(username));
    model.addAttribute("role", roleService.find(roleId));
    return "admin/account/detail";
  }

  @GetMapping("update")
  public String showFormUpdate(@RequestParam("username") String username, Model model) {
    model.addAttribute("account", accountService.find(username));
    model.addAttribute("roles", roleService.findAll());
    return "admin/account/update";
  }

  @PostMapping("update")
  public String updateAccount(@ModelAttribute("account") Account account) {
    String extPassword = accountService.find(account.getUsername()).getPassword();
    account.setPassword(extPassword);
    accountService.update(account);
    return "redirect:/admin/account";
  }

  @RequestMapping("search")
  public String searchAccount(@RequestParam(value = "q", required=false) String keyword, Model model) {
    if (keyword != null) {
      List<Account> accSearchResult = accountService.search(keyword);
      if (accSearchResult.isEmpty()) {
        model.addAttribute("notFound", "Sorry! Your search " + keyword + " did not match any results");
      }
      model.addAttribute("accSearchResult", accSearchResult);
    }
    return "admin/account/account-search";
  }
}
