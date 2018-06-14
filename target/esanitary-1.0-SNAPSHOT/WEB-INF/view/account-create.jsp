<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/14/2018
  Time: 8:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Create Account</title>
</head>
<body style="margin-left: 3%">
<form:form action="create" modelAttribute="account" method="POST">

    <!-- associate this data with customer id -->
    <%--<form:hidden path="username" />--%>
    <form:hidden path="enabled" value="true" />

    <table>
        <tbody>
        <tr>
            <td><label>Username:</label><td>
            <td><form:input path="username" /></td>
        </tr>
        <tr>
            <td><label>Password:</label><td>
            <td><form:password path="password" /></td>
        </tr>
        <tr>
            <td><label>Name:</label><td>
            <td><form:input path="fullname" /></td>
        </tr>
        <tr>
            <td><label>Phone:</label><td>
            <td><form:input path="phone" /></td>
        </tr>
        <tr>
            <td><label>Email:</label><td>
            <td><form:input path="email" /></td>
        </tr>
        <tr>
            <td><label>Address:</label><td>
            <td><form:input path="address" /></td>
        </tr>
        <tr>
            <td><label>Role:</label><td>
            <td>
                <select name="roleId" required>
                    <option value="">None</option>
                    <c:forEach var="r" items="${roles}">
                        <c:if test="${!(r.name.equalsIgnoreCase('Boss') || r.name.equalsIgnoreCase('Admin'))}">
                            <option value="${r.id}">${r.name}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="Save" class="save"/></td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>