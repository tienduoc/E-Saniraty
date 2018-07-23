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
    <jsp:param name="title" value="Giỏ hàng"/>
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Giỏ hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Giỏ hàng</a>
                </li>
            </ol>
        </div>
    </section>

    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Thông tin giỏ hàng
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    ${msg}
    <section class="section-cart">
        <div class="container">
            <div class="row order">
                <!-- Cart lists -->
                <aside class="col-lg-8 col-lg-offset-0 col-md-7 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
                    <!-- Item row -->
                    <form:form action="/cart/update" method="post" name="update">
                        <%--<button type="submit" style="margin-left: 682px">Cập nhật</button>--%>
                        <c:set var="sum" value="0"></c:set>
                        <c:forEach var="item" items="${sessionScope.cart}">
                            <c:set var="sum" value="${sum + item.product.salePrice * item.quantity }"></c:set>
                            <div class="row order__row u-margin-LR-none">
                                <!-- Item column -- Product image -->
                                <div class="col-lg-1 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-4 col-sm-offset-4 col-xs-4 col-xs-offset-4 u-padding-LR-none">
                                    <div class="order__cell">
                                        <img src="https://images.homedepot-static.com/productImages/914a1d80-6efb-4772-bcc3-3ef5543e6c08/svn/chrome-delta-bar-faucets-b28911lf-64_1000.jpg"
                                             alt="">
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <!-- Item column -- Product name -->
                                <input type="hidden" name="id" value="${item.product.id}">
                                <div class="col-lg-6 col-lg-offset-0 col-md-5 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                    <div class="order__cell">
                                        <p class="order__cell--box-info">
                                            <a href="${rootUrl}/product/detail?id=${item.product.id}">${item.product.name}</a>
                                        </p>
                                        <p class="order__cell--box-info">
                                            Nhãn hiệu: ${item.product.manufacturerByManufacturerId.name}
                                        </p>
                                    </div>
                                    <p>
                                        <a href="${pageContext.request.contextPath}/cart/remove?id=${item.product.id}">
                                            <i class="fa fa-trash" aria-hidden="true"></i>
                                        </a>
                                    </p>
                                </div>
                                <!-- Item column -- Product price -->
                                <div class="col-lg-2 col-lg-offset-0 col-md-3 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                    <div class="order__cell">
                                        <p class="order__cell--box-info">
                                            <fmt:formatNumber type="number" pattern="###,###" value="${item.product.salePrice}"/>
                                        </p>
                                    </div>
                                </div>
                                <!-- Item column -- Product quantity -->
                                <div class="col-lg-3 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-4 col-sm-offset-4 col-xs-offset-4 col-xs-4">
                                    <div class="order__cell">
                                        <div class="input-group">
                                    <span class="input-group-btn">
                                        <button type="submit" class="quantity-left-minus btn button--black" data-type="minus" data-field="">
                                          <span class="fa fa-minus"></span>
                                        </button>
                                    </span>
                                            <input type="text" id="quantity" name="quantity" onchange="submit()" class="form-control input-number" value="${item.quantity}" pattern="^\d{1,3}$" title="Số lượng từ 1-999">
                                            <span class="input-group-btn">
                                        <button type="submit" class="quantity-right-plus btn button--black"
                                                data-type="plus" data-field="">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                    </span>
                                        </div>
                                            <%--<input name="quantity" type="text" value="${item.quantity}" pattern="^\d{1,3}$" title="Số lượng từ 1-999">--%>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </form:form>
                </aside>
                <!-- Checkout  -->
                <aside class="col-lg-4 col-lg-offset-0 col-md-5 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0 u-padding-LR-none">
                    <form:form action="/cart/buy" method="post">
                        <!-- Checkout wrapper -->
                        <div class="total">
                            <!-- Row -->
                            <div class="row total__row">
                                <div class="col-md-6 total__cell">
                                    <p class="total__cell--heading">Tổng cộng:</p>
                                    <p class="total__cell--sub">
                                        <input type="hidden" name="totalPrice" value="${sum}">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${sum}"/>
                                    </p>
                                </div>
                            </div>
                            <!-- Buttons -->
                            <div class="row total__row">
                                <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                    <a href="${pageContext.request.contextPath}/">
                                        <button type="button" class="btn button--black col-xs-12">
                                            Về trang chủ
                                        </button>
                                    </a>
                                </div>
                                <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                    <button type="submit" class="btn button--black col-xs-12">Đặt hàng</button>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </aside>
            </div>
        </div>
    </section>
</main>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/main.js"></script>
<script>
    <%-- Keep vertical scrollbar position --%>
    $(window).scroll(function () {
        sessionStorage.scrollTop = $(this).scrollTop();
    });

    $(document).ready(function () {
        if (sessionStorage.scrollTop != "undefined") {
            $(window).scrollTop(sessionStorage.scrollTop);
        }
    });
</script>
</body>
</html>