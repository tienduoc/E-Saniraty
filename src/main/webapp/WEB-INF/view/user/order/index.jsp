<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/20/18
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đơn hàng của tôi"/>
</jsp:include>
<body>
<%@ include file="../../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Đơn hàng của tôi</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="${pageContext.request.contextPath}/">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/order">Xem lại đơn hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Đơn đặt hàng của tôi
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-cart">
        <div class="container">
            <div class="row">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="u-bg-color-primary-light">
                        <tr class="text-uppercase">
                            <th class="text-center">Mã đơn hàng</th>
                            <th class="text-center">Ngày mua</th>
                            <th class="text-center">Tên sản phẩm</th>
                            <th class="text-center">Tuỳ chọn</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="o" items="${orders}">
                            <tr>
                                <td style="padding-left: 15px">${o.id}</td>
                                <td class="text-center"><fmt:formatDate value="${o.date}" pattern="dd/MM/yyyy"/></td>
                                <td class="text-justify">
                                    <c:forEach var="od" items="${o.orderDetailsById}">
                                        ${od.productByProductId.name}</br>
                                    </c:forEach>
                                </td>
                                <td class="text-right">
                                    <c:if test="${!o.closed}">
                                        <sec:authorize access="hasAnyAuthority('Contractor')">
                                            <a href="${pageContext.request.contextPath}/deal/create?orderId=${o.id}">Thương lượng</a> |
                                        </sec:authorize>
                                        <a href="${pageContext.request.contextPath}/order/update?orderId=${o.id}">Sửa</a> |
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/order/view?orderId=${o.id}">Chi tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</main>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>
