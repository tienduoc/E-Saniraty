<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/13/2018
  Time: 1:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Create category</title>
</head>
<body style="margin-left: 3%">
    <form:form action="create" modelAttribute="category" method="post">
        <div class="form-group">
            <label>Parent category</label>
            <select name="parentId">
                <option value=""></option>
                <c:forEach var="p" items="${parents}">
                    <option value="${p.id}">${p.name}</option>
                </c:forEach>
            </select>
        </div>
            <%--<label>Name</label><i style="color: red">${used}</i>--%>
        <div class="form-group">
            <label>Name</label> <i style="color: red">${used}</i>
            <form:input path="name" required = "required"/>
        </div>
        <input type="submit" value="Save" />
    </form:form>
    <a href="http://localhost:8080/">Back to homepage</a>
</body>
</html>
