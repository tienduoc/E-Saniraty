<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/18/2018
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form action="detail" modelAttribute="product" method="get">
        ID: ${product.id}<br>
        Name: ${product.name}<br>
        Category: ${product.categoryByCategoryId.name}<br>
        Manufacturer: ${product.manufacturerByManufacturerId.name}<br>
        Cost price: ${product.costPrice}<br>
        Sale price: ${product.salePrice}<br>
        Material: ${product.material}<br>
        Size: ${product.size}<br>
        Weight: ${product.weight}<br>
        Unit in stock: ${product.unitInStock}<br>
        Enable:
        <c:choose>
            <c:when test="${product.enabled}">
                <div style="color: green">Enabled</div>
            </c:when>
            <c:otherwise>
                <div style="color: red">Disabled</div>
            </c:otherwise>
        </c:choose>
        Min ratio (MR): ${product.minRatio}<br>
        Ratio for contractor (RFC): ${product.raitoForContractor}<br>
        Outlet: ${product.outletEnable}<br>
        Outlet enable:
        <c:choose>
            <c:when test="${product.outletEnable}">
                <div style="color: green">Enabled</div>
            </c:when>
            <c:otherwise>
                <div style="color: red">Disabled</div>
            </c:otherwise>
        </c:choose>
        Description: ${product.description}<br>
        Review: ${product.review}<br>
    </form:form>
</body>
</html>
