<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/10/2018
  Time: 1:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Search account</title>
</head>
<body>
    SEARCH ACCOUNT

    <form:form action="${pageContext.request.contextPath}/account/search" method="get">
        <input type="text" name="q" placeholder="Search" required=""
               oninvalid="this.setCustomValidity('Please Enter keyword')"
               oninput="setCustomValidity('')">
        <button type="submit">Search</button>
    </form:form>

    <%-- Not found message--%>
    <div style="color: red; font-style: italic">${notFound}</div>

    <c:if test="${accSearchResult.size() > 0}">
    <table>
        <thead>
            <tr>
                <td>STT</td>
                <td>Username</td>
                <td>Fullname</td>
                <td>Phone</td>
                <td>Email</td>
                <td>Address</td>
                <td>Enabled</td>
                <td>Role</td>
            </tr>
        </thead>
        <tbody>
            <c:set var="count" value="0" scope="page" />
            <c:forEach var="acc" items="${accSearchResult}">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <tr>
                    <td>${count}</td>
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
    </c:if>
    <a href="http://localhost:8080/">Back to homepage</a>
</body>
</html>
