/* A solution is a set of values assigned to problem's variables
 */
package com.fpt.esanitary.controller.user.proposal;

import java.math.BigDecimal;
import java.util.ArrayList;

public class Solution implements Comparable {
    ArrayList<Element> values;

    public ArrayList<Element> getValues() {
        return values;
    }

    public double getEvaluatedValue() {
        return evaluatedValue;
    }

    public Solution() {
        values = new ArrayList<Element>();
    }

    double evaluatedValue; // chất lượng lời giải

    public Solution(double val, ArrayList<Element> values) {
        evaluatedValue = val;
        this.values = values;
    }

    @Override
    // So sánh: chi phí thấp ở trên
    public int compareTo(Object o) {
        if (evaluatedValue - ((Solution) o).evaluatedValue <= 0) return 0;
        return 1;
    }

    @Override
    public String toString() {
        BigDecimal bigDecimal = new BigDecimal(evaluatedValue);
        return "values=" + values + ", cost=" + bigDecimal.toString();
    }

}
