<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/14/18
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="Danh mục sản phẩm" />
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp"%>

<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Danh mục sản phẩm</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Danh mục sản phẩm</a>
                </li>
            </ol>
        </div>
    </section>

    <section class="section-product">
        <div class="container">
            <!-- Sorting -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="product-sorting">
                        <div class="col-md-10 col-sm-10 col-xs-12">
                            <div class="row">
                                <form>
                                    <div class="col-md-8 col-sm-6 col-xs-12">
                                        <select name="orderby" class="orderby">
                                            <option value="menu_order" selected="selected">Default sorting</option>
                                            <option value="popularity">Sort by popularity</option>
                                            <option value="rating">Sort by average rating</option>
                                            <option value="date">Sort by newness</option>
                                            <option value="price">Sort by price: low to high</option>
                                            <option value="price-desc">Sort by price: high to low</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <select name="countby" class="countby">
                                            <option value="12">12</option>
                                            <option value="15">15</option>
                                            <option value="18">18</option>
                                            <option value="21">21</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <p class="product-result-count">Showing all 12 </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Products -->
            <div class="row">
                <!-- Product item -->
                <c:forEach var="p" items="${products}">
                <div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                    <div class="product">
                        <div class="product__thumbnail">
                            <img src="http://webaashi.com/TF/html/aashi-faucets/assets/img/product/11.jpg" alt="">
                            <div class="quick-add">
                                <div class="quick-add__wrap">
                                    <ul class="quick-add__list">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/cart/add?id=${p.id}" title="Add to cart">
                                                <i class="fa fa-shopping-basket"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="product__info">
                            <h2 class="product__info--title u-ellipsis">
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

            <div class="clear"></div>
            <div class="col-md-12">
                <!-- Paging -->
                <div class="styled-pagination padB30 text-center">
                    <ul>
                        <li><a class="prev" href="#"><i class="fa fa-angle-left"></i></a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#" class="active">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a class="next" href="#"><i class="fa fa-angle-right"></i></a></li>
                    </ul>
                </div>
                <!--//==Pagination End==//-->
            </div>
        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

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