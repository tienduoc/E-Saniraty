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


<%@ include file="_head.jsp"%>

<body>
<%@ include file="_header.jsp"%>
<main>
    <section class="section-carousel">
        <div id="myCarousel" class="carousel slide hidden-md hidden-sm hidden-xs" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="assets/img/carousel-slide-1.jpg" alt="Los Angeles">
                </div>

                <div class="item">
                    <img src="assets/img/carousel-slide-2.jpg" alt="Chicago">
                </div>

                <div class="item">
                    <img src="assets/img/carousel-slide-3.jpg" alt="New York">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="fa fa-chevron-left carousel__left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="fa fa-chevron-right carousel__right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
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
                            <img src="http://webaashi.com/TF/html/aashi-faucets/assets/img/product/11.jpg" alt="">
                            <div class="quick-add">
                                <div class="quick-add__wrap">
                                    <ul class="quick-add__list">
                                        <li>
                                            <a href="" title="Add to wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="quickview-box-btn" title="Quick View">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cart/buy?id=${p.id}" title="Add to cart">
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
<script src="assets/js/main.js"></script>
</body>
</html>