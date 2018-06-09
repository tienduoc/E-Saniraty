package com.fpt.esanitary.controller;

import com.fpt.esanitary.entities.Account;
import com.fpt.esanitary.entities.Role;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class OneController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private RoleService roleService;

    @GetMapping("/403")
    public String showAccessDenied() {
        return "403";
    }

    @GetMapping("/account")
    public String getAllAccount(Model model){
        List<Account> listAcc = accountService.findAll();
        model.addAttribute("accounts", listAcc);
        return "account";
    }

    @GetMapping("/role")
    public String getRoles(Model model) {
        List<Role> listRole = roleService.findAll();
        model.addAttribute("roles", listRole);
        return "role";
    }

}
