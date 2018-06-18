
<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/14/2018
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Account detail</title>
</head>
<body>
    <form:form action="detail" modelAttribute="account" method="get">
        ${account.username}
        <br>
        ${account.fullname}
        <br>
        ${account.phone}
        <br>
        ${account.email}
        <br>
        ${account.address}
        <br>
        <c:choose>
            <c:when test="${account.enabled}">
                <div style="color: green">Enabled</div>
            </c:when>
            <c:otherwise>
                <div style="color: red">Disabled</div>
            </c:otherwise>
        </c:choose>
        ${account.roleByRoleId.name}
    </form:form>
</body>
</html>
