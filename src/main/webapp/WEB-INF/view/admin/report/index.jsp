<%--
  Created by IntelliJ IDEA.
  User: SYSTEM
  Date: 8/8/2018
  Time: 9:25 PM
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
<form action="/admin/report" method="post">
Từ ngày: <input type="date" name="fromDate" value="08/03/2018">
Đến ngày: <input type="date" name="untilDate" value="08/07/2018">
    <input type="submit" value="Đồng ý">
</form>
<c:set var="saleTotal" value="0"/>
<c:set var="paidTotal" value="0"/>
<c:forEach items="${orderBetweendate}" var="order">
    <c:set var="saleTotal" value="${saleTotal + order.totalPrice}"/>
    <c:set var="paidTotal" value="${paidTotal + order.totalPaid}"/>

    ${order.id} |
    ${order.date} |
    <fmt:formatNumber value="${order.totalPrice}" pattern="###,###"/> |
    <fmt:formatNumber value="${order.totalPaid}" pattern="###,###"/> <br>
</c:forEach>
<hr>
Tổng số đơn hàng: ${numTotalOrder}<br>
Tổng số đơn hàng thành công: ${numOrderSuccess}<br>

Tổng giá trị đơn hàng: <fmt:formatNumber value="${saleTotal}" pattern="###,###"/> <br>
Tổng số tiền đã thu: <fmt:formatNumber value="${paidTotal}" pattern="###,###"/> <br>
Tổng số tiền phải thu: <fmt:formatNumber value="${saleTotal - paidTotal}" pattern="###,###"/>

<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
</body>
</html>
