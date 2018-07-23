<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Cảm ơn"/>
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Cảm ơn bạn đã mua hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                </li>
            </ol>
        </div>
    </section>
    Mã số đơn hàng của bạn là: <a href="${pageContext.request.contextPath}/order/view?orderId=${orderId}">${orderId}</a>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
