package com.fpt.esanitary.controller.admin;

import com.fpt.esanitary.entities.ProductImage;
import com.fpt.esanitary.service.ProductImageService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
@RequestMapping("productImage")
public class ProductImageController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductImageService productImageService;

    @GetMapping()
    public String getAllProductImage(Model model) {
        model.addAttribute("images", productImageService.findAll());
        return "product-image";
    }

    @GetMapping("upload")
    public String showFormUploadImage(Model model) {
        model.addAttribute("proImage", new ProductImage());
        return "image-upload";
    }

    @PostMapping("upload")
    public String uploadImage(@RequestParam("file") CommonsMultipartFile file,
                              HttpServletRequest request,
                              Model model) {
        for (ProductImage pi : productImageService.findAll()) {
            if (pi.getUrl().equals(file.getOriginalFilename())) {
                System.out.println("File existed");
                model.addAttribute("result", " File existed");
                return "image-upload";
            }
        }
        String nameFile = file.getOriginalFilename();
        System.out.println(nameFile);
        if (!"".equals(nameFile)) {
            String dirFile = request.getServletContext().getRealPath("WEB-INF/resources/img/products/");
            System.out.println(dirFile);
            File fileDir = new File(dirFile);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            try {
                file.transferTo(new File(fileDir + File.separator + nameFile));
                System.out.println("Upload file thành công!");
                model.addAttribute("filename", nameFile);
                model.addAttribute("result", "Upload sucessful");
            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println("Upload file thất bại!");
            }
        }
        ProductImage productImage = new ProductImage();
        productImage.setProductId("VI-VI88");
        productImage.setUrl(nameFile);
        productImage.setMainPhoto(false);
        productImageService.add(productImage);
        return "image-upload";
    }
}
