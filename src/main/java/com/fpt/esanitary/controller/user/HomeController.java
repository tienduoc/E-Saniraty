package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping("/")
    public String showHome(Model model) {
        model.addAttribute("allCategory", categoryService.findAll());
        model.addAttribute("title1", categoryService.find(29).getName());
        model.addAttribute("title2", categoryService.find(28).getName());
        model.addAttribute("title3", categoryService.find(44).getName());
        model.addAttribute("title4", categoryService.find(61).getName());
        model.addAttribute("listProduct1", productService.getLastestByCategory(32, 8));
        model.addAttribute("listProduct2", productService.getLastestByCategory(36, 8));
        model.addAttribute("listProduct3", productService.getLastestByCategory(46, 8));
        model.addAttribute("listProduct4", productService.getLastestByCategory(64, 8));
        return "index";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("account", new Account());
        return "register";
    }

    @PostMapping("/registerProcess")
    public String processRegister(Model model, @ModelAttribute("account") Account account) {
        Account extAcc = accountService.find(account.getUsername());
        if (extAcc == null) {
            account.setPassword(passwordEncoder.encode(account.getPassword()));
            account.setFullname(account.getFullname());
            account.setPhone(account.getPhone());
            account.setEmail(account.getEmail());
            account.setAddress(account.getAddress());
            account.setEnabled(true);
            account.setRoleId("CU");
            accountService.create(account);
            return "register-confirm";
        } else {
            model.addAttribute("accUsed", "This username has been used by order customer, please choose another username");
            return "register";
        }
    }
}
