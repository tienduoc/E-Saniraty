package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Manufacturer;
import com.fpt.esanitary.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("admin/manufacturer")
public class ManufacturerController {

    @Autowired
    ManufacturerService manufacturerService;

    @GetMapping
    public String getAllManufacturer (Model model) {

        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/manufacturer/index";

    }

    @GetMapping("create")
    public String showFormCreateManufacturer(Model model){
        model.addAttribute("manufacturer", new Manufacturer());
        return "admin/manufacturer/create";
    }

    @PostMapping("create")
    public String createManufacturer(@ModelAttribute("manufacturer") Manufacturer manufacturer, Model model) {

        Manufacturer existedManufacturer = manufacturerService.find(manufacturer.getId());

        if (existedManufacturer == null) {
            manufacturerService.create(manufacturer);
            return "redirect:/admin/manufacturer";
        } else {
        //todo hiển thị trùng id
            System.out.println("trung");
            model.addAttribute("manExisted", "Trùng mã nhà sản xuất.");
            return "admin/manufacturer/create";
        }
    }

    @GetMapping("detail")
    public String showManufacturerDetail (@RequestParam("id") String id, Model model) {

        model.addAttribute("manufacturer", manufacturerService.find(id));
        return "admin/manufacturer/detail";

    }

}
