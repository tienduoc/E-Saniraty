package com.fpt.esanitary.controller.user.proposal;

import com.fpt.esanitary.entities.Product;
import com.fpt.esanitary.service.CategoryService;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
@RequestMapping("getProposal")
public class ProposalController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String showPageProposal() {
        return "user/getProposal";
    }

    @PostMapping("/result")
    public String getProposal(@RequestParam("maxCost") Double maxCost,
                              @RequestParam(value = "cat", required = false) int[] selectedCategories,
                              @RequestParam(value = "quantity", required = false) int[] quantity,
                              Model model,
                              ModelMap modelMap) {
        try {
            final int[] arrDomain = selectedCategories; // N biến, N domain (id of categories)
            int i, j = 0;
            Element<Product> el;

            // Thiết lập 10 domain, mỗi domain có 10 phần tử
            Domain[] D = new Domain[arrDomain.length];
            for (i = 0; i < arrDomain.length; i++) {
                D[i] = new Domain();
            }

            int numEmptyDomain = 0;
            for (j = 0; j < arrDomain.length; j++) {
                List<Product> products = productService.findByCategory(arrDomain[j]);
                if (products.size() == 0) numEmptyDomain++;

                for (int k = 0; k < products.size(); k++) {
                    el = new Element<>();
                    el.setValue(products.get(k));
                    el.setCost(products.get(k).getSalePrice());
                        D[j].add(el);
                }
            }

            if (numEmptyDomain == arrDomain.length) {
                model.addAttribute("noSolution", "Không tìm thấy");
                return "user/getProposal";
            }

            int totalDomain = 0;
            for (int k = 0; k < quantity.length; k++) {
                totalDomain += quantity[k];
            }

            // Thiết lập 10 biến ứng với 10 domain
            int index = 0;
            Variable[] vars = new Variable[totalDomain];
            for (i = 0; i < arrDomain.length; i++) {
                for (int k = 0; k < quantity[i]; k++) {
                    vars[index] = new Variable();
                    vars[index].setDomain(D[i]);
                    index++;
                }
            }

            // Thiết lập bài toán
            Problem_Min prob = new Problem_Min();
            for (i = 0; i < totalDomain; i++) {
                prob.add(vars[i]);
            }
            prob.setMaxCost(maxCost);

            // Giải bái toán
            Solver_Bactrack solver = new Solver_Bactrack(prob);
//       solver.backtrack();
            solver.backtrack(6000);

            // xuất kết quả
            if (solver.isMayBeSolved() == false) {
                model.addAttribute("noSolution", "Không tìm thấy gợi ý phù hợp với số tiền đưa ra");
            } else {
                List<Solution> solutions = solver.getSoluList();
                Collections.shuffle(solutions);
                if (solutions.size() > 10) {
                    model.addAttribute("solutionList", solutions.subList(0, 10));
                } else if (solutions.size() == 0) {
                    model.addAttribute("noSolution", "Không tìm thấy gợi ý phù hợp với số tiền đưa ra");
                } else  {
                    model.addAttribute("solutionList", solutions);
                }
            }

            Map<String, Integer> catQty = new TreeMap<>();
            for (int k = 0; k < selectedCategories.length; k++) {
                if (selectedCategories[k] != 0) {
                    catQty.put(categoryService.find(selectedCategories[k]).getName(), quantity[k]);
                }
            }
            modelMap.put("catQty", catQty);
            model.addAttribute("maxCost", maxCost);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "user/getProposal";
    }
}
