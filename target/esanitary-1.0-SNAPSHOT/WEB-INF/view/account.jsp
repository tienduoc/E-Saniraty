<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/9/2018
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Account</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Username</th>
        <th>Fullname</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Enabled</th>
        <th>Role ID</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="acc" items="${accounts}">
        <tr>
            <td>${acc.username}</td>
            <td>${acc.fullname}</td>
            <td>${acc.phone}</td>
            <td>${acc.email}</td>
            <td>${acc.address}</td>
            <td>${acc.enabled}</td>
            <td>${acc.roleId}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
