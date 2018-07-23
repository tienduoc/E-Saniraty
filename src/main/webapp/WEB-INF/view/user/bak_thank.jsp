<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/18/2018
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center style="padding-top: 200px">
    <b style="color: forestgreen; font-size: 30px">Đặt hàng thành công</b><br><br>
    Đơn hàng của bạn đã được chúng tôi ghi nhận, chúng tôi sẽ giao hàng cho bạn nhanh nhất có thể <br>
    Cảm ơn bạn đã đặt hàng tại The Sani! <br><br>

    <input type="button" value="Xác nhận" onclick="window.location.href='${pageContext.request.contextPath}/'">
    </br></br>
    <hr>
    <sec:authorize access="hasAuthority('Contractor')">
        <b style="color: forestgreen; font-size: 30px">Tính năng dành riêng cho nhà thầu</b><br><br>
        <input type="button" value="Thương lượng giá sản phẩm"
               onclick="window.location.href='${pageContext.request.contextPath}/contractor/order'">
    </sec:authorize>
</center>
</body>
</html>
