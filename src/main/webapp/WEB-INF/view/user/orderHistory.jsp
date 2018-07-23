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
<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Đơn hàng của tôi"/>
</jsp:include>
<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Đơn hàng của tôi</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Xem lại đơn hàng</a>
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
            <div class="row order">
                <!-- Cart lists -->
                <aside class="col-md-12">
                    <!-- Row heading -->
                    <div class="row u-bg-color-primary-light u-padTB-small u-margin-LR-none hidden-sm hidden-xs">
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase">Mã đơn hàng</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small text-center">
                                <strong class="text-uppercase">Ngày mua</strong>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="u-bg-color-primary-light u-padTB-small text-center">
                                <strong class="text-uppercase">Tên sản phẩm</strong>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3">
                            <div class="u-bg-color-primary-light u-padTB-small text-center">
                                <strong class="text-uppercase">Số lượng</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small">
                                <strong class="text-uppercase text-center">Tổng tiền</strong>
                            </div>
                        </div>
                    </div>
                    <c:forEach var="o" items="${orders}">
                        <!-- Item row -->
                        <div class="row order__row u-margin-LR-none">
                            <!-- ID -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <div class="order__cell">
                                        <p class="order__cell--box-info text-left">
                                            <a href="${pageContext.request.contextPath}/order/view?orderId=${o.id}"><strong>${o.id}</strong></a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Date -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <div class="order__cell">
                                        <p class="order__cell--box-info text-center">
                                            <fmt:formatDate value="${o.date}" pattern="dd-MM-yyy"/>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <!-- Product name -->
                            <div class="col-lg-3 col-lg-offset-0 col-md-5 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <p class="order__cell--box-info text-left">
                                            <c:forEach var="od" items="${o.orderDetailsById}">
                                            ${od.productByProductId.name}</br>
                                            </c:forEach>
                                    </p>
                                </div>
                            </div>
                            <!-- Product name -->
                            <div class="col-lg-3 col-lg-offset-0 col-md-5 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <p class="order__cell--box-info text-center">
                                        <c:forEach var="od" items="${o.orderDetailsById}">
                                            ${od.quantity}</br>
                                        </c:forEach>
                                    </p>
                                </div>
                            </div>
                            <!-- Price -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <p id="totalPrice" class="order__cell--box-info text-left">
                                        <fmt:formatNumber pattern="###,###" value="${o.totalPrice}"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </aside>
                <!-- Deal Buttons  -->
                <aside class="col-lg-6 col-lg-offset-6 col-md-6 col-md-offset-6 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
                    <!-- Checkout wrapper -->
                    <div class="total">
                        <!-- Row -->
                        <div class="row total__row">
                            <div class="col-md-6 total__cell">
                                <p class="total__cell--heading">Tổng cộng:</p>
                                <p class="total__cell--sub">1.970.000d</p>
                            </div>
                        </div>
                        <!-- Buttons -->
                        <div class="row total__row">
                            <div class="col-lg-6 col-lg-offset-6 col-md-6 col-md-offset-6 col-sm-6 col-sm-offset-6 col-xs-12 col-xs-offset-0">
                                <a href="${pageContext.request.contextPath}/" class="button button--black">Trở về trang chủ
                                </a>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>
