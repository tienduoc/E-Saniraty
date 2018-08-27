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

            <!-- Products -->
            <div class="row">
                <!-- Product item -->
                <c:forEach var="p" items="${products}">
                <div class="col-lg-3 col-lg-offset-0 col-md-4 col-md-offset-0 col-sm-6 col-sm-offset-0 col-xs-12 col-xs-offset-0">
                    <div class="product">
                        <div class="product__thumbnail">
                            <c:forEach var="img" items="${p.productImagesById}">
                                <c:if test="${img.mainPhoto}">
                                    <img src="${pageContext.request.contextPath}/assets/img/products/${img.url}" alt="">
                                </c:if>
                            </c:forEach>
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

        </div>
    </section>
</main>

<%@ include file="../template/footer-tag__user.jsp" %>

</body>
</html>