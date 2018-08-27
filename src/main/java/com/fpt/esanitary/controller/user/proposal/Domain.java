/* Class for a domain. 
   This class is an ArrayList to access each element using an integral index
 */
package com.fpt.esanitary.controller.user.proposal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Domain extends ArrayList<Element> {
    public Domain(){
        super();
    }
    public Domain(List<Element> collection){
        super();
        // sort tang dan ve cost
        Collections.sort(collection);
        this.addAll(collection);
    }

    
}