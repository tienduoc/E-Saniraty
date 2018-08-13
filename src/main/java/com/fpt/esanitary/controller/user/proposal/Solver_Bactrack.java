/* Class for a solver - Lớp mô tả cho bộ giải
 * @author SuTV
* To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fpt.esanitary.controller.user.proposal;

import java.util.Collections;

public class Solver_Bactrack {
    boolean mayBeSolved = true;
    Problem_Min prob;
    Solutions soluList;
    public Solver_Bactrack(Problem_Min prob){
        this.prob = prob;
        soluList = new Solutions();
        checkMaySolve();
    }
    // Solve a problem using backtrcaking to minnimize objective function
    private void backtrack(int i, double curCost){
        Variable v = prob.get(i);
        Domain D = v.getDomain();

        for (Element el: D){
            double costOfEl  = el.cost;
            if (el.valid(curCost, prob.maxCost)){ // nếu trị có thể gán vào biến
                prob.get(i).setValue(el); // gán trị vào biến
                if (i==prob.size()-1){ // đã gán xong mọi biến -> có 1 lời giải
                    // lấy lời giải
                    Solution solu = new Solution();
                    solu.values = prob.getSolution();
                    solu.evaluatedValue = prob.getCost();
                    soluList.add(solu);
                }
                else { // try to assign value to the next variable
                    backtrack(i+1, curCost + costOfEl) ;
                }
            }
        }
    }
    //Dùng backtracking để lấy lời giải
    public boolean backtrack(){
        if (mayBeSolved==false) return false;
        soluList.clear();
        double curCost = 0; // khởi tạo chi phí ban đầu
        int index=0;
        backtrack(index, curCost); // giải từ biến đầu tiên, index=0
        return soluList.size()>0;
    }
    // Solve a problem using backtrcaking to minnimize objective function
    private void backtrack(int i, double curCost, int N){
        Variable v = prob.get(i);
        Domain D = v.getDomain();
        for (Element el : D){
            double costOfEl  = el.cost;
            if (el.valid(curCost, prob.maxCost)){ // nếu trị có thể gán vào biến
                prob.get(i).setValue(el); // gán trị vào biến
                if (i==prob.size()-1){ // đã gán xong mọi biến -> có 1 lời giải
                    // lấy lời giải
                    Solution solu = new Solution();
                    solu.values = prob.getSolution();
                    solu.evaluatedValue = prob.getCost();
                    if (soluList.size() >= N) {
                        return;
                    }
                    soluList.add(solu);
                }
                else { // try to assign value to the next variable
                    backtrack(i+1, curCost + costOfEl, N) ;
                }
            }
        }
    }

    //Dùng backtracking để lấy N lời giải
    public boolean backtrack(int N){
        if (mayBeSolved==false) return false;
        soluList.clear();
        double curCost = 0; // khởi tạo chi phí ban đầu
        int index=0;
        if(soluList.size()<N) {
            backtrack(index, curCost, N); // giải từ biến đầu tiên, index=0
        }
        return soluList.size()>0;
    }
    // Checking whether the problem may be solved?
    private boolean checkMaySolve(){
        double cost = 0;
        // tính tổng chi phí các phần từ trong các domain có chi phí thấp nhất
        for (Variable var: prob){
            cost += var.getDomain().get(0).cost;
        }
//        mayBeSolved = cost <= prob.maxCost;
        return mayBeSolved;
    }

    public boolean isMayBeSolved() {
        return mayBeSolved;
    }

    public Problem_Min getProb() {
        return prob;
    }

    public void setProb(Problem_Min prob) {
        this.prob = prob;
    }

    public Solutions getSoluList() {
//        soluList.sort(new Comparator<Solution>() {
//            @Override
//            public int compare(Solution o1, Solution o2) {
//                return Double.compare(o1.evaluatedValue, o2.evaluatedValue);
//            }
//        });
        Collections.shuffle(soluList);
        return soluList;
    }

    public void setSoluList(Solutions soluList) {
        this.soluList = soluList;
    }

}