<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/12/2018
  Time: 10:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<html>
<head>
    <title>Category</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body style="width: 80%; margin: 0 auto">
    <p class="display-3">CATEGORY</p>
    <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
    <c:url value="/category" var="pagedLink">
        <c:param name="p" value="~"/>
    </c:url>
    <table class="table table-responsive-sm">
        <thead>
            <tr>
                <th scope="col">Index</th>
                <th scope="col">Name</th>
                <th scope="col">Parent</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="count" value="0" scope="page" />
            <c:forEach var="cat" items="${pagedListHolder.pageList}">
                <c:set var="count" value="${count + 1}" scope="page"/>
                <tr>
                    <td>${count}</td>
                    <td>${cat.name}</td>
                    <td>${cat.categoryByParentId.name}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
    <a href="http://localhost:8080/">Back to homepage</a>
</body>
</html>
