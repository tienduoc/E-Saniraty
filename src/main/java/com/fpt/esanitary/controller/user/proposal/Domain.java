/* Class for a domain. 
   This class is an ArrayList to access each element using an integral index
* @author SuTV
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
        // sort tang dan ve cost- muon sort giam dan thi tu viet code thay dong nay
        Collections.sort(collection);
        this.addAll(collection);
    }

    
}