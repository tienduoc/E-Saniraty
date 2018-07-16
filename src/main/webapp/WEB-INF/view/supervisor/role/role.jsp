<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/9/2018
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Role</title>
</head>
<body>
    <h2>Role</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="role" items="${roles}">
                <tr>
                    <td>${role.id}</td>
                    <td>${role.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
