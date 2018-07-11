package com.fpt.esanitary.controller;

import com.fpt.esanitary.entities.Role;
import com.fpt.esanitary.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class BaseController {

    @Autowired
    private RoleService roleService;

    @GetMapping("/403")
    public String showAccessDenied() {
        return "403";
    }



    @GetMapping("/role")
    public String getRoles(Model model) {
        List<Role> listRole = roleService.findAll();
        model.addAttribute("roles", listRole);
        return "role";
    }

}
