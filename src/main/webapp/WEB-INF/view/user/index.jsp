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
    <jsp:param name="title" value="THE SANI - Trang chủ" />
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp"%>

<main>
    <section class="section-carousel">
        <div class="owl-carousel">
            <div class="item">
                <img src="assets/img/carousel-slide-1.jpg">
            </div>
            <div class="item">
                <img src="assets/img/carousel-slide-2.jpg">
            </div>
            <div class="item">
                <img src="assets/img/carousel-slide-3.jpg">
            </div>
        </div>
        <ul id="carousel-custom-dots" class="owl-dots">
        </ul>
    </section>

    <section class="section-features">
        <div class="container">
            <div class="row">
                <!-- A feature -->
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="panel__title">
                                <img src="assets/img/icon-featured-shop-1.png" alt="Giao hàng miễn phí">Giao hàng miễn phí
                            </div>
                            <p class="panel__desc">Miễn phí giao hàng với đơn hàng trên 5.000.000đ</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="panel__title">
                                <img src="assets/img/icon-featured-shop-2.png" alt="Cam kết chính hãng"> Cam kết chính hãng</div>
                            <p class="panel__desc">Sản phẩm chính hãng và được bảo hành của hãng</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="panel__title">
                                <img src="assets/img/icon-featured-shop-3.png" alt="Chiết khấu hấp dẫn"> Chiết khấu hấp dẫn</div>
                            <p class="panel__desc">Luôn có mức chiết khấu tốt nhất cho khách hàng</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="panel__title">
                                <img src="assets/img/icon-featured-shop-4.png" alt="Thanh toán đơn giản"> Thanh toán đơn giản</div>
                            <p class="panel__desc">Có nhiều phương thức để quý khách lựa chọn</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section-product">
        <div class="container">
            <!-- Introducing of products categogies -->
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-primary">
                        <h2 class="heading-primary--title">
                            <c:out value="${title1}"/>
                            <span class="heading-primary--line"></span>
                        </h2>
                        <div class="clear"></div>
                        <em class="heading-primary--sub">Mô tả ngắn về danh mục sản phẩm
                        </em>
                    </div>
                </div>
            </div>

            <!-- Products -->
            <div class="row">
                <!-- Product item -->
                <c:forEach var="p" items="${listProduct1}">
                <div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                    <div class="product">
                        <div class="product__thumbnail">
                            <c:forEach var="img" items="${p.productImagesById}">
                                <c:choose>
                                    <c:when test="${img.productId.equals(p.id) && img.mainPhoto == true}">
                                        <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}" alt="">
                                    </c:when>
                                </c:choose>
                            </c:forEach>
                            <div class="quick-add">
                                <div class="quick-add__wrap">
                                    <ul class="quick-add__list">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cart/buy?id=${p.id}" title="Thêm vào giỏ hàng">
                                                <i class="fa fa-shopping-basket"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="product__info u-ellipsis">
                            <h2 class="product__info--title">
                                <a href="${pageContext.request.contextPath}product/detail?id=${p.id}">${p.name}</a>
                            </h2>
                            <span class="product__info--price">
                                <fmt:formatNumber type="number" pattern="###,###" value="${p.salePrice}"/>
                            </span>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        </div>
    </section>
</main>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/main.js"></script>
<script>
    //CAROUSEL

    $('.owl-carousel').owlCarousel({
        autoplay: true,
        autoplayTimeout: 5000,
        autoplayHoverPause: true,
        loop: true,
        margin: 100,
        slideTransition: 'ease-in-out',
        touchDrag: true,
        autoWidth: true,
        dotsContainer: '#carousel-custom-dots',
        center: true,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 1
            },
            1000: {
                items: 1
            }
        }
    })
</script>
</body>
</html>