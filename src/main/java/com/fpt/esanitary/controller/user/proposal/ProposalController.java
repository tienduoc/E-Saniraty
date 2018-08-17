package com.fpt.esanitary.controller.user.proposal;

import com.fpt.esanitary.entities.Product;
import com.fpt.esanitary.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("getProposal")
public class ProposalController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showPageProposal() {
        return "user/getProposal";
    }

    @GetMapping("/result")
    public String getProposal(@RequestParam("maxCost") Double maxCost,
                              @RequestParam("cat") int[] selectedCategories,
                              Model model) {


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
            Collections.shuffle(products);

            for (int k = 0; k < products.size(); k++) {
                el = new Element<>();
                el.setValue(products.get(k));
                el.setCost(products.get(k).getSalePrice());
                for (i = 0; i < arrDomain.length; i++) {
                    D[i].add(el);
                }
            }
        }

        if (numEmptyDomain == arrDomain.length) {
            model.addAttribute("noSolution", "Không tìm thấy");
            return "user/getProposal";
        }

        // Thiết lập 10 biến ứng với 10 domain
        Variable[] vars = new Variable[arrDomain.length];
        for (i = 0; i < arrDomain.length; i++) {
            vars[i] = new Variable();
            vars[i].setDomain(D[i]);
        }

        // Thiết lập bài toán
        Problem_Min prob = new Problem_Min();
        for (i = 0; i < arrDomain.length; i++) {
            prob.add(vars[i]);
        }

        prob.setMaxCost(maxCost);

        // Giải bái toán
        Solver_Bactrack solver = new Solver_Bactrack(prob);
//       solver.backtrack();
        solver.backtrack(1500);

        // xuất kết quả
        if (solver.isMayBeSolved() == false) {
            model.addAttribute("noSolution", "Không tìm thấy gợi ý phù hợp với số tiền đưa ra");
        } else {
            List<Solution> solutions = solver.getSoluList();
            Collections.shuffle(solutions);
            if (solutions.size() > 10) {
                model.addAttribute("solutionList", solutions.subList(0, 10));
            } else {
                model.addAttribute("solutionList", solutions);
            }
        }
        return "user/getProposal";
    }
}
