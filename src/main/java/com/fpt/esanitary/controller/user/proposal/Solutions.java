/* set of solutions
*/
package com.fpt.esanitary.controller.user.proposal;
import java.util.ArrayList;
import java.util.Collections;

public class Solutions extends ArrayList<Solution> {
   public void sort(){
       Collections.sort(this);
   }  

    @Override
    public String toString() {
        String S=  "Solutions{\n" ;
        for (int i=0; i< this.size(); i++){
          S += "solution " + (i+1) + ": " + this.get(i).toString() + "\n";
        }
        return S + "}\n";
    }
   
}
