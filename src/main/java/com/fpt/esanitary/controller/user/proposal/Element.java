/* Lớp mô tả cho phần tử trong domain
 * @author SuTV
 */
package com.fpt.esanitary.controller.user.proposal;

public class Element<E> implements Comparable {
    E value; // value of the element ===> Object product
    double cost; // cost when it is used to assign to a variable
    // Checking whether it can be used to assign a variable
    public boolean valid(double currentCost, double maxCost){
        return cost + currentCost <= maxCost;
    }

    @Override
    // giúp sắp xếp các phần tử theo cost tăng dần
    public int compareTo(Object o) {
       return cost-((Element)o).cost<=0? 0: 1;
    }

    public E getValue() {
        return value;
    }

    public void setValue(E value) {
        this.value = value;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    @Override
    public String toString() {
        return "" +value;
    }
    
}
