package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.Item;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("cart")
public class CartController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showCart(HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        session.setAttribute("cart", cart);
        return "user/cart";
    }

    @GetMapping("buy")
    public String buy(@RequestParam("id") String id, HttpSession session) {
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            cart.add(new Item(productService.findById(id), 1));
            session.setAttribute("cart", cart);
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExits(id, session);
            if (index == -1) {
                cart.add(new Item(productService.findById(id), 1));
            } else {
                int quantity = cart.get(index).getQuantity();
                int inStock = cart.get(index).getProduct().getUnitInStock();
                if (quantity >= inStock) {
                    quantity = inStock;
                } else {
                    quantity++;
                }
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        return "user/cart";
    }

    private int isExits(String id, HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId().equals(id)) {
                return i;
            }
        }
        return -1;
    }
}
