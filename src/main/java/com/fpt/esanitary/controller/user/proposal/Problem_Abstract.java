/* Abstract class for a constraint problem
Problem = set of variable + set of constraints + objective function
Process will minimize objective function
*/
package com.fpt.esanitary.controller.user.proposal;
import java.util.ArrayList;

// It is a subclass of array of variable
public abstract class Problem_Abstract extends ArrayList<Variable>  {
    double cost=Double.POSITIVE_INFINITY; // cost of the solution
    // Get the cost of the current solution 
    public double getCost() {
        return cost;
    }

    // set value to the variable at the position index
    public void setValue (int index, Element value){
        this.get(index).setValue(value);
    }

    // Get a solution od the problem
    public ArrayList<Element> getSolution(){
        ArrayList<Element> values= new ArrayList<>();
        cost=0;
        for (int i=0; i<this.size(); i++){
            Variable var = this.get(i);
            Element value = var.getValue();
            cost += value.cost;
            values.add(value);
        }
        return values;
    }
    // Computing cost to the variable at the position i (from var[0] to var[i])
    public abstract double computeCost(int i);
    // Computing cost of a solution (for all variables)
    public abstract double computeCost();  

}
