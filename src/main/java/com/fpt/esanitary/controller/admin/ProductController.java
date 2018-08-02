package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.Product;
import com.fpt.esanitary.entities.ProductImage;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ManufacturerService;
import com.fpt.esanitary.service.ProductImageService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller("adminProductController")
@RequestMapping("/admin/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ManufacturerService manufacturerService;

    @Autowired
    private ProductImageService productImageService;

    @GetMapping
    public String getAllProduct(Model model) {
        model.addAttribute("allProduct", productService.findAll());
        return "admin/product/index";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("images", new ProductImage());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/product/create";
    }

    @PostMapping("/create")
    public String createProduct(@ModelAttribute("product") Product product,
                                @RequestParam("file") MultipartFile[] files,
                                HttpServletRequest request,
                                Model model) {
        Product extPro = productService.findById(product.getId());
        if (extPro == null) {
            productService.create(product);
            String dirFile = request.getServletContext().getRealPath("WEB-INF/assets/img/products/");
            File fileDir = new File(dirFile);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            // Save file on system
            for (MultipartFile file : files) {
                String fileName = file.getOriginalFilename();
                if (!fileName.isEmpty()) {
                    try {
                        productImageService.findByUrl(fileName);
                        model.addAttribute("imgExisted", "Hinh " + file.getOriginalFilename() + " đã tồn tại");
                    } catch (Exception ex) {
                        try {
                            BufferedOutputStream outputStream = new BufferedOutputStream(
                                    new FileOutputStream(new File(dirFile, file.getOriginalFilename())));
                            outputStream.write(file.getBytes());
                            outputStream.flush();
                            outputStream.close();
                        } catch (IOException e) {
                            e.getMessage();
                        }
                        ProductImage productImage = new ProductImage();
                        productImage.setProductId(product.getId());
                        productImage.setUrl(file.getOriginalFilename());
                        productImage.setMainPhoto(false);
                        productImageService.add(productImage);
                    }
                } else {
                    model.addAttribute("msg", "Please select at least one file..");
                    return "upload";
                }
            }
            model.addAttribute("msg", "Multiple files uploaded successfully.");
            return "redirect:/admin/product";
        } else {
//            todo hiển thị MÃ sản phẩm đã tồn tại
            model.addAttribute("proIdExist", "Mã sản phẩm đã tồn tại, vui lòng nhập lại");
            return "admin/product/create";
        }
    }
    @GetMapping("update")
    public String showUpdateForm(@RequestParam("id") String id, Model model) {
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/product/update";
    }

    @PostMapping("update")
    public String saveUpdate(@ModelAttribute("product") Product product) {
        productService.update(product);
        return "redirect:/admin/product";
    }

    @GetMapping("detail")
    public String showProductDetail(@RequestParam("id") String id, Model model) {
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("manufacturers", manufacturerService.findAll());
        return "admin/product/detail";
    }
}