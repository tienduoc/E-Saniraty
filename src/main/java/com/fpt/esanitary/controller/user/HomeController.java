package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ProductImageService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

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
    public String showHome(Model model, HttpSession session) {
        model.addAttribute("title1", categoryService.find(29).getName());
        model.addAttribute("title2", categoryService.find(33).getName());
        model.addAttribute("title3", categoryService.find(44).getName());
        model.addAttribute("title4", categoryService.find(61).getName());
        model.addAttribute("listProduct1", productService.getLastestByCategory(30, 12));
        model.addAttribute("listProduct2", productService.getLastestByCategory(33, 8));
        model.addAttribute("listProduct3", productService.getLastestByCategory(46, 8));
        model.addAttribute("listProduct4", productService.getLastestByCategory(64, 8));
        return "user/index";
    }

    @GetMapping("/category")
    public String showCategory(@RequestParam("id") Integer id, Model model) {
        model.addAttribute("products", productService.findByCategory(id));
        return "user/category";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "user/login";
    }

    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("account", new Account());
        return "user/register";
    }

    @PostMapping("/register")
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
            return "redirect:/register/success";
        } else {
            model.addAttribute("accExist", "Tài khoản bạn chọn đã được sử dụng, vui lòng chọn tài khoản khác.");
            return "user/register";
        }
    }

    @GetMapping("/register/success")
    public String showRegisterSuccess() {
        return "user/registerSuccess";
    }
}