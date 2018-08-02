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
  public String createAccount(@ModelAttribute("account") Account account, Model model) {
    Account extAcc = accountService.find(account.getUsername());
    if (extAcc == null) {
    account.setPassword(passwordEncoder.encode(account.getPassword()));
    accountService.create(account);
    return "redirect:/admin/account";
    } else {
//      todo hiển thị trùng tài khoản
      model.addAttribute("accExist", "Tài khoản bạn chọn đã được sử dụng, vui lòng chọn tài khoản khác.");
      return "admin/account/create";
    }
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
