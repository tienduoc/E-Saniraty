<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/18/2018
  Time: 5:10 PM
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
    <form:form action="/create" modelAttribute="product" method="post">
        <%--Manùacturer--%>
        Manufacturer
        <select name="manufacturerId" required>
            <option value="">Select</option>
            <c:forEach var="m" items="${manufacturers}">
                <option value="${m.id}">${m.name}</option>
            </c:forEach>
        </select>
        <br>
        <%--Category--%>
        Category
        <select name="categoryId" required>
            <option value="">Select</option>
            <c:forEach var="c" items="${categories}">
                <option value="${c.id}">${c.name}</option>
            </c:forEach>
        </select>
        <br>
        <%--Product attributes--%>
        ID: <form:input path="id"/>
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
        Description: <form:input path="description"/>
        <br>
        <form:hidden path="enabled" value="true"/>
        <input type="submit" value="Save"/>
    </form:form>
</body>
</html>
