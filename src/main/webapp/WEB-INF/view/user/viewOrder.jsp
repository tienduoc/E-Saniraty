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
    <jsp:param name="title" value="Xem lại giỏ hàng"/>
</jsp:include>
<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Xem lại giỏ hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Xem lại giỏ hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Chi tiết đơn hàng: ${order.id}
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
                        <div class="col-lg-1 col-md-1"></div>
                        <div class="col-lg-5 col-md-5">
                            <div class="u-bg-color-primary-light u-padTB-small text-left">
                                <strong class="text-uppercase">Sản phẩm</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small text-left">
                                <strong class="text-uppercase">Đơn giá</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small text-center">
                                <strong class="text-uppercase">Số lượng</strong>
                            </div>
                        </div>
                        <div class="col-lg-2 col-md-2">
                            <div class="u-bg-color-primary-light u-padTB-small text-left">
                                <strong class="text-uppercase">Thành tiền</strong>
                            </div>
                        </div>
                    </div>
                    <!-- Item row -->
                    <c:forEach var="od" items="${order.orderDetailsById}">
                        <div class="row order__row u-margin-LR-none">
                            <!-- Item column -- Product image -->
                            <div class="col-lg-1 col-lg-offset-0 col-md-1 col-md-offset-0 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4 u-padding-LR-none">
                                <div class="order__cell">
                                    <a href="product-detail.html">
                                        <img src="https://images.homedepot-static.com/productImages/914a1d80-6efb-4772-bcc3-3ef5543e6c08/svn/chrome-delta-bar-faucets-b28911lf-64_1000.jpg"
                                             alt="">
                                    </a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <!-- Item column -- Product name -->
                            <div class="col-lg-5 col-lg-offset-0 col-md-5 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <p class="order__cell--box-info text-left">
                                        <a href="product-detail.html">${od.productByProductId.name}</a>
                                    </p>
                                </div>
                            </div>
                            <!-- Item column -- Product price -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <div class="order__cell">
                                        <fmt:formatNumber pattern="###,###" value="${od.unitPrice}"/>
                                    </div>
                                </div>
                            </div>
                            <!-- Item column -- Product new price -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <p class="text-center">${od.quantity}</p>
                                </div>
                            </div>
                            <!-- Item column -- Product quantity -->
                            <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                <div class="order__cell">
                                    <fmt:formatNumber pattern="###,###" value="${od.unitPrice * od.quantity}"/>
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
                                <p class="total__cell--sub">
                                    <fmt:formatNumber pattern="###,###" value="${order.totalPrice}"/>
                                </p>
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