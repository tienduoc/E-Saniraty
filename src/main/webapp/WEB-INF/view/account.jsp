<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/9/2018
  Time: 4:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<html>
<head>
    <title>Account</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body style="width: 80%; margin: 0 auto">
    <p class="display-3">ACCOUNT MANAGEMENT</p>
    <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
    <c:url value="/account" var="pagedLink">
        <c:param name="p" value="~"/>
    </c:url>
    <table class="table table-responsive-sm">
        <thead>
            <tr>
                <th scope="col">Username</th>
                <th scope="col">Name</th>
                <th scope="col">Phone</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Enabled</th>
                <th scope="col">Role</th>
            </tr>
        </thead>
        <c:forEach var="acc" items="${pagedListHolder.pageList}">
            <tbody>
                <tr>
                    <td>${acc.username}</td>
                    <td>${acc.fullname}</td>
                    <td>${acc.phone}</td>
                    <td>${acc.email}</td>
                    <td>${acc.address}</td>
                    <td>${acc.enabled}</td>
                    <td>${acc.roleId}</td>
                </tr>
            </tbody>
        </c:forEach>
    </table>
    <div style="margin: 0 auto">
        <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
    </div>
</body>
</html>
