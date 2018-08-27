/* Abstract class for a variable
 * To use: Implement a sub class and the function getEvaluateValue
   must be ovverided
 */
package com.fpt.esanitary.controller.user.proposal;
public class Variable {
    Domain domain; // domain it belongs to
    Element value; // it's value

    public Domain getDomain() {
        return domain;
    }
    public void setDomain(Domain domain) {
        this.domain = domain;
    }
    public Element getValue() {
        return value;
    }
    public void setValue(Element value) {
        this.value = value;
    }
}
