<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 6/15/2018
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Product</title>
    <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
<c:url value="/product" var="pagedLink">
    <c:param name="p" value="~"/>
</c:url>

<%--Link--%>
<a style="font-size: x-large" href="/product/create">Add product</a>

<table border="1">
    <thead>
    <tr>
        <th width="3%">ID</th>
        <th width="20%">Name</th>
        <th>Category</th>
        <th>Cost price</th>
        <th>Sale price</th>
        <th>Enable</th>
        <th>MR</th>
        <th>RFC</th>
        <th>Outlet</th>
        <th>Outlet enable</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${pagedListHolder.pageList}">
    <tr>
        <td>${p.id}</td>
        <td>${p.name}</td>
        <td>${p.categoryByCategoryId.name}</td>
        <td>
            <fmt:formatNumber type="number" maxFractionDigits="5" var="costPrice" value="${p.costPrice}"/>
            <c:out value="${fn:replace(costPrice, ',', '.')}" />
        </td>
        <td>
            <fmt:formatNumber type="number" maxFractionDigits="5" var="salePrice" value="${p.salePrice}"/>
            <c:out value="${fn:replace(salePrice, ',', '.')}"/>
        </td>
        <td>
        <c:choose>
            <c:when test="${p.enabled}">
                <p style="color: green">Yes</p>
            </c:when>
            <c:otherwise>
                <p style="color: red">No</p>
            </c:otherwise>
        </c:choose>
        </td>
        <td>${p.minRatio}</td>
        <td>${p.raitoForContractor}</td>
        <td>${p.outlet}</td>
        <td>
        <c:choose>
            <c:when test="${p.outletEnable}">
                <p style="color: green">Yes</p>
            </c:when>
            <c:otherwise>
                <p style="color: red">No</p>
            </c:otherwise>
        </c:choose>
        </td>
        <td>
            <c:url var="updateLink" value="/product/update">
                <c:param name="id" value="${p.id}" />
            </c:url>
            <c:url var="detailLink" value="/product/detail">
                <c:param name="id" value="${p.id}"/>
            </c:url>
            <a href="${detailLink}">Detail</a> | <a href="${updateLink}">Update</a>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<div style="margin: 0 auto">
    <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}" />
</div>
</body>
</html>