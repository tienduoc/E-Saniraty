<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/19/2018
  Time: 12:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="order" modelAttribute="order" method="get">
    <c:forEach var="o" items="${order}">
        <c:if test="${o.closed == false}">
            ${o.id}<br>
            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${o.date}"/> <br>
            <fmt:formatNumber type="number" pattern="###,###" value="${o.totalPrice}"/> <br>
            <a href="${pageContext.request.contextPath}/contractor/deal?orderId=${o.id}">Thương lượng</a>
            <hr>
        </c:if>
    </c:forEach>
</form:form>
</body>
</html>
