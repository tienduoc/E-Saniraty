<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/13/2018
  Time: 10:11 AM
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
SEARCH CATEGORY

<form:form action="${pageContext.request.contextPath}/category/search" method="get">
    <input type="text" name="q" placeholder="Search" required=""
           oninvalid="this.setCustomValidity('Please Enter keyword')"
           oninput="setCustomValidity('')">
    <button type="submit">Search</button>
</form:form>

<%-- Not found message--%>
<div style="color: red; font-style: italic">${notFound}</div>

<c:if test="${catSearchResult.size() > 0}">
    <table>
        <thead>
        <tr>
            <td>STT</td>
            <td>Name</td>
            <td>Parent ID</td>
        </tr>
        </thead>
        <tbody>
        <c:set var="count" value="0" scope="page" />
        <c:forEach var="cat" items="${catSearchResult}">
            <c:set var="count" value="${count + 1}" scope="page"/>
            <tr>
                <td>${count}</td>
                <td>${cat.name}</td>
                <td>${cat.parentId}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<a href="http://localhost:8080/">Back to homepage</a>
</body>
</html>
