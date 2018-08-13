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
    <jsp:param name="title" value="Đề xuất mua hàng" />
</jsp:include>

<body>
<%@ include file="../template/header-tag__user.jsp"%>

<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Đề xuất mua hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Đề xuất mua hàng</a>
                </li>
            </ol>
        </div>
    </section>

    <section class="section-product">
        <div class="container">
            <div class="row">
                <!--//=========Product Sorting Section Start=========//-->
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="product-sorting">
                        <div class="col-md-10 col-sm-10 col-xs-12">
                            <div class="row">
                                <form>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select multiple="multiple" id="my-select">
                                            <option value='elem_1'>elem 1</option>
                                            <option value='elem_2'>elem 2</option>
                                        </select>
                                    </div>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <input type="number" name="" id="">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <button class="btn btn-primary btn-block">Xin đề xuất</button>
                        </div>
                    </div>
                </div>


            </div>

            <!-- Products -->
            <div class="row">
                <!-- Product item -->
                <c:forEach var="p" items="${listProduct1}">
                    <div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                        <form action="/cart/add" method="get">
                            <input type="hidden" name="id" value="${p.id}" />
                            <div class="product">
                                <div class="product__thumbnail">
                                    <c:forEach var="img" items="${p.productImagesById}">
                                        <c:choose>
                                            <c:when test="${img.productId.equals(p.id) && img.mainPhoto == true}">
                                                <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}"
                                                     alt="">
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <div class="quick-add">
                                        <div class="quick-add__wrap">
                                            <ul class="quick-add__list">
                                                <li>
                                                    <a id="add" href="${pageContext.request.contextPath}/cart/add?id=${p.id}" title="Add to cart">
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
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>


</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

</body>
</html>