package com.fpt.esanitary.controller.user;

import com.fpt.esanitary.entities.Item;
import com.fpt.esanitary.entities.Order;
import com.fpt.esanitary.entities.OrderDetail;
import com.fpt.esanitary.service.AccountService;
import com.fpt.esanitary.service.OrderDetailService;
import com.fpt.esanitary.service.OrderService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("cart")
public class CartController {

    @Autowired
    private ProductService productService;

    @Autowired
    private AccountService accountService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @GetMapping
    public String showCart(HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        session.setAttribute("cart", cart);
        return "user/cart";
    }

    @GetMapping(value = "add")
    public String addToCart(@RequestParam("id") String id, HttpSession session) {
        if (session.getAttribute("cart") == null) {
            List<Item> cart = new ArrayList<Item>();
            cart.add(new Item(productService.findById(id), 1));
            session.setAttribute("cart", cart);
            return "redirect:/cart";
        } else {
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            int index = isExits(id, session);
            if (index == -1) {
                cart.add(new Item(productService.findById(id), 1));
            } else {
                int quantity = cart.get(index).getQuantity();
                quantity++;
                cart.get(index).setQuantity(quantity);
            }
            session.setAttribute("cart", cart);
        }
        return "redirect:/cart";
    }

    @PostMapping("update")
    public String updateCart(@RequestParam String[] quantity,
                             HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        for (int i = 0; i < cart.size(); i++) {
            cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
        }
        session.setAttribute("cart", cart);
        return "redirect:/cart";
    }

    @GetMapping("remove")
    public String removeItemInCart(@RequestParam String id, HttpSession session, Model model) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        int index = isExits(id, session);
        if (id.equals(cart.get(index).getProduct().getId())) {
            cart.remove(index);
            if (cart.size() > 1) {
                session.setAttribute("cart", cart);

            } else {
                session.removeAttribute("cart");
                model.addAttribute("msg", "Giở hàng trống");
            }
        }
        return "redirect:/cart";
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

    @PostMapping("buy")
    public String buy(@RequestParam Double totalPrice,
                      HttpSession session,
                      Model model,
                      RedirectAttributes redirectAttributes) {
        String acc = null;
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            acc = userDetail.getUsername(); // Lấy tên username
        }
        if (acc == null) {
            return "user/login";
        } else if (session.getAttribute("cart") == null) {
            model.addAttribute("msg", "Giỏ hàng trống");
            return "user/cart";
        } else {
            Order order = new Order();
            Calendar cal = Calendar.getInstance();
            final String orderId = "TS" + "-" +
                    cal.get(Calendar.DAY_OF_MONTH) +
                    cal.get(Calendar.MONTH) +
                    cal.get(Calendar.YEAR) +
                    "-" + UUID.randomUUID().toString().substring(0, 7).toUpperCase(); // Tạo mã ID cho Order
            order.setId(orderId);
            order.setDate(new Date());
            order.setUsername(accountService.find(acc).getUsername());
            order.setClosed(false);
            order.setTotalPrice(totalPrice);
            orderService.save(order); // Lưu

            // Duyệt từng sản phẩm thêm vào Order detail
            List<Item> cart = (List<Item>) session.getAttribute("cart");
            for (int i = 0; i < cart.size(); i++) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrderId(orderId);
                orderDetail.setProductId(cart.get(i).getProduct().getId());
                orderDetail.setUnitPrice(cart.get(i).getProduct().getSalePrice());
                orderDetail.setQuantity(cart.get(i).getQuantity());
                orderDetailService.save(orderDetail); // Lưu

//                Product product = productService.findById(cart.get(i).getProduct().getId()); // Tìm sản phẩm
//                product.setUnitInStock(cart.get(i).getProduct().getUnitInStock() - cart.get(i).getQuantity()); // Lấy UnitInStock - số lượng đã bỏ vào giỏ
//                productService.update(product); // Cập nhật
            }
            session.removeAttribute("cart"); // Xóa đối tượng cart trong session sau khi order, vô giỏ hàng sẽ trống trơn
            redirectAttributes.addFlashAttribute("orderId", orderId);
            return "redirect:/thanks";
        }
    }
}
