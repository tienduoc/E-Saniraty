<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/23/2018
  Time: 4:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="d" items="${deals}">
    ${d.id}<br>
    ${d.orderId}<br>
    <fmt:formatDate value="${d.requestDate}" pattern="dd-MM-yyyy"/><br>
    ${d.responseDateDate}<br>
    <c:choose>
        <c:when test="${d.contructorApprove == true && d.bossApprove == false}">
            Đợi xác nhận
        </c:when>
        <c:when test="${d.contructorApprove == true && d.bossApprove == true}">
            Đã chấp nhận
        </c:when>
    </c:choose>
</c:forEach>
</body>
</html>
