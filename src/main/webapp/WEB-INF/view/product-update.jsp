<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/18/2018
  Time: 6:38 PM
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
<form:form action="/product/update" modelAttribute="product" method="post">
    ID: ${product.id}
    <form:hidden path="id"/>
    <br>
    Name: <form:input path="name"/>
    <br>
    Cost price: <form:input path="costPrice"/>
    <br>
    Sale price: <form:input path="salePrice"/>
    <br>
    Material: <form:input path="material"/>
    <br>
    Size: <form:input path="size"/>
    <br>
    Weight: <form:input path="weight"/>
    <br>
    Unit in stock: <form:input path="unitInStock"/>
    <br>
    Enable: <form:checkbox value="${product.enabled}" path="enabled"></form:checkbox>
    <br>
    Min ratio (MR): <form:input path="minRatio"/>
    <br>
    Ratio for contractor (RFC): <form:input path="raitoForContractor"/>
    <br>
    <%--Manùacturer--%>
    Manufacturer
    <select name="manufacturerId" required>
        <option value="">Select</option>
        <c:forEach var="m" items="${manufacturers}">
            <option value="${m.id}" ${m.id == product.manufacturerByManufacturerId.id ? 'selected="selected"' : ''}>${m.name}</option>
        </c:forEach>
    </select>
    <br>
    <%--Category--%>
    Category
    <select name="categoryId" required>
        <option value="">Select</option>
        <c:forEach var="c" items="${categories}">
            <option value="${c.id}" ${c.id == product.categoryByCategoryId.id ? 'selected="selected"' : ''}>${c.name}</option>
        </c:forEach>
    </select>
    <br>
    Description: <form:input path="description"/>
    <br>
    Review: <form:input path="review"/>
    <br>
    Outlet: <form:input path="outlet"/>
    <br>
    Outlet enable: <form:checkbox value="${product.outletEnable}" path="outletEnable"></form:checkbox>
    <input type="submit" value="Save"/>
</form:form>
</body>
</html>
