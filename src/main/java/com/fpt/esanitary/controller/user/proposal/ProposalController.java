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
@RequestMapping("cp")
public class ProposalController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String getProposal(@RequestParam("maxCost") Double maxCost,
                              @RequestParam("numOfSol") Integer N,
                              Model model) {

       final int[] arrDomain = {31,32,33}; // N biến, N domain (id of categories)
       int i, j = 0;
//       MyElement<Product> el;
        Element<Product> el;

       // Thiết lập 10 domain, mỗi domain có 10 phần tử
       Domain[] D = new Domain[arrDomain.length];
       for (i = 0; i < arrDomain.length; i++) {
           D[i] = new Domain();
       }

        for (j = 0; j < arrDomain.length; j++) {
            List<Product> products = productService.findByCategory(arrDomain[j]);
            Collections.shuffle(products);
//            products.sort(new Comparator<Product>() {
//                @Override
//                public int compare(Product o1, Product o2) {
//                    return Double.compare(o1.getSalePrice(), o2.getSalePrice());
//                }
//            });

            for (int k = 0; k < products.size(); k++) {
                el = new Element<>();
                el.setValue(products.get(k));
                el.setCost(products.get(k).getSalePrice());
                for (i = 0; i < arrDomain.length; i++) {
                    D[i].add(el);
                }
            }
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
       solver.backtrack(N);

       // xuất kết quả
       if (solver.isMayBeSolved() == false) {
           System.out.println ("the problem has no solution!\n");
           model.addAttribute("noSolution", "Không tìm thấy gợi ý phù hợp với số tiền đưa ra");
       } else {
           System.out.println(solver.getSoluList());
           model.addAttribute("solutionList", solver.getSoluList());
       }
       return "user/proposal";
   }
}
