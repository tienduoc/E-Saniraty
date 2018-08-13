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
import java.util.List;

@Controller
@RequestMapping("/admin/image")
public class ProductImageController {

    @Autowired
    private ProductService productService;

    @Autowired
    private ProductImageService productImageService;

    @GetMapping
    public String getAllProductImage(Model model) {
        model.addAttribute("images", productImageService.findAll());
        return "admin/image/index";
    }

    @GetMapping("upload")
    public String showFormUploadImage(Model model) {
        model.addAttribute("proImage", new ProductImage());
        model.addAttribute("products", productService.findAll());
        return "admin/image/upload";
    }

    @PostMapping("upload")
    public String uploadImage(@RequestParam("productId") String productId,
                              @RequestParam("file") CommonsMultipartFile file,
                              HttpServletRequest request,
                              Model model) {
        String nameFile = file.getOriginalFilename();
        // Check if filename already in the database then return
        for (ProductImage pi : productImageService.findAll()) {
            if (pi.getUrl().equals(nameFile)) {
                System.out.println("File existed");
                model.addAttribute("result", "<a style=\"color: #ff0000\">Hình đã tồn tại</a>");
                model.addAttribute("products", productService.findAll());
                return "/admin/image/upload";
            }
        }
        // Get path for upload, if not exists then make directory
        if (!"".equals(nameFile)) {
            String dirFile = request.getServletContext().getRealPath("WEB-INF/assets/img/products/");
            File fileDir = new File(dirFile);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }
            // After check file & directory, do upload image
            try {
                file.transferTo(new File(fileDir + File.separator + nameFile));
                ProductImage productImage = new ProductImage();
                productImage.setProductId(productId);
                productImage.setUrl(nameFile);
                productImage.setMainPhoto(false);
                productImageService.add(productImage);
                model.addAttribute("result", "<a style=\"color: #4CAF50\">Tải lên thành công</a>");
                model.addAttribute("products", productService.findAll());
            } catch (Exception e) {
                System.out.println(e.getMessage());
                System.out.println("<a style=\"color: #e60000\">Tải lên thất bại</a>");
                model.addAttribute("products", productService.findAll());
            }
        }
        return "/admin/image/upload";
    }

    @GetMapping("update")
    public String showUpdateImage(@RequestParam("img_url") String url, Model model) {
        model.addAttribute("image", productImageService.findByUrl(url));
        return "admin/image/update";
    }

    @GetMapping("setMainPhoto")
    public String setMainPhoto(@RequestParam("img_url") String url, @RequestParam("product_id") String id) {
        List<ProductImage> productImages = productImageService.findByProduct(id);
        for (int i = 0; i < productImages.size(); i++) {
            if (productImages.get(i).getUrl().equals(url)) {
                productImages.get(i).setMainPhoto(true);
                productImageService.update(productImages.get(i));
            } else {
                productImages.get(i).setMainPhoto(false);
                productImageService.update(productImages.get(i));
            }
        }
        return "redirect:/admin/image";
    }
}