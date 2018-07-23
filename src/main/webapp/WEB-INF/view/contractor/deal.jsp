<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/9/2018
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Thương lượng"/>
</jsp:include>
<body>
<%@ include file="../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Thương lượng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Thương lượng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Thương lượng giá </br></br>
                            đơn hàng: ${order.id}
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <form:form action="/contractor/dealRequest" method="post">
        <input type="hidden" name="orderId" value="${order.id}">
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
                                    <strong class="text-uppercase text-left">Sản phẩm</strong>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <div class="u-bg-color-primary-light u-padTB-small text-left">
                                    <strong class="text-uppercase">Giá bán</strong>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <div class="u-bg-color-primary-light u-padTB-small text-center">
                                    <strong class="text-uppercase">Giá thương lượng</strong>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-2">
                                <div class="u-bg-color-primary-light u-padTB-small text-left">
                                    <strong class="text-uppercase">Số lượng</strong>
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
                                            <fmt:formatNumber type="number" pattern="###,###" value="${od.unitPrice}"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- Item column -- Product new price -->
                                <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                    <div class="order__cell">
                                        <input name="contractorPrice" type="text"/>
                                    </div>
                                </div>
                                <!-- Item column -- Product quantity -->
                                <div class="col-lg-2 col-lg-offset-0 col-md-2 col-md-offset-0 col-sm-12 col-xs-offset-0 col-xs-12">
                                    <div class="order__cell">
                                        <p class="text-left">
                                                ${od.quantity}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </aside>

                    Nội dung thương lượng
                    <textarea name="message" rows="4" cols="50"></textarea>

                    <!-- Deal Buttons  -->
                    <aside class="col-lg-6 col-lg-offset-6 col-md-6 col-md-offset-6 col-sm-10 col-sm-offset-1 col-xs-12 col-xs-offset-0">
                        <!-- Checkout wrapper -->
                        <div class="total">
                            <!-- Row -->
                            <div class="row total__row">
                                <div class="col-md-6 total__cell">
                                    <p class="total__cell--heading">Tổng cộng:</p>
                                    <p class="total__cell--sub">
                                        88888888
                                    </p>
                                </div>
                            </div>
                            <!-- Row -->
                            <div class="row total__row">
                                <div class="col-md-6 total__cell">
                                    <p class="total__cell--heading">Giá mong muốn:</p>
                                    <p class="total__cell--sub">1.520.000d</p>
                                </div>
                            </div>
                            <!-- Buttons -->
                            <div class="row total__row">
                                <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                    <button type="button" class="btn button--submit col-xs-12"
                                            style="color: black;; text-transform: uppercase;">Huỷ thương lượng
                                    </button>
                                </div>
                                <div class="col-lg-6 col-lg-offset-0 col-md-6 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                                        <%--<button type="submit" class="btn button--black col-xs-12">Gửi yêu cầu</button>--%>
                                    <input type="submit" class="btn btn-primary" value="Gửi yêu cầu">
                                </div>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </section>
    </form:form>

</main>
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/main.js"></script>
</body>
</html>