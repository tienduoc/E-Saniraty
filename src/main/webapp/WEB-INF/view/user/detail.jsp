<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/13/18
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../template/head-tag__user.jsp">
    <jsp:param name="title" value="THE SANI - Trang chủ" />
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp"%>

<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Chi tiết sản phẩm</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Chi tiết sản phẩm</a>
                </li>
            </ol>
        </div>
    </section>

    <form:form action="/product/detail" modelAttribute="product" method="get">
        <section class="section-product">
            <div class="product-info">
                <div class="container">
                    <div class="row">
                        <!-- Image column -->
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="owl-carousel">
                                        <div class='item'>
                                            <img src="${pageContext.request.contextPath}/assets/img/faucet-1.jpeg">
                                        </div>
                                    </div>
                                    <ul id='carousel-custom-dots' class='owl-dots'>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- Content coumn -->
                        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                            <div class="product-info__content">
                                <div class="row u-margin-left-none u-margin-right-none">
                                    <h2 class="heading-primary--title u-margin-top-none">${product.name}</h2>
                                    <p>
                                        <strong class="emphasize">Tình trạng:</strong>
                                        <c:choose>
                                            <c:when test="${product.unitInStock > 1}">
                                                <span class="pagragraph">Còn hàng</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="pagragraph" style="color: #ff0000">Hết hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <p>
                                        <strong class="emphasize">Kích thước:</strong>
                                        <span class="pagragraph">${product.size}</span>
                                    </p>
                                    <p>
                                        <strong class="emphasize">Chất liệu:</strong>
                                        <span class="pagragraph">${product.material}</span>
                                    </p>
                                    <p>
                                        <strong class="emphasize">Giá tiền:</strong>
                                        <span class="pagragraph">
                                        <fmt:formatNumber type="number" pattern="###,###" value="${product.salePrice}"/>
                                    </span>
                                    </p>
                                    <p>
                                        <strong class="emphasize">Mô tả:</strong>
                                        <span class="pagragraph">
                                                ${product.description}
                                        </span>
                                    </p>
                                </div>
                                <!-- Quantity selection -->
                                <div class="row">
                                    <div class="col-md-5 col-sm-6 col-xs-12">
                                        <div class="form-group">
                                            <label for="qty">
                                                <strong class="emphasize">Số lượng: </strong>
                                            </label>
                                            <input type="number" name="qty" value="1" max="${product.unitInStock}"
                                                   min="1">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <button type="submit" class="button-submit">Đặt hàng</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-product-description">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-secondary">
                            <h2 class="heading-secondary--title">Chi tiết sản phẩm
                                <span class="heading-secondary--line"></span>
                            </h2>
                            <div class="clear"></div>
                            <p class="pagragraph">
                                    ${product.review}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-product-manufacturer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-secondary">
                            <h2 class="heading-secondary--title">nhà sản xuất
                                <span class="heading-secondary--line"></span>
                            </h2>
                            <div class="clear"></div>
                            <p class="pagragraph">
                                    ${product.manufacturerByManufacturerId.name}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="section-product-leave-review">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="heading-secondary">
                            <h2 class="heading-secondary--title">Đánh giá sản phẩm
                                <span class="heading-secondary--line"></span>
                            </h2>
                            <div class="clear"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xs-12">
                            <form action="#" class="form">
                                <div class="col-md-6 form-group">
                                    <input type="text" placeholder="Họ tên" class="form__input">
                                </div>
                                <div class="col-md-6 form-group">
                                    <input type="email" placeholder="Email" class="form__input">
                                </div>
                                <div class="col-md-12 form-group">
                                    <textarea type="text" placeholder="Mời bạn để lại bình luận"
                                              class="form__input form__input--area"></textarea>
                                </div>

                                <div class="col-md-3 col-xs-12 form-group">
                                    <button type="submit" class="button-submit">Gửi</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form:form>
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