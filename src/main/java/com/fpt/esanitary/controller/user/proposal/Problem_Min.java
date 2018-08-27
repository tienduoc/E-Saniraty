/* Class for a problem minimizing the objective function
Bài toán tối thiểu hóa hàm mục tiêu
*/
package com.fpt.esanitary.controller.user.proposal;
// It is a subclass of array of variable
public class Problem_Min extends Problem_Abstract {
    double maxCost; // trị lớn nhất của hàm mục tiêu

    public double getMaxCost() {
        return maxCost;
    }
    public void setMaxCost(double maxCost) {
        this.maxCost = maxCost;
    }

    @Override
    public double computeCost(int i) {
       double value = 0;
        for (int j=0; j <= i; j++) 
            value += this.get(j).getValue().cost;
        return value;
    }

    @Override
    public double computeCost() {
        double value =0;
        for (Variable v: this) 
            value += v.getValue().cost;
        return value;
    }
    

}
